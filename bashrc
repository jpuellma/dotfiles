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

sudo ${HOME}/bin/nocapslock

for i in $( /bin/run-parts --list ~/.bashrc.d ); do
    . $i
done
setpath
setalias
set_dir_colors

pathmunge ${GOPATH}:${GOPATH}/bin after
