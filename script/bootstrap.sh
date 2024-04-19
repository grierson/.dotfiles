#!/usr/bin/env bash

set -xe

./script/packages.sh
./script/stow.sh
chsh -s "$(which fish)"
