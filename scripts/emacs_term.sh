#!/usr/bin/env bash

set -euo pipefail

emacs_directory=$(emacsclient --eval "(buffer-local-value 'default-directory (window-buffer (selected-window)))")
emacsclient -c --eval "(let ((default-directory $emacs_directory)) (term \"/usr/bin/env bash\"))"
