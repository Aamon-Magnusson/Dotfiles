#! /bin/bash

sudo cp vimrc ~/.vimrc
sudo cp vim ~/.vim -r
sudo cp bashrc ~/.bashrc
sudo cp alacritty ~/.config/ -r
sudo cp qutebrowser ~/.config/ -r
sudo cp fish ~/.config/ -r
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
