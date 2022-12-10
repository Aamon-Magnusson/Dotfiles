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
sudo mkdir /usr/share/xsessions

# Make nvim vi
sudo ln -s /usr/bin/nvim /usr/bin/vi

#set up pacman the way I like it
sudo sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/g" /etc/pacman.conf
# I should try to find a way to add "ILoveCandy" and "Color" into the pacman.conf

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
# Un-needed with archinstall
# sudo systemctl enable NetworkManager.service

# Enable Ly (for systems that are not Nvidia laptops)
# yay -S ly
# sudo systemctl enable ly.service

# Enable lightDM (fro systems that are Nvidia laptops)
# sudo pacman -S lightdm lightdm-gtk-greeter
# sudo systemctl enable lightdm.service

# Optimus-Manager
# sudo pacman -S nvidia
# sudo yay -S optimus-manager

