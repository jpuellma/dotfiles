# .bashrc
# vim:filetype=sh

# User specific aliases and functions
#
# tput:
# tput setab N = bg color
# tput setaf N = fg color
#    colors
#    0 = black
#    1 = red
#    2 = green
#    3 = yellow
#    4 = blue
#    5 = purple
#    6 = cyan
#    7 = white
# tput bold = bold
# tput dim = dim
# tput smul = set underline
# tput rmul = exit underline
# tput rev = reverse
# tput smso = set standout
# tput rmso = exit standout
# tput sgr0 = reset all
#

function _countslashes() {
    slashes=${*//[^\/]/} && echo ${#slashes}
}

tput_reset="\[$(tput sgr0)\]"
tput_set_bold="\[$(tput bold)\]"
tput_set_dim="\[$(tput dim)\]"
tput_set_ul="\[$(tput smul)\]"
tput_unset_ul="\[$(tput rmul)\]"
tput_set_reverse="\[$(tput rev)\]"
tput_set_standout="\[$(tput smso)\]"
tput_unset_standout="\[$(tput rmso)\]"
tput_bg_black="\[$(tput setab 0)\]"
tput_bg_red="\[$(tput setab 1)\]"
tput_bg_green="\[$(tput setab 2)\]"
tput_bg_yellow="\[$(tput setab 3)\]"
tput_bg_blue="\[$(tput setab 4)\]"
tput_bg_purple="\[$(tput setab 5)\]"
tput_bg_cyan="\[$(tput setab 6)\]"
tput_bg_white="\[$(tput setab 7)\]"
tput_fg_black="\[$(tput setaf 0)\]"
tput_fg_red="\[$(tput setaf 1)\]"
tput_fg_green="\[$(tput setaf 2)\]"
tput_fg_yellow="\[$(tput setaf 3)\]"
tput_fg_blue="\[$(tput setaf 4)\]"
tput_fg_purple="\[$(tput setaf 5)\]"
tput_fg_cyan="\[$(tput setaf 6)\]"
tput_fg_white="\[$(tput setaf 7)\]"

ps1_hostname="$([[ -e /bin/hostname ]] && hostname || echo $HOSTNAME.$([[ -e /bin/dnsdomainname ]] && /bin/dnsdomainname))"

function _update_ps1() {
    # export PS1="$(~/.powerline-shell.py $? 2> /dev/null)"
    export PS1="$(~/.powerline-shell.py --cwd-only --mode patched --colorize-hostname)"
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
        export PS1="${tput_fg_yellow}\[\][\u@\h \W]\$ \[\] ${tput_reset}"
        ;;
    *)
        export PS1="\[\][\u@\h \W]\$ \[\] "
        ;;
esac
