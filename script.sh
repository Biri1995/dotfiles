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

#vscodium repo 
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

#update & package install
sudo apt update

sudo apt install i3 feh firefox-esr dmenu xorg neovim sudo kitty neofetch ranger git picom codium lxappearance gtk-chtheme -y

#install fonts
read -p "Install fonts? (y/n) " yn
	case $yn in
		y ) echo proceeding...;
			wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip;
			wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/BigBlueTerminal.zip;
			sudo unzip BigBlueTerminal.zip -d /usr/local/share/fonts;
			sudo unzip 0xProto.zip -d /usr/local/share/fonts;;
		n ) echo skipping...;;
		* ) echo invalid input;
			exit 1;;
	esac

	echo executing...

#i3 window manager setup
read -p "Setup i3 window manager? (y/n) " yn
	case $yn in
		y ) echo proceeding...;

			mkdir $HOME/.config/i3;
			cp config/i3/config $HOME/.config/i3;
			mkdir $HOME/.config/picom;
			cp config/picom/picom.conf $HOME/.config/picom;
			mkdir $HOME/.config/polybar/polybar.conf;
			cp config/polybar/config.ini config/polybar/launch.sh $HOME/.config/polybar;;

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

#ohmyzsh setup
read -p "Setup ohmyzsh? (y/n) " yn
	case $yn in
		y ) echo proceeding...;
			sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)";
			git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
			rm ~/.zshrc;
			cp oh-my-zsh/zshrc $HOME/.zshrc;
			echo Restart terminal to finish setup.;;
		n ) echo skipping...;;
		* ) echo invalid input;
			exit 1;;
	esac
