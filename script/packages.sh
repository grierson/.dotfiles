#!/usr/bin/env bash

set -xe

sudo apt-get install \
    fish \
    tmux \
    fd-find \
    bat \
    fzf \
    ripgrep \
    git \
    gh \
    git-delta \
    make \
    docker.io \

# Fish plugin manager
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Fzf term fuzzy finder
# fisher install PatrickF1/fzf.fish

# Set term theme
# fisher install catppuccin/fish
# fish_config theme save "Catppuccin Latte"

# Node manager
# fisher install jorgebucaran/nvm.fish
# nvm install latest

# Rust manager
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Neovim manager
# cargo install bob-nvim
# bob use stable

# Clojure
# curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
# chmod +x linux-install.sh
# sudo ./linux-install.sh

# Babashka
# sudo bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)

