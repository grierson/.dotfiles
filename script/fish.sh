#!/usr/bin/env bash

fish << 'EOF'

# Check if fisher is installed
if not type -q fisher
    # Install fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Fzf term fuzzy finder
fisher install PatrickF1/fzf.fish
fisher install catppuccin/fish
fisher install jorgebucaran/nvm.fish
fish_config theme save "Catppuccin Latte"
nvm install latest
