# .bashrc
# vim:filetype=sh

source ~/.bashrc.d/colors.sh

# User specific aliases and functions
function _countslashes() {
    slashes=${*//[^\/]/} && echo ${#slashes}
}

ps1_hostname="$([[ -e /bin/hostname ]] && hostname || echo $HOSTNAME.$([[ -e /bin/dnsdomainname ]] && /bin/dnsdomainname))"

function _update_ps1() {
    true
    # if is_macos ; then
    #     PS1="$(powerline-shell $?)"
    # else
    #     export PS1="$(~/.powerline-shell.py --mode flat)"
    # fi
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
