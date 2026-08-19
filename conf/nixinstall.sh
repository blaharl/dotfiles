# this script is WIP. do not run!!
export DISK=/dev/###

# Finding optimal alignment
sudo parted $DISK --script \
  mklabel gpt \
  mkpart primary 0% 100% \
  unit MiB print \
  rm 1

# start over
sudo wipefs -a $DISK

# Paritioning
sudo parted $DISK --script \
  unit MiB \
  mklabel gpt \
  mkpart ESP fat32 1 513 \ # 512 + optimal alignment (Start)
  set 1 boot on \
  mkpart nix 513 100% \
  print

# Format
for i in {1..2}\
do export "PART$i"=$(lsblk -lp | grep part | grep ${DISK} | awk -v line=$i 'NR==line{print $1}');\
done;
echo $PART1; echo $PART2

# LUKS Encryption
sudo cryptsetup luksFormat $PART2

sudo cryptsetup luksOpen $PART2 cryptroot && \
  export PART2=/dev/mapper/cryptroot

sudo mkfs.fat -F 32 -n boot ${PART1}
sudo mkfs.btrfs -L nixos ${PART2}

# ls /dev/disk/by-path/*
# ls /dev/disk/by-id/*
# lsblk --ascii -o NAME,PARTUUID,LABEL,PATH,FSTYPE
# blkid

sudo parted $DISK -- unit MiB print

mount -v -t tmpfs none /mnt

mkdir -v -p /mnt/{boot,nix,etc/nixos,var/log}

mount -v $PART1 /mnt/boot -o umask=0077
mount -v $PART2 /mnt/nix

mkdir -v -p /mnt/nix/persist/{etc/nixos,var/log}

mount -v -o bind /mnt/nix/persist/etc/nixos /mnt/etc/nixos
mount -v -o bind /mnt/nix/persist/var/log /mnt/var/log

chmod -v 777 /mnt/etc/nixos

nixos-generate-config --root /mnt

sudo nixos-install --no-root-passwd

sudo chmod -v 755 /mnt/etc/nixos && reboot

boot.initrd.luks.devices."crypted".device = "/dev/disk/by-uuid/..."; >> hardware-configuration.nix
