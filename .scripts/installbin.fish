#!/usr/bin/env fish

for file in $argv
    set name (path change-extension "" (basename $file))
    sudo install -m 755 $file /usr/local/bin/$name
end
