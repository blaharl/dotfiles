shopt -s globstar
shopt -s dotglob

if [ $DEVICE_IS_PC = 1 ]; then
  ln -sfn /nix/persist/home/user/.dotfiles/hypr/.config/hypr/device/desktop.conf /nix/persist/home/user/.dotfiles/hypr/.config/hypr/include/device.conf
else
  ln -sfn /nix/persist/home/user/.dotfiles/hypr/.config/hypr/device/laptop.conf /nix/persist/home/user/.dotfiles/hypr/.config/hypr/include/device.conf
fi
ln -sfn /nix/persist/home/user/.dotfiles/hypr/.config/hypr/* /home/user/.config/hypr/
