#! /bin/bash

if [ $(which pacman) ];then
	sudo pacman -S gvim alacritty fish ranger lsd neovim fd fzf npm ccls pandoc lua-language-server texlive zathura zathura-pdf-mupdf sxiv libreoffice-still plantuml github-cli
fi

ln -s /run/media/$USER ~/Drives

cp vimrc ~/.vimrc
sudo rm ~/.vim -r
cp vim ~/.vim -r
sudo rm ~/.config/nvim -r
cp nvim ~/.config -r
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.conf ~/.tmux.conf
sudo rm -r ~/.config/zathura/
git clone https://github.com/dracula/zathura ~/.config/zathura/
# yay -S r-languageserver
cp bashrc ~/.bashrc
usermod --shell /usr/bin/fish $USER
cp xprofile $HOME/.xprofile
chmod +x ~/.xprofile
cp gitconfig ~/.gitconfig
cp alacritty ~/.config/ -r
cp qutebrowser ~/.config/ -r
cp fish ~/.config/ -r
cp ranger ~/.config/ -r
cp BetterDiscord ~/.config/ -r
cp starship.toml ~/.config/starship.toml
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
