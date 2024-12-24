# shellcheck disable=SC2034
# LESS_TERMCAP_mb=$(
#   tput bold
#   tput setaf 2
# ) # green
# LESS_TERMCAP_md=$(
#   tput bold
#   tput setaf 6
# ) # cyan
# LESS_TERMCAP_me=$(tput sgr0)
# LESS_TERMCAP_so=$(
#   tput bold
#   tput setaf 3
#   tput setab 4
# ) # yellow on blue
# LESS_TERMCAP_se=$(
#   tput rmso
#   tput sgr0
# )
# LESS_TERMCAP_us=$(
#   tput smul
#   tput bold
#   tput setaf 7
# ) # white
# LESS_TERMCAP_ue=$(
#   tput rmul
#   tput sgr0
# )
# LESS_TERMCAP_mr=$(tput rev)
# LESS_TERMCAP_mh=$(tput dim)
# LESS_TERMCAP_ZN=$(tput ssubm)
# LESS_TERMCAP_ZV=$(tput rsubm)
# LESS_TERMCAP_ZO=$(tput ssupm)
# LESS_TERMCAP_ZW=$(tput rsupm)
# LESS="--RAW-CONTROL-CHARS"
 
LESS_TERMCAP_ZN=""
LESS_TERMCAP_ZO=""
LESS_TERMCAP_ZV=""
LESS_TERMCAP_ZW=""
LESS_TERMCAP_mb="[1m[32m"
LESS_TERMCAP_md="[1m[36m"
LESS_TERMCAP_me="[m"
LESS_TERMCAP_mh="[2m"
LESS_TERMCAP_mr="[7m"
LESS_TERMCAP_se="[23m[m"
LESS_TERMCAP_so="[1m[33m[44m"
LESS_TERMCAP_ue="[24m[m"
LESS_TERMCAP_us="[4m[1m[37m"
export LESS_TERMCAP_ZN
export LESS_TERMCAP_ZO
export LESS_TERMCAP_ZV
export LESS_TERMCAP_ZW
export LESS_TERMCAP_mb
export LESS_TERMCAP_md
export LESS_TERMCAP_me
export LESS_TERMCAP_mh
export LESS_TERMCAP_mr
export LESS_TERMCAP_se
export LESS_TERMCAP_so
export LESS_TERMCAP_ue
export LESS_TERMCAP_us
 
