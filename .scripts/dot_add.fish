#!/usr/bin/env fish

set paths ~/.config/.system_setup/tracked_dirs.txt

if not test -f $paths
    echo "Missing dir file at $paths"
    dot status
    exit 1
end

while read -l pattern
    # skip empty lines and comments
    if test -z "$pattern"
        continue
    end
    if string match -qr '^\s*#' -- $pattern
        continue
    end

    # expand ~ to home
    set pattern (string replace -r '^~' $HOME -- $pattern)

    # expand glob and add
    for path in $pattern
        dot add $path
    end
end <$paths
dot status
