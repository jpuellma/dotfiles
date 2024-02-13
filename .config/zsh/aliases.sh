alias .='source'

alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias lrtail='ls -lrt | tail'

# git
alias gti='git'
alias g=git
alias ga='git add'
alias ga.='git add .'
alias gcm='git commit -m'
alias gd='git diff'
alias gpoh='git push origin HEAD --tags'
alias gs='git status'
alias gl='git log --oneline'
alias cola='nohup git cola >/dev/null 2>&1 & '
alias gco='git checkout'
alias groot='git rev-parse --show-toplevel'
alias cdg='pushd $(groot)'
alias gag='git add $(groot)'

# Misc
alias ..='cd ..'
alias gerp='grep'
alias t=terraform
alias tf=terraform
alias tree='tree -C'
alias vi='nvim'
alias vim=nvim
