shopt -s globstar
shopt -s dotglob

stow -d /nix/persist/home/user/.dotfiles/ -t ~/ files atuin bat cava fcitx5 kitty lazygit lsd mpd ncmpcpp neomutt newsboat nvim qutebrowser rmpc Thunar tmux yazi --adopt

ln -sfn ~/Persistent/Documents ~/
ln -sfn ~/Persistent/Documents/Projects ~/
ln -sfn ~/Persistent/Music ~/
ln -sfn ~/Persistent/Pictures ~/
ln -sfn ~/Persistent/shared ~/
ln -sfn ~/Persistent/Videos ~/

sleep 1
mullvad connect
