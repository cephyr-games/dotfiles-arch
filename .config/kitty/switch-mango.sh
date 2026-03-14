#!/bin/bash

sed -i 's/family="Mango-alt"/family="Mango"/' ~/.config/kitty/kitty.conf && kill -SIGUSR1 $(hyprctl activewindow | awk '/pid:/ {print $2}')

