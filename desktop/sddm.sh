#!/usr/bin/env bash

clear

sudo dnf install -y sddm \
	unzip \
	qt6-qtsvg \
	qt6-qtdeclarative \
	qt5-qtquickcontrols2

VERSION=v1.1.0
THEME_FLAVOUR=catppuccin-mocha
URL=https://github.com/catppuccin/sddm/releases/download/"$VERSION/$THEME_FLAVOUR".zip
if ! [[ -d /tmp/sddm-theme ]]; then
	curl -Lo /tmp/sddm-theme.zip "$URL"
fi

sudo rm -rf /usr/share/sddm/themes/"$THEME_FLAVOUR"
sudo mkdir -p /usr/share/sddm/themes
sudo unzip -o /tmp/sddm-theme.zip -d /usr/share/sddm/themes

sudo tee /etc/sddm.conf <<-EOF
	[Theme]
	Current=catppuccin-mocha
	Font=Inter Display
	Fontsize=14
	UserIcon=true

	[Autologin]
	User=$USER
	Session=sway
EOF

sudo systemctl enable sddm
