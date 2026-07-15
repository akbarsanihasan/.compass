#!/usr/bin/env bash

if ! yay --version &>/dev/null; then
	sudo rm -rf /tmp/yay
	git clone https://aur.archlinux.org/yay-bin.git /tmp/yay

	makepkg -sri --noconfirm -D /tmp/yay
fi
