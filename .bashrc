#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias FUCK='sudo !!'
alias fuck='sudo !!'
alias a='sudo rfkill unblock all'
alias vim='nvim'
export EDITOR='/usr/bin/nvim'
export VISUAL='/usr/bin/nvim'
PS1='[\u@\h \W]\$ '
export PATH=$PATH:/home/fanoplanes/.local/bin

[ -f "/home/fanoplanes/.ghcup/env" ] && source "/home/fanoplanes/.ghcup/env" # ghcup-env
