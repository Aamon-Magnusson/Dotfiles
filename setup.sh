#! /bin/bash

if [ $(which pacman) ];then
	sudo pacman -S --needed gvim most
fi

cp vimrc ~/.vimrc
cp vim ~/.vim -r
cp bashrc ~/.bashrc
cp alacritty ~/.config/ -r
cp qutebrowser ~/.config/ -r
cp fish ~/.config/ -r
cp ranger ~/.config/ -r
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
