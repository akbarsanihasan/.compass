#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed neovim \
	lua51 \
	luarocks \
	tree-sitter-cli \
	git \
	curl \
	wget \
	unzip \
	tar \
	gzip

sudo pacman -S --noconfirm --needed npm go

git clone https://github.com/akbarsanihasan/neovimrc $HOME/.config/nvim
