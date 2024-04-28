#!/usr/bin/env bash

set -xe

yay -S --needed \
  fish \
  ttf-firacode-nerd \
  ttf-font-awesome \
  google-chrome \
  zoxide \
  tmux \
  fd \
  bat \
  fzf \
  ripgrep \
  github-cli \
  make \
  clang \
  clojure \
  babashka \
  difftastic \
	sway \
	swaylock \
	swayidle \
	swaybg \
  swayimg \
  bemenu \
  i3status-rs \
	pavucontrol \
	grim \
  slurp \
  docker \
	docker-compose \
  podman \
  podman-desktop \

sudo systemctl enable docker
sudo systemctl start docker
