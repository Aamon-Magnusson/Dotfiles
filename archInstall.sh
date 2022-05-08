#! /bin/bash

# Make $HOME folder structure
mkdir -p $HOME/.config
mkdir -p $HOME/Programming
mkdir -p $HOME/Desktop
mkdir -p $HOME/Music
mkdir -p $HOME/Public
mkdir -p $HOME/Templates
mkdir -p $HOME/Documents
mkdir -p $HOME/Pictures
mkdir -p $HOME/Programming
mkdir -p $HOME/RandomPrograms
mkdir -p $HOME/Screenshots
mkdir -p $HOME/Downloads
mkdir -p $HOME/Videos

# Set up yay
sudo pacman -S git base-devel
cd $HOME/Programming
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si

# Enable NetworkManager
sudo systemctl enable NetworkManager.service

# Enable Ly
yay -S ly
sudo systemctl enable ly.service
