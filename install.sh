#!/usr/bin/env bash

clear

set -euo pipefail

[[ -f /etc/os-release ]] && . /etc/os-release

if [[ $ID != "arch" ]]; then
	echo "OS not detected as archlinux"
	exit 1
fi

sudo -v
timestamp_sudo() {
	while :; do
		sudo -v
		sleep 45
	done
}
timestamp_sudo &
timestamp_sudo_pid=$!
trap "sudo -k; kill -9 $timestamp_sudo_pid 2>/dev/null;" EXIT SIGINT SIGTERM

sudo pacman -S --noconfirm --needed git github-cli glab

git config --global user.name akbarsanihasan
git config --global user.email akbarsanihasan.pro@gmail.com
git config --global push.autoSetupRemote true
git config --global safe.directory '*'
git config --global helpers.credential store
git config --global init.defaultBranch main
git config --global rerere.enabled true
git config --global column.ui auto
git config --global branch.sort -committerdate

sudo pacman -S --noconfirm git base-devel

sudo rm -rf /tmp/yay
git clone https://aur.archlinux.org/yay-bin.git /tmp/yay

makepkg -sri --noconfirm -D /tmp/yay

source ./desktop/pipewire.sh
source ./desktop/filesystem.sh
source ./desktop/firewall.sh
source ./desktop/dotfiles.sh
source ./desktop/wm.sh
source ./desktop/common.sh
source ./desktop/neovim.sh
source ./desktop/ime.sh
source ./desktop/udiskie.sh
source ./desktop/nerdfonts.sh
source ./desktop/theme.sh
source ./desktop/sddm.sh

clear
echo "Done"
