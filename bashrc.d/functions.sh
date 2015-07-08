function _setpath() {
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

function _settitle() {
    echo -ne "\033]0;$* \007"
}

function _svnfind() {
    find $* | grep -v "\.svn"
}

function _sup() {
    for i in ~/svn/* ; do
        svn up $i
    done
}

function _set_dir_colors() {
    if [[ -f ~/.dircolors && -x /usr/bin/dircolors ]]; then
	eval $(dircolors ~/.dircolors)
    fi
}

function _lrtail() {
    /usr/bin/ls -lrt $* | tail
}; alias lrtail='_lrtail'

