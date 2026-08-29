#!/usr/bin/env bash

clear

sudo dnf install -y util-linux exfatprogs ntfs-3g
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer
sudo usermod -aG disk $USER
