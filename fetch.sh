#! /bin/bash

cp $HOME/.vimrc vimrc
sudo rm vim -r
cp $HOME/.vim vim -r
sudo rm -r vim/pack/themes/start/
cp $HOME/.bashrc bashrc
rm alacritty -r
rm qutebrowser -r
rm fish -r
rm ranger -r
cp $HOME/.config/alacritty alacritty -r 
cp $HOME/.config/qutebrowser qutebrowser -r 
cp $HOME/.config/fish fish -r 
cp $HOME/.config/ranger ranger -r
