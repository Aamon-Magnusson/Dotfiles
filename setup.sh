#! /bin/bash

if [ $(which pacman) ];then
	sudo pacman -S --needed gvim most alacritty qutebrowser fish ranger
fi

if [ $(which apt) ];then
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt-get install gvim most fish ranger alacritty
fi

ln -s /run/media/$USER ~/Drives

cp vimrc ~/.vimrc
cp vim ~/.vim -r
cp bashrc ~/.bashrc
cp alacritty ~/.config/ -r
cp qutebrowser ~/.config/ -r
cp fish ~/.config/ -r
cp ranger ~/.config/ -r
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
