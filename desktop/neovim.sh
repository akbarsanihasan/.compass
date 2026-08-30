#!/usr/bin/env bash

clear

sudo dnf install -y \
	neovim \
	compat-lua \
	luarocks \
	tree-sitter-cli \
	git \
	curl \
	wget \
	unzip \
	tar \
	gzip \
	npm \
	go

if ! [[ -d $HOME/.config/nvim ]]; then
	git clone https://github.com/akbarsanihasan/neovimrc $HOME/.config/nvim
fi
