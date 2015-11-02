#!/usr/bin/env bash

set -eu

# TODO Copy files into ~/

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source-file ~/.tmux.conf
