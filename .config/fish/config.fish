if status is-interactive
    alias minifetch='fastfetch -c ~/.config/fastfetch/mini-config.jsonc'
    alias hx='helix'
    starship init fish | source
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
