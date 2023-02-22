#!/bin/env bash

mkdir -p /home/fanoplanes/.config/bspwm
ln -rs bspwmrc /home/fanoplanes/.config/bspwm/
ln -rs external-rules.sh /home/fanoplanes/.config/bspwm/

mkdir -p /home/fanoplanes/.config/alacritty
ln -rs alacritty.yml /home/fanoplanes/.config/alacritty/

mkdir -p /home/fanoplanes/.config/nvim
ln -rs init.vim /home/fanoplanes/.config/nvim/

mkdir -p /home/fanoplanes/.config/picom
ln -rs picom.conf /home/fanoplanes/.config/picom/

mkdir -p /home/fanoplanes/.config/polybar
ln -rs config.ini /home/fanoplanes/.config/polybar/

mkdir -p /home/fanoplanes/.config/sxhkd
ln -rs sxhkdrc /home/fanoplanes/.config/sxhkd/

mkdir -p /home/fanoplanes/.config/rofi
ln -rs nord.rasi /home/fanoplanes/.config/rofi/
ln -rs config.rasi /home/fanoplanes/.config/rofi/

ln -rs .bashrc /home/fanoplanes/
ln -rs .vimrc /home/fanoplanes/
ln -rs .Xresources /home/fanoplanes/
ln -rs .xinitrc /home/fanoplanes/

