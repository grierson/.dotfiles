#!/usr/bin/env bash

set -xe

sudo apt-get install \
    fish \
    fd-find \
    bat \
    fzf \
    ripgrep \
    clojure \
    git \
    gh \
    make \
    docker.io \


# Fish plugin manager
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# fisher install jorgebucaran/nvm.fish
# fisher install PatrickF1/fzf.fish
#
# Install Rust manager
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#
# Neovim manager
# cargo install bob-nvim
# bob use stable
#
# Zellij
# cargo install --locked zellij
#
# babashka
# sudo bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)

