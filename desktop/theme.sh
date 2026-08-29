#!/usr/bin/env bash

clear

current_dir=$PWD

fonts=(rsms-inter-fonts dejavu-fonts-all liberation-fonts google-noto-emoji-fonts)
theme=(make dconf sassc kvantum-qt5 qt5-qtwayland adwaita-cursor-theme)

sudo dnf install -y wget "${fonts[@]}" "${theme[@]}"
wget -O /tmp/jetbrainsmono.tar.xz https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir -p $HOME/.local/share/fonts/JetBrainsMonoNerd
tar -xf /tmp/jetbrainsmono.tar.xz -C $HOME/.local/share/fonts/JetBrainsMonoNerd
fc-cache -vf

REPOS=(
	# vinceliuice/Colloid-gtk-theme
	akbarsanihasan/Colloid-gtk-theme
	catppuccin/Kvantum
	PapirusDevelopmentTeam/papirus-icon-theme
)
VERSIONS=(main main 20250201)
DOWNLOAD_PATH=(gtk-theme qt-theme icon-pack)

for i in "${!REPOS[@]}"; do
	if ! [[ -d /tmp/"${DOWNLOAD_PATH[$i]}" ]]; then
		git clone --depth 1 -b "${VERSIONS[$i]}" https://github.com/"${REPOS[$i]}" /tmp/"${DOWNLOAD_PATH[$i]}"
	fi
done

mkdir -p "$HOME"/.local/share/themes
cd /tmp/gtk-theme
./install.sh --dest "$HOME"/.local/share/themes \
	--theme default \
	--color dark \
	--size compact \
	--libadwaita system \
	--tweaks catppuccin black sharp
# --tweaks catppuccin black

mkdir -p "$HOME"/.config/Kvantum
cp -R /tmp/qt-theme/themes/catppuccin-mocha-blue "$HOME"/.config/Kvantum
tee "$HOME"/.config/Kvantum/kvantum.kvconfig <<-EOF
	[General]
	theme=catppuccin-mocha-blue
EOF

cd /tmp/icon-pack
make install PREFIX="$HOME"/.local

dconf write /org/gnome/desktop/interface/cursor-theme "'Adwaita'"
dconf write /org/gnome/desktop/interface/font-name "'Inter Display 14'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Colloid-Dark-Compact-Catppuccin'"
dconf write /org/gnome/desktop/wm/preferences/theme "'Colloid-Dark-Compact-Catppuccin'"
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
dconf write /org/gnome/desktop/interface/icon-theme "'Papirus-Dark'"

cd "$current_dir"
