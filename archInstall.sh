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

#set up pacman the way I like it
sudo sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/g" /etc/pacman.conf
# I should try to find a way to add "ILoveCandy" into the pacman.conf

# This section should not be used for security
# Make root user's home shared with $USER
sudo sed -i "s|/root|/home/$USER|g" /etc/passwd

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
