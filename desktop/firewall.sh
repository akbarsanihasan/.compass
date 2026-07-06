#!/usr/bin/env bash

clear

sudo pacman -S --noconfirm --needed iptables \
	nftables \
	firewalld \
	firewall-config \
	firewall-applet
sudo systemctl enable firewalld
