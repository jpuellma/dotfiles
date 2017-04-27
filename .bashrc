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
    ${HOME}/bin/nocapslock
fi

for i in ~/.bashrc.d/*.sh ; do
    source $i
done
_setpath
_set_dir_colors

_pathmunge ${GOPATH}:${GOPATH}/bin after
_pathmunge ${HOME}/.local/lib/aws/bin after
_pathmunge ${HOME}/packer/bin before

complete -C ${HOME}/.local/lib/aws/bin/aws_completer aws

# For EC2 CLI:
# Update: Not needed because ec2 tools are deprecated by aws tool.
# export JAVA_HOME=/etc/alternatives/jre
# export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1
# _pathmunge ${EC2_HOME}/bin after

if ! [[ -z $DISPLAY ]]; then
    xrdb -merge ~/.Xresources
fi

_pathmunge $PATH:$HOME/.rvm/bin after

# The next line updates PATH for the Google Cloud SDK.
source '/home/jpuellmann/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/jpuellmann/google-cloud-sdk/completion.bash.inc'

# Set credentials vars
if [ -f ~/credentials.sh ]; then
    source /home/jpuellmann/credentials.sh
fi
