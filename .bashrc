# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias please='sudo'
alias blue='bluetoothctl'
alias fetch='clear && neofetch'
alias ghosts='~/color-scripts/color-scripts/ghosts | lolcat'
alias zwaves='~/color-scripts/color-scripts/zwaves | lolcat'
alias fade='~/color-scripts/color-scripts/fade | lolcat'
alias pacman='~/color-scripts/color-scripts/pacman | lolcat'
alias bang='~/color-scripts/color-scripts/crunchbang-mini | lolcat'


export PS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "
