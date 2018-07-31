#!/usr/bin/env bash
# .bashrc
# vim:filetype=sh

source ./colors.sh

# User specific aliases and functions
function _countslashes() {
    slashes=${*//[^\/]/} && echo ${#slashes}
}

ps1_hostname="$([[ -e /bin/hostname ]] && hostname || echo $HOSTNAME.$([[ -e /bin/dnsdomainname ]] && /bin/dnsdomainname))"
export ps1_hostname

function _update_ps1() {
    if is_macos ; then
        PS1="$(powerline-shell $?)"
    else
        PS1="$(~/.powerline-shell.py --mode flat)"
        export PS1
    fi
}

if is_macos ; then
    if [ "$TERM" != "linux" ]; then
        PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
    fi
else
    if [[ -a ~/.powerline-shell.py ]]; then
        export PROMPT_COMMAND='_update_ps1'
    fi
fi


case $HOSTNAME in
    'optiplex790')
        export PS1="💻 ⇄ 💻 \u@\h \W \$ "
        unset PROMPT_COMMAND
        ;;
    'James-Puellmann-8966')
        export PS1="${tput_fg_yellow}\[\][\! \W]\$ \[\] ${tput_reset}"
        ;;
    *)
        export PS1="\[\][\u@\h \W]\$ \[\] "
        ;;
esac

function _new_update_ps1() {
    local git_part hostname_part path_part prompt_part prompt_string
    git_part=""
    hostname_part=""
    path_part=""
    prompt_part=""
    prompt_string=""

    git_part="git_part"
    hostname_part="${tput_reset}$(hostname -s)${tput_reset}"
    path_part="path_part"
    prompt_part="prompt_part "

    prompt_string="${hostname_part} ${path_part} ${git_part} ${prompt_part}"

    echo "PS1=\"${prompt_string}\""
}
