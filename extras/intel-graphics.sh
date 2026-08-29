#!/usr/bin/env bash

clear

sudo dnf install -y mesa \
	vulkan-intel \
	intel-media-driver \
	libva-intel-driver \
	intel-gpu-tools
