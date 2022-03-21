#! /bin/bash

if [ $(which pacman) ];then
	sudo pacman -S --needed gvim alacritty qutebrowser fish ranger lsd nvim
fi

if [ $(which apt) ];then
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt-get install gvim most fish ranger alacritty
fi

ln -s /run/media/$USER ~/Drives

cp vimrc ~/.vimrc
sudo rm ~/.vim -r
sudo rm -r ~/.vim/pack/themes/start/dracula
cp vim ~/.vim -r
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
cp nvim ~/.config/ -r
git clone https://github.com/dracula/vim.git ~/.config/nvim/pack/themes/start/dracula
cp bashrc ~/.bashrc
[[ ! $(grep "exec fish" $HOME/.zshrc) ]] && echo "exec fish" >> ~/.zshrc
cp alacritty ~/.config/ -r
cp qutebrowser ~/.config/ -r
cp fish ~/.config/ -r
cp ranger ~/.config/ -r
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
