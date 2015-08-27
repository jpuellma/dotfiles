# .bashrc
umask 022

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export SVN_EDITOR=/usr/bin/vim
export BROWSER="/usr/bin/google-chrome --user-data-dir=/home/jpuellmann/.config/man"
export GOPATH="${HOME}/Go"
export SSLKEYLOGFILE="/home/jpuellmann/.sslkeylogfile"
export PROFILE_TYPE='blacktop'
unset GNOME_KEYRING_CONTROL

if [ -x ~/bin/nocapslock ]; then
    sudo ${HOME}/bin/nocapslock
fi

for i in ~/.bashrc.d/*.sh ; do
    source $i
done
_setpath
_set_dir_colors

_pathmunge ${GOPATH}:${GOPATH}/bin after

if ! [[ -z $DISPLAY ]]; then
    /usr/bin/xrdb -merge ~/.Xresources
fi
