#!/usr/bin/env fish

set FILE $argv[1]
set LINE $argv[2]

alacritty -e env PATH="$PATH:$HOME/.dotnet/tools" helix +$LINE $FILE

