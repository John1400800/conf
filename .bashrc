#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\W \$ '

# Created by `pipx` on 2025-10-30 15:52:25
export PATH="$PATH:/home/john/.local/bin"
