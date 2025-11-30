#!/usr/bin/env bash

m="$1"
filename=$HOME/Persistent/Pictures/screenshots/ss$(date -u +%y%m%d)$(shuf -i 100000-999999 -n 1).png

case $m in
  "region")
    grim -g "$(slurp)" "$filename"
    wl-copy < $filename
    ;;
  "region-edit")
    grim -g "$(slurp)" "$filename"
    swappy -f "$filename"
    wl-copy < $filename
    ;;
  "window")
    grim -g "$(hyprctl activewindow | awk '$1 == "at:" {split($2, a,","); x=a[1]; y=a[2]} $1=="size:"{split($2,s,",");w=s[1];h=s[2]} END{print x","y" "w"x"h}')" "$filename"
    wl-copy < $filename
    ;;
  "window-edit")
    grim -g "$(hyprctl activewindow | awk '$1 == "at:" {split($2, a,","); x=a[1]; y=a[2]} $1=="size:"{split($2,s,",");w=s[1];h=s[2]} END{print x","y" "w"x"h}')" "$filename"
    swappy -f "$filename"
    wl-copy < $filename
    ;;
  "output")
    grim -o "$(hyprctl activeworkspace | sed -n 's/.*monitor \(.*\):/\1/p')" "$filename"
    wl-copy < $filename
    ;;
  "all")
    grim "$filename"
    wl-copy < $filename
    ;;
  *)
    echo >&2 "usage: ss.sh <region|region-edit|window|window-edit|output|all>"
    # echo >&2 $filename
    exit 1
esac
