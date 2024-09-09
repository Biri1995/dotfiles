#!/bin/bash

#install packages
read -p "Start setup? (y/n) " yn
	case $yn in
		y ) echo proceeding...;;
		n ) echo exiting...;
			exit;;
		* ) echo invalid input;
			exit 1;;
	esac

	echo executing...

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update

sudo apt install i3 feh firefox-esr dmenu xorg neovim sudo kitty neofetch ranger git picom codium -y

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip

sleep 5

sudo unzip 0xProto.zip -d /usr/local/share/fonts

#i3 window manager setup
read -p "Setup i3 window manager? (y/n) " yn
	case $yn in
		y ) echo proceeding...;

			mkdir $HOME/.config/i3;
			cp config/i3/config $HOME/.config/i3;
			mkdir $HOME/.config/picom;
			cp config/picom/picom.conf $HOME/.config/picom;;

		n ) echo skipping...;;
		* ) echo invalid input;
			exit 1;;
	esac



#kitty console setup
read -p "Setup kitty console? (y/n) " yn
	case $yn in
		y ) echo proceeding...;
			git clone https://github.com/Biri1995/dotfiles;
			mkdir ~/.config/kitty/;
			cp config/kitty/kitty.conf $HOME/.config/kitty/;;
		n ) echo skipping...;;
		* ) echo invalid input;
			exit 1;;
	esac


