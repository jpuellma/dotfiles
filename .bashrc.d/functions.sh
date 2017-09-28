#!/usr/bin/env bash
debugon=false
my_name=functions.sh
redhat_release=$(cat /etc/redhat-release 2>/dev/null)


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
    printf "\033k%s\033\\" ${1}
}


_svnfind() {
    find "$@" | grep -v "\.svn"
}


_sup() {
    for i in ~/svn/* ; do
        svn up $i
    done
}


_set_dir_colors() {
    if [[ -f ~/.dircolors && -x /usr/bin/dircolors ]]; then
    eval "$(dircolors ~/.dircolors)"
    fi
}


_lrtail() {
    /usr/bin/ls -lrt --color=always "$@" | tail
}; alias lrtail='_lrtail' ; alias lrt='_lrtail'


pwgrep() {
    gpg -d ~/.crypt/passwords.gpg | grep "$@"
}


s() {
  settitle "$@"
  ssh "$@"
  settitle ${USER}@${HOSTNAME}
}


vs() {
  settitle "$@"
  vagrant ssh "$@"
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
    local array
    array=("$@")
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
    local colons dedupe_mains input no_logs reversed
    input="$*"
    reversed=$(reverse_array ${input})
    dedupe_mains=${reversed/main main /main }
    no_logs=${dedupe_mains% log_*}
    colons=${no_logs// /:}
    echo ${colons}
}


log_debug() {
    local stack
    if [ _${debugon} == _true ]; then
        stack=$(format_call_stack "${FUNCNAME[*]}")
        printf 'Debug [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
    fi
}


log_error() {
    local stack
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf 'Error [[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*" > /dev/stderr
}


log_info() {
    local stack
    stack=$(format_call_stack "${FUNCNAME[*]}")
    printf '[[%s: %s]]: %s\n' "${my_name}" "${stack}" "$*"
}


is_gcp() {
# Checks if currently running in Google Compute Platform.
# Returns 0 if true, 1 if false.
    log_debug "Begin."
    local return_value
    if grep -q '^Google$' /sys/devices/virtual/dmi/id/sys_vendor ; then
        return_value=0
    else
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return ${return_value}
}


is_aws() {
# Checks if currently running in Amazon Web Services
# Returns 0 if true, 1 if false.
    log_debug "Begin."
    local return_value
    if curl -fm2 -so /dev/null http://169.254.169.254/1.0/meta-data/ami-id 2>/dev/null ; then
        return_value=0
    else
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return ${return_value}
}


is_virtualbox() {
# Checks if currently running in Virtualbox.
# Returns 0 if true, 1 if false.
    log_debug "Begin."
    local return_value
    if grep -q '^VirtualBox' /sys/devices/virtual/dmi/id/product_name ; then
        return_value=0
    else
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return ${return_value}
}


is_el6() {
# Checks if this is an EL 6  (RHEL or CentOS) system.
# Returns 0 for true; 1 for false.
    log_debug "Begin."
    if [[ ${redhat_release} = "CentOS release 6"* ]]; then
        log_debug "Detected CentOS 6."
        return_value=0
    elif [[ ${redhat_release} = "Red Hat Enterprise Linux Server release 6"* ]]; then
        log_debug "Detected RHEL 6."
        return_value=0
    else
        log_debug "Release \"${redhat_release}\" is not EL 6."
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return $return_value
}


is_el7() {
# Checks if this is an EL 7  (RHEL or CentOS) system.
# Returns 0 for true; 1 for false.
    log_debug "Begin."
    if [[ ${redhat_release} = "CentOS Linux release 7"* ]]; then
        log_debug "Detected CentOS 7."
        return_value=0
    elif [[ ${redhat_release} = "Red Hat Enterprise Linux Server release 7"* ]]; then
        log_debug "Detected RHEL 7."
        return_value=0
    else
        log_debug "Release \"${redhat_release}\" is not EL 7."
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return $return_value
}


is_centos() {
# Checks if this is a CentOS system.
# Returns 0 for true; 1 for false.
# Note: a "Red Hat Enterprise Linux" result will return FALSE.
    log_debug "Begin."
    local release
    release=$(cat /etc/redhat-release)
    if [[ _${release} == _"CentOS release "* ]] || \
       [[ _${release} == _"CentOS Linux release "* ]]; then
        log_debug "Detected \"${release}\", which is CentOS."
        return_value=0
    else
        log_debug "Detected \"${release}\", which is NOT CentOS."
        return_value=1
    fi
    log_debug "End. Returning \"${return_value}\"."
    return $return_value
}


is_puppet_two() {
# Attempts to determine if Puppet version 2.* is already installed.
# Returns 0 for true; 1 for false.
    local puppet_version return_value
    puppet_version=$(puppet --version 2>/dev/null || echo error )
    if [[ ${puppet_version} =~ ^2 ]]; then
        log_debug "Puppet 2 detected."
        return_value=0
    elif [[ ${puppet_version} = "error" ]]; then
        log_debug "Puppet not detected."
        return_value=1
    else
        log_debug "Puppet detected but not version 2."
        return_value=1
    fi
    return ${return_value}
}  # end is_puppet_two()


do_or_die() {
# If the provided script exists, run it.
# Otherwise, do nothing.
# If the script runs and returns non-zero exit code, abort execution immediately.
    log_debug "Begin."
    local result
    if [ -x "${1}" ]; then
        log_info "Running script \"${1}\"."
        bash "$@" ; result=$?
        if [ ! ${result} == 0 ]; then
            log_error "Script ${1} returned ${result}. Abort!"
            exit ${result}
        fi
    else
        log_info "No executable script \"${1}\". Skipping."
    fi
    log_debug "End."
}


# Only invoke main() if we were NOT sourced.
# This allows other scripts to source this file and cherry-pick function calls.
[ "$0" = "$BASH_SOURCE" ] && nature=executed || nature=sourced
if [ _${nature} != _"sourced" ]; then
    log_debug "Executing main()."
    main
else
    log_debug "Being read as source. Skipping main() execution."
fi
