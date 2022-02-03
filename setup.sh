#! /bin/bash

cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp -r alacritty ~/.config
cp -r qutebrowser ~/.config
cp -r fish ~/.config
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
