uname_a=$(uname -a)

# Environment-specific:
case $(uname -a) in
    Darwin*)
        alias ls='ls -G'
        alias ll='ls -l'
        alias grep='/usr/bin/grep --color=always'
        alias updatedb='/usr/libexec/locate.updatedb'
        alias less='less -RFX'
        alias cdsvn='cd ~/svn'
        ;;
    *Linux*)
        alias ls='/bin/ls --color=always'
        alias ll='ls -l'
        alias grep='/bin/grep --color=always'
        alias less='less -RFX'
        alias cdsvn='cd ~/svn'
        alias tree='tree -c'
        ;;
    * )
        ;;
esac

# Universal
alias gerp='grep'
alias whatprovides='sudo yum whatprovides'
alias puppet-lint='puppet-lint --no-autoloader_layout-check --no-hard_tabs-check --no-trailing_whitespace-check --no-2sp_soft_tabs-check --no-single_quote_string_with_variables-check'
alias vi='vim'
alias gvim='gvim -p'
alias cdpe='cd ~/svn/systems/trunk/puppet/environments/'
alias cdp3='cd ~/p3/'
alias cdp2='cd ~/p2/'
alias ..='cd ..'
alias environments='cd ~/svn/systems/trunk/puppet/environments/'
#alias meld='GTK_THEME=Greybird meld'
#alias svnmeld='GTK_THEME=Greybird svn --diff-cmd meld diff'
alias svnmeld='svn --diff-cmd meld diff'
alias ssh='ssh -q'
alias batterysaver='~/bin/setbrightness 60 && ~/bin/cpu s'
alias ppv='puppet parser validate'
alias edit='sublime_text -n '
alias sup='svn up'
alias s.gpg='gpg -d ~/.crypt/systems.gpg'
alias pssh='pssh -h hosts -x -q -A -o out -e err'
alias pscp='pscp.pssh -x -q -A -o out -e err'
alias vpnc='sudo vpnc'
alias vpnc-disconnect='sudo vpnc-disconnect'
alias atom='atom -n'
alias t='terminator &'
alias a='atom -n ~/svn/systems/trunk/puppet/environments'
alias b=brightness
alias t='tmux a || tmux'
alias ta='exec tmux att'
alias sup='_sup'
alias svnfind='_svnfind'
#alias svn='GTK_THEME=Greybird svn'
alias gst='git status'
alias g=git
alias gg='git gui &'
alias cola='nohup git cola >/dev/null 2>&1 & '

alias cr='cmus-remote'
alias crplay='cmus-remote --play' crp='crplay'
alias crpause='cmus-remote --pause' cru='crpause'
alias crresume='cmus-remote --pause'
alias crprev='cmus-remote --prev' crr='crprev'
alias crnext='cmus-remote --next' crn='crnext'
alias crstop='cmus-remote --stop' crs='crstop'
alias crvolume='cmus-remote --volume' crv='crvolume'

alias v=vagrant
alias vup='vagrant up'
alias vsh='vagrant ssh'
alias vst='vagrant status'
alias vstat='vagrant status'

alias mbp='gnome-terminal --profile mbp'
alias shrug='echo ${shrug}'
alias brofist='echo ${brofist}'
alias thumbsup='echo ${thumbsup}'
