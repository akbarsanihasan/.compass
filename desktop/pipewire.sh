#!/usr/bin/env bash

clear

packages=(
	pipewire
	pipewire-pulse
	pipewire-alsa
	wireplumber
	rtkit
)

sudo dnf install -y "${packages[@]}"

systemctl --user start pipewire
systemctl --user enable wireplumber

wpctl status &>/dev/null
sleep 3
# wpctl set-volume @DEFAULT_SINK@ 40%
# wpctl set-volume @DEFAULT_SOURCE@ 40%
# wpctl set-mute @DEFAULT_SOURCE@ 1
