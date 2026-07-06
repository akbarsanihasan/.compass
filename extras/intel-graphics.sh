#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed mesa \
	vulkan-intel \
	intel-media-driver \
	libva-intel-driver \
	intel-gpu-tools
