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

sudo apt update

sudo apt install i3 feh firefox-esr dmenu xorg neovim sudo kitty neofetch ranger git lxappearance picom polybar -y

#i3 window manager setup
read -p "Setup i3 window manager? (y/n) " yn
	case $yn in
		y ) echo proceeding...;
			mkdir $HOME/.config/i3;
			cp config/i3/config $HOME/.config/i3;;
		n ) echo skipping...;;
		* ) echo invalid input;
			exit 1;;
	esac

#git clone 

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


