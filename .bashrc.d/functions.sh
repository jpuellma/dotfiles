#!/usr/bin/env bash
debugon=false
my_name=functions.sh
_setpath() {
    function _pathmunge() {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                if [ "$2" = "after" ] ; then
                    PATH=$PATH:$1
                else
                    PATH=$1:$PATH
                fi
        esac
    }

    case $PROFILE_TYPE in
    "blacktop")
        _pathmunge $HOME/bin after
        _pathmunge /sbin after
        _pathmunge /usr/sbin after
        ;;
    "mbp")
        _pathmunge $HOME/bin after
        ;;
    "ldap_home")
        _pathmunge $HOME/bin after
        ;;
    "production_host")
        ;;
    esac
} # end function _setpath()


settitle() {
    printf "\033k$1\033\\"
}


_svnfind() {
    find $* | grep -v "\.svn"
}


_sup() {
    for i in ~/svn/* ; do
        svn up $i
    done
}


_set_dir_colors() {
    if [[ -f ~/.dircolors && -x /usr/bin/dircolors ]]; then
    eval $(dircolors ~/.dircolors)
    fi
}


_lrtail() {
    /usr/bin/ls -lrt --color=always $* | tail
}; alias lrtail='_lrtail' ; alias lrt='_lrtail'


pwgrep() {
    gpg -d ~/.crypt/passwords.gpg | grep $*
}


s() {
  settitle $*
  ssh $*
  settitle ${USER}@${HOSTNAME}
}


vs() {
  settitle $*
  vagrant ssh $*
  settitle ${USER}@${HOSTNAME}
}


codi() {
  vim $2 -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi ${1:-python}"
}


ts() { foo="$*"
  tmux new-window -n "${foo}" ssh ${foo}
}


timestamp() {
  date --iso-8601=seconds
}


reverse_array() {
# Input: An array of strings, separated by whitespace.
# Output: The same array, reversed.
    array=($*)
    for (( idx=${#array[@]}-1 ; idx>=0 ; idx-- )) ; do
        echo -n "${array[idx]} "
    done
}


format_call_stack() {
# Formats a function call stack for printing in log messages.
# Input: A whitespace separated list of function names, typically
# "${FUNCNAME[*]}".
# Output: The same list, reversed, with the log_* function names and redundant
# main calls removed and spaces replaced with '->' indicators.
    input="$*"
    reversed=$(reverse_array ${input})
    dedupe_mains=${reversed/main main /main }
    no_logs=${dedupe_mains% log_*}
    arrows=${no_logs// /→}
    echo ${arrows}
}


log_debug() {
    if [ _${debugon} == _true ]; then
        stack=$(format_call_stack "${FUNCNAME[*]}")
        printf 'Debug [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
    fi
}


log_error() {
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf 'Error [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
}


log_info() {
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf '[[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*"
}
