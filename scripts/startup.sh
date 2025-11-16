shopt -s globstar
shopt -s dotglob

stow -d /nix/persist/home/user/.dotfiles/ -t ~/ files kitty mpd ncmpcpp nvim qutebrowser Thunar tmux --adopt

ln -sfn ~/Persistent/Documents ~/
ln -sfn ~/Persistent/Documents/Projects ~/
ln -sfn ~/Persistent/Music ~/
ln -sfn ~/Persistent/Pictures ~/
ln -sfn ~/Persistent/shared ~/
ln -sfn ~/Persistent/Videos ~/

sleep 1
mullvad connect
