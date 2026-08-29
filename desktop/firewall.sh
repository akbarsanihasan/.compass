#!/usr/bin/env bash

clear

sudo dnf install -y iptables \
	nftables \
	firewalld \
	firewall-config \
	firewall-applet

sudo systemctl enable firewalld
