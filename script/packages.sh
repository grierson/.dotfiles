#!/usr/bin/env bash

set -xe

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

sudo apt-get install \
	stow \
    fish \
    tmux \
    fd-find \
    bat \
    fzf \
    ripgrep \
    git \
    gh \
    make \
    clang \

# Check if cargo is installed
if ! command -v cargo &> /dev/null
then
    echo "Cargo is not installed. Installing now..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
    echo "Cargo is already installed."
fi

# Neovim manager
cargo install bob-nvim
cargo install git-delta
bob use stable

# Switch to fish
fish

# Check if fisher is installed
if ! command -v fisher &> /dev/null
then
    echo "Fisher is not installed. Installing now..."
    # Install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
else
    echo "Fisher is already installed."
fi

# Fzf term fuzzy finder
fisher install PatrickF1/fzf.fish
fisher install catppuccin/fish
fisher install jorgebucaran/nvm.fish
fish_config theme save "Catppuccin Latte"
nvm install latest


# Clojure
# curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
# chmod +x linux-install.sh
# sudo ./linux-install.sh

# Babashka
# sudo bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)

