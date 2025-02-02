#
# ~/.bash_profile
#

[[ -z $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 && $(tty) == "/dev/tty1" ]] && exec dbus-run-session niri --session

[[ -f ~/.bashrc ]] && . ~/.bashrc
