#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#alias fvim='nvim $(fzf -m --preview="bat --color=always {}")'
alias fvim='selected=$(fzf -m --preview="bat --color=always {}") && [ -n "$selected" ] && nvim "$selected"'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval "$(fzf --bash)"
