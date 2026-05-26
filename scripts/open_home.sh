#!/usr/bin/env bash
sudo nft -f ~/.dotfiles/scripts/excludeTraffic.rules
sleep 1
mullvad connect
sleep 1
mullvad reconnect
dms ipc inhibit enable
