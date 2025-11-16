shopt -s globstar
shopt -s dotglob

stow -d /nix/persist/home/user/.dotfiles/ -t ~/ files caelestia kitty mpd ncmpcpp qutebrowser Thunar tmux --adopt

ln -sfn ~/Persistent/Documents ~/
ln -sfn ~/Persistent/Documents/Projects ~/
ln -sfn ~/Persistent/Music ~/
ln -sfn ~/Persistent/Pictures ~/
ln -sfn ~/Persistent/shared ~/
ln -sfn ~/Persistent/Videos ~/

sleep 1
# ibus-daemon -drx
# sleep 1
# ibus engine hangul
stow -d /nix/persist/home/user/.dotfiles/ -t ~/ nvim --adopt
mullvad connect
