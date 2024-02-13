#!/usr/bin/env bash
# vim:filetype=sh

# source ./colors.sh

# function _new_update_ps1() {
#   local git_part hostname_part path_part prompt_part prompt_string
#   git_part=""
#   hostname_part=""
#   path_part=""
#   prompt_part=""
#   prompt_string=""
#
#   git_part="git_part"
#   #shellcheck disable=SC2154
#   hostname_part="${tput_reset}$(hostname -s)${tput_reset}"
#   path_part="path_part"
#   prompt_part="prompt_part "
#
#   prompt_string="${hostname_part} ${path_part} ${git_part} ${prompt_part}"
#
#   echo "PS1=\"${prompt_string}\""
# }

# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
# PS1='$(kube_ps1) \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
PROMPT_DIRTRIM=2
export PROMPT_DIRTRIM
# PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ "

# hn="    ${HOSTNAME}"
# # shellcheck disable=SC2154
# PS1="${tput_fg_cyan}\u${tput_reset}@${tput_fg_green}${hn: -4}${tput_reset}:${tput_fg_blue}\w ${tput_reset}\$ "

STARSHIP_CONFIG="${XDG_CONFIG_HOME:-${HOME}/.config}/starship/starship.toml"
export STARSHIP_CONFIG
eval "$(starship init bash)"

split_prompt=true
export split_prompt

function precmd() {
  if [[ -f ./.precmd.sh ]]; then
    # shellcheck disable=SC1091
    source ./.precmd.sh
  fi
}
starship_precmd_user_func="precmd"
export starship_precmd_user_func
