#!/usr/bin/env bash

clear

fonts=(
	rsms-inter-fonts
	dejavu-fonts-all
	liberation-fonts
	google-noto-emoji-fonts
)
sudo dnf install -y wget "${fonts[@]}" "${theme[@]}"

wget -O /tmp/jetbrainsmono.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir -p $HOME/.local/share/fonts/JetBrainsMonoNerd
tar -xf /tmp/jetbrainsmono.tar.xz -C $HOME/.local/share/fonts/JetBrainsMonoNerd

fc-cache -vf
