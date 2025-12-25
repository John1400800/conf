#
# ~/.bash_profile
#

if [[ -z "$NIRI_RUNNING" && -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" && "$(tty)" = "/dev/tty1" ]]; then
  export NIRI_RUNNING=1
  exec niri-session
fi

# [[ -f ~/.bashrc ]] && . ~/.bashrc
