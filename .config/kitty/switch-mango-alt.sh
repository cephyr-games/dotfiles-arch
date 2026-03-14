#!/bin/bash

sed -i 's/family="Mango"/family="Mango-alt"/' ~/.config/kitty/kitty.conf && kill -SIGUSR1 $(hyprctl activewindow | awk '/pid:/ {print $2}')

