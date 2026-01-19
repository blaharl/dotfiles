#!/usr/bin/env bash
[ $DEVICE_IS_PC = 1 ] && host=debian || host=laptop

m="$1"
case $m in
  "b" | "boot")
    sudo nixos-rebuild boot --flake /home/user/.dotfiles/flake#$host --impure
    ;;
  "s" | "switch")
    sudo nixos-rebuild switch --flake /home/user/.dotfiles/flake#$host --impure
    ;;
  "u" | "update")
    cd ~/.dotfiles/flake; nix flake update
    ;;
  "g" | "gc")
    sudo nix-collect-garbage -d; nix-collect-garbage -d;
    ;;
esac
