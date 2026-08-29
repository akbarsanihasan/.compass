#!/usr/bin/env bash

clear

core=(
	zsh
	xhost
	sway
	swayidle
	swaybg
	swaylock
	xdg-desktop-portal
	xdg-desktop-portal-wlr
	xdg-desktop-portal-gtk
)
panels=(waybar dunst rofi pavucontrol blueman network-manager-applet)
apps=(thunar file-roller okular ristretto mousepad gparted)
dependencies=(
	dconf
	xdg-user-dirs
	wl-clipboard
	grim
	gvfs
	gammastep
	xfce-polkit
	libnotify
	brightnessctl
	playerctl
	cliphist
)

sudo dnf install -y "${core[@]}" \
	"${panels[@]}" \
	"${apps[@]}" \
	"${dependencies[@]}"

sudo chsh -s "$(command -v zsh)" "$USER"
sudo dnf install -y rofi-devel qalculate meson libtool automake autoconf cairo-devel

[[ -d /tmp/rofi-calc ]] || git clone https://github.com/svenstaro/rofi-calc.git /tmp/rofi-calc
(
	cd /tmp/rofi-calc/
	meson setup build
	meson compile -C build/
	sudo meson install
)

[[ -d /tmp/rofi-emoji ]] || git clone https://github.com/Mange/rofi-emoji.git /tmp/rofi-emoji
(
	cd /tmp/rofi-emoji
	autoreconf -i
	mkdir build
	cd build
	../configure
	make
	sudo make install
)

sudo usermod $USER -aG input

dconf write /org/gnome/desktop/wm/preferences/button-layout "':'"

mkdir -p $HOME/.config/qalculate

/usr/bin/xdg-user-dirs-update
mkdir -p "$HOME"/.config/gtk-3.0
tee "$HOME"/.config/gtk-3.0/bookmarks <<-EOF
	file:///home/$USER/Documents
	file:///home/$USER/Downloads
	file:///home/$USER/Music
	file:///home/$USER/Pictures
	file:///home/$USER/Public
	file:///home/$USER/Templates
	file:///home/$USER/Videos
EOF
