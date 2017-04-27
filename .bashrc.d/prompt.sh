# .bashrc
# vim:filetype=sh

source ~/.bashrc.d/colors.sh

# User specific aliases and functions
function _countslashes() {
    slashes=${*//[^\/]/} && echo ${#slashes}
}

ps1_hostname="$([[ -e /bin/hostname ]] && hostname || echo $HOSTNAME.$([[ -e /bin/dnsdomainname ]] && /bin/dnsdomainname))"

function _update_ps1() {
    # export PS1="$(~/.powerline-shell.py $? 2> /dev/null)"
    # export PS1="$(~/.powerline-shell.py --cwd-only --mode patched --colorize-hostname)"
    # export PS1="$(~/.powerline-shell.py --cwd-only --mode jpuellma --colorize-hostname)"
    export PS1="$(~/.powerline-shell.py --mode flat)"
}


if [[ -a ~/.powerline-shell.py ]]; then
    export PROMPT_COMMAND='_update_ps1'
# else
#     # Setup your normal PS1 here.
#     export PROMPT_COMMAND=\
#     '\
#     SHORT_PWD=${PWD/#$HOME/\~}; \
#     s=$(_countslashes $SHORT_PWD); \
#     if [[ $PWD == $HOME ]]; then \
#         PS1_PWD="~"; \
#     elif [[ $s -lt 3 ]]; then \
#         PS1_PWD=${PWD/#$HOME/\~}; \
#     else \
#         PS1_PWD=$(pwd|awk -F / '\''{printf "../%s/%s\n", $(NF-1), $NF}'\''); \
#     fi; \
#     PS1="${tput_set_bold}${tput_fg_yellow}[\D{%T %Z}]${tput_fg_white}${PS1_PWD} ${tput_fg_cyan}\$ ${tput_reset}" \
#     '
fi

case $HOSTNAME in
    'optiplex790')
        # export PS1="$\[\][\u@\h \W]\$ \[\] "
        # export PS1="[\u@\h \W]\$ "
        # export PS1="Ø[\u@\h \W]\$ "
        # export PS1="🖥[\u@\h \W]\$ "
        # export PS1="💻 ⇄ 🖳 \u@\h \W»\$ "
        # export PS1="💻 ⇄ 💻 \u@\h \W»\$ "
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
