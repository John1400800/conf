# .bash_profile

# Autologin on tty1
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
    exec startx
fi

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
