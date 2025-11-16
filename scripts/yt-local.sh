#!/usr/bin/env nix-shell
LD_LIBRARY_PATH=$(nix-build --no-out-link '<nixpkgs>' -A stdenv.cc.cc.lib)/lib
tor RunAsDaemon 1
source ~/Downloads/youtube-local-master/.venv/bin/activate
python3 ~/Downloads/youtube-local-master/server.py
