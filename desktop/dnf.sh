#!/usr/bin/env bash

clear

[[ -f /etc/dnf/dnf-conf.bak ]] || sudo cp /etc/dnf/dnf.conf /etc/dnf/dnf-conf.bak

sudo tee -a /etc/dnf/dnf.conf <<-EOF
	fastestmirror=True
	max_parallel_downloads=10
	keepcache=True
EOF

sudo dnf -y update
