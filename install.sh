#!/bin/env bash

mkdir -p ~/.config/bspwm
ln -s bspwmrc ~/.config/bspwm/
ln -s external-rules.sh ~/.config/bspwm/

mkdir -p ~/.config/alacritty
ln -s alacritty.yml ~/.config/alacritty/

mkdir -p ~/.config/nvim
ln -s init.vim ~/.config/nvim/

mkdir -p ~/.config/picom
ln -s picom.conf ~/.config/picom/

mkdir -p ~/.config/polybar
ln -s config.ini ~/.config/polybar/

mkdir -p ~/.config/sxhkd
ln -s sxhkdrc ~/.config/sxhkd/

mkdir -p ~/.config/rofi
ln -s nord.rasi ~/.config/rofi/
ln -s config.rasi ~/.config/rofi/

ln -s .bashrc ~/
ln -s .vimrc ~/
ln -s .Xresources ~/
ln -s .xinitrc ~/

