#!/usr/bin/env bash
mullvad relay set location $(mullvad relay list | fzf | awk '{print $1}')
