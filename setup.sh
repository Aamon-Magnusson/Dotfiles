#! /bin/bash

if [ $(which pacman) ];then
	sudo pacman -S --needed gvim alacritty qutebrowser fish ranger
fi

if [ $(which apt) ];then
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt-get install gvim most fish ranger alacritty
fi

ln -s /run/media/$USER ~/Drives

cp vimrc ~/.vimrc
sudo rm ~/.vim -r
cp vim ~/.vim -r
sudo rm -r ~/.vim/pack/themes/start/dracula
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
cp bashrc ~/.bashrc
echo "exec fish" >> ~/.zshrc
cp alacritty ~/.config/ -r
cp qutebrowser ~/.config/ -r
cp fish ~/.config/ -r
cp ranger ~/.config/ -r
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
