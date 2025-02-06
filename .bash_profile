#
# ~/.bash_profile
#

export CXXFLAGS="-Wall -Wextra -Wconversion -Wshadow -Weffc++ -pedantic-errors -std=c++23"
export GOOGLE_AI_API_KEY=AIzaSyDHIfxiKMdlzwt3fEslzZsvk7TZ6T-3VTE
export TERMINAL=footclient

[[ -z $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 && $(tty) == "/dev/tty1" ]] && exec dbus-run-session niri --session

[[ -f ~/.bashrc ]] && . ~/.bashrc
