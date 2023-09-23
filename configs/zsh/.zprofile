# Auto start x session after tty login
if [[ "$(tty)" = "/dev/tty1" ]]; then
    exec startx
fi
