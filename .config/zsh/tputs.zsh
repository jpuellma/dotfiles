#!/usr/bin/env bash
# shellcheck disable=SC2034
# vim:filetype=sh
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
 
# tput_reset="\[$(tput sgr0)\]"
# tput_set_bold="\[$(tput bold)\]"
# tput_set_dim="\[$(tput dim)\]"
# tput_set_ul="\[$(tput smul)\]"
# tput_unset_ul="\[$(tput rmul)\]"
# tput_set_reverse="\[$(tput rev)\]"
# tput_set_standout="\[$(tput smso)\]"
# tput_unset_standout="\[$(tput rmso)\]"
# tput_bg_black="\[$(tput setab 0)\]"
# tput_bg_red="\[$(tput setab 1)\]"
# tput_bg_green="\[$(tput setab 2)\]"
# tput_bg_yellow="\[$(tput setab 3)\]"
# tput_bg_blue="\[$(tput setab 4)\]"
# tput_bg_purple="\[$(tput setab 5)\]"
# tput_bg_cyan="\[$(tput setab 6)\]"
# tput_bg_white="\[$(tput setab 7)\]"
# tput_fg_black="\[$(tput setaf 0)\]"
# tput_fg_red="\[$(tput setaf 1)\]"
# tput_fg_green="\[$(tput setaf 2)\]"
# tput_fg_yellow="\[$(tput setaf 3)\]"
# tput_fg_blue="\[$(tput setaf 4)\]"
# tput_fg_purple="\[$(tput setaf 5)\]"
# tput_fg_cyan="\[$(tput setaf 6)\]"
# tput_fg_white="\[$(tput setaf 7)\]"
 
# tput_reset="$(tput sgr0)"
# tput_set_bold="$(tput bold)"
# tput_set_dim="$(tput dim)"
# tput_set_ul="$(tput smul)"
# tput_unset_ul="$(tput rmul)"
# tput_set_reverse="$(tput rev)"
# tput_set_standout="$(tput smso)"
# tput_unset_standout="$(tput rmso)"
# tput_bg_black="$(tput setab 0)"
# tput_bg_red="$(tput setab 1)"
# tput_bg_green="$(tput setab 2)"
# tput_bg_yellow="$(tput setab 3)"
# tput_bg_blue="$(tput setab 4)"
# tput_bg_purple="$(tput setab 5)"
# tput_bg_cyan="$(tput setab 6)"
# tput_bg_white="$(tput setab 7)"
# tput_fg_black="$(tput setaf 0)"
# tput_fg_red="$(tput setaf 1)"
# tput_fg_green="$(tput setaf 2)"
# tput_fg_yellow="$(tput setaf 3)"
# tput_fg_blue="$(tput setaf 4)"
# tput_fg_purple="$(tput setaf 5)"
# tput_fg_cyan="$(tput setaf 6)"
# tput_fg_white="$(tput setaf 7)"
 
tput_fg_black="[30m"
tput_set_reverse="[7m"
tput_unset_ul="[24m"
tput_bg_cyan="[46m"
tput_bg_blue="[44m"
tput_bg_green="[42m"
tput_set_bold="[1m"
tput_bg_purple="[45m"
tput_fg_yellow="[33m"
tput_fg_white="[37m"
tput_set_standout="[3m"
tput_fg_cyan="[36m"
tput_unset_standout="[23m"
tput_fg_red="[31m"
tput_fg_green="[32m"
tput_bg_black="[40m"
tput_set_ul="[4m"
tput_bg_white="[47m"
tput_bg_red="[41m"
tput_fg_purple="[35m"
tput_bg_yellow="[43m"
tput_fg_blue="[34m"
tput_set_dim="[2m"
tput_reset="[m"
export tput_bg_black
export tput_bg_blue
export tput_bg_cyan
export tput_bg_green
export tput_bg_purple
export tput_bg_red
export tput_bg_white
export tput_bg_yellow
export tput_fg_black
export tput_fg_blue
export tput_fg_cyan
export tput_fg_green
export tput_fg_purple
export tput_fg_red
export tput_fg_white
export tput_fg_yellow
export tput_reset
export tput_set_bold
export tput_set_dim
export tput_set_reverse
export tput_set_standout
export tput_set_ul
export tput_unset_standout
export tput_unset_ul
