#
# ~/.bashrc
# Loads once for each interactive shell.
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\[\033[01;32m\]\u@\h \W\[\033[00m\]]\$ '

# Load profile
source ~/.profile
