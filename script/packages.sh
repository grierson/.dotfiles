#!/usr/bin/env bash

set -xe

yay -S --needed \
  fish \
  make \
  man \
	sway \
	swaylock-effects \
	swayidle \
	swaybg \
  swayimg \
  tofi \
  i3status-rs \
	pavucontrol \
	grim \
  slurp \
  swappy \
  ttf-firacode-nerd \
  ttf-font-awesome \
  zoxide \
  tmux \
  fd \
  bat \
  fzf \
  ripgrep \
  neovim \
  unzip \
  google-chrome \
  github-cli \
  clang \
  clojure \
  babashka \
  difftastic \
  docker \
	docker-compose \
  podman \
  podman-desktop \

sudo systemctl enable docker
sudo systemctl start docker
