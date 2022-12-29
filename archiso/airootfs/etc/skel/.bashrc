#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

exec zsh
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

########
#ALCI
########
alias evb='sudo systemctl enable --now vboxservice.service'
