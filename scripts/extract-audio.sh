#!/usr/bin/env bash

set -uo pipefail

usage() {
    cat <<'EOF'
Usage: extract-audio.sh [-f] [-o OUTPUT_DIR] [FILE_OR_DIRECTORY ...]

Extract the first audio stream from each input. Compatible codecs are copied
without quality loss; other codecs are converted losslessly to FLAC.

If no inputs are given, supported video files in the current directory are
processed. Directories are scanned non-recursively.

Options:
  -o DIR  Write files to DIR (default: ./audio)
  -f      Overwrite existing output files
  -h      Show this help
EOF
}

output_dir=./audio
overwrite=false

while getopts ':o:fh' option; do
    case "$option" in
        o) output_dir=$OPTARG ;;
        f) overwrite=true ;;
        h)
            usage
            exit 0
            ;;
        :)
            printf 'Option -%s requires an argument.\n' "$OPTARG" >&2
            exit 2
            ;;
        \?)
            printf 'Unknown option: -%s\n' "$OPTARG" >&2
            usage >&2
            exit 2
            ;;
    esac
done
shift "$((OPTIND - 1))"

for command in ffmpeg ffprobe; do
    if ! command -v "$command" >/dev/null 2>&1; then
        printf 'Required command not found: %s\n' "$command" >&2
        exit 127
    fi
done

mkdir -p -- "$output_dir"

shopt -s nullglob nocaseglob
video_patterns=(
    '*.3gp' '*.avi' '*.flv' '*.m2ts' '*.m4v' '*.mkv' '*.mov' '*.mp4'
    '*.mpeg' '*.mpg' '*.mts' '*.ogv' '*.ts' '*.vob' '*.webm' '*.wmv'
)
inputs=()

add_directory() {
    local directory=$1 pattern

    for pattern in "${video_patterns[@]}"; do
        inputs+=("$directory"/$pattern)
    done
}

if (($# == 0)); then
    add_directory .
else
    for input in "$@"; do
        if [[ -d $input ]]; then
            add_directory "$input"
        elif [[ -f $input ]]; then
            inputs+=("$input")
        else
            printf 'Skipping missing input: %s\n' "$input" >&2
        fi
    done
fi

if ((${#inputs[@]} == 0)); then
    printf 'No input files found.\n' >&2
    exit 1
fi

successes=0
skipped=0
failures=0

for input in "${inputs[@]}"; do
    codec=$(ffprobe -v error -select_streams a:0 \
        -show_entries stream=codec_name \
        -of default=noprint_wrappers=1:nokey=1 \
        -- "$input" 2>/dev/null || true)

    if [[ -z $codec ]]; then
        printf 'Skipping (no audio stream): %s\n' "$input" >&2
        ((skipped++))
        continue
    fi

    mode=copy
    format_args=()
    case "$codec" in
        aac|alac) extension=m4a ;;
        mp1) extension=mp1 ;;
        mp2) extension=mp2 ;;
        mp3) extension=mp3 ;;
        opus) extension=opus ;;
        vorbis) extension=ogg ;;
        flac) extension=flac ;;
        ac3) extension=ac3 ;;
        eac3) extension=eac3 ;;
        dts) extension=dts ;;
        truehd)
            extension=thd
            format_args=(-f truehd)
            ;;
        wavpack) extension=wv ;;
        wmav1|wmav2|wmapro|wmalossless)
            extension=wma
            format_args=(-f asf)
            ;;
        pcm_u8|pcm_s16le|pcm_s24le|pcm_s32le|pcm_f32le|pcm_f64le|pcm_alaw|pcm_mulaw)
            extension=wav
            ;;
        pcm_s8|pcm_s16be|pcm_s24be|pcm_s32be)
            extension=aiff
            ;;
        *)
            extension=flac
            mode=flac
            ;;
    esac

    filename=${input##*/}
    stem=${filename%.*}
    [[ -n $stem ]] || stem=$filename
    output=$output_dir/$stem.$extension

    if [[ -e $output && $overwrite == false ]]; then
        printf 'Skipping (output exists): %s\n' "$output" >&2
        ((skipped++))
        continue
    fi

    if [[ $mode == copy ]]; then
        codec_args=(-c:a copy)
        description='stream copy'
    else
        codec_args=(-c:a flac)
        description='lossless FLAC conversion'
    fi

    if [[ $overwrite == true ]]; then
        overwrite_arg=-y
    else
        overwrite_arg=-n
    fi

    printf '%s -> %s [%s: %s]\n' "$input" "$output" "$description" "$codec"
    if ffmpeg -hide_banner -loglevel error "$overwrite_arg" \
        -i "$input" -map 0:a:0 -map_metadata 0 \
        "${codec_args[@]}" "${format_args[@]}" -- "$output"; then
        ((successes++))
    else
        printf 'Failed: %s\n' "$input" >&2
        ((failures++))
    fi
done

printf 'Finished: %d succeeded, %d skipped, %d failed.\n' \
    "$successes" "$skipped" "$failures"
((failures == 0))
