# .bashrc
umask 022

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export SVN_EDITOR=/usr/bin/vim
export BROWSER="/usr/bin/google-chrome --user-data-dir=${HOME}/.config/man"
export GOPATH="${HOME}/Go"
export SSLKEYLOGFILE="${HOME}/.sslkeylogfile"
export PROFILE_TYPE='blacktop'
unset GNOME_KEYRING_CONTROL

if [ -x ~/bin/nocapslock ]; then
    ${HOME}/bin/nocapslock
fi

for i in ${HOME}/bash-utilities/*.sh ; do
    source $i
done

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

if [ -d ${HOME}/google-cloud-sdk ]; then
	# The next line updates PATH for the Google Cloud SDK.
	source "${HOME}/google-cloud-sdk/path.bash.inc" 2>/dev/null || echo oops

	# The next line enables shell command completion for gcloud.
	source "${HOME}/google-cloud-sdk/completion.bash.inc" 2>/dev/null
fi

# Set credentials vars
if [ -f ~/.credentials.sh ]; then
    source ${HOME}/.credentials.sh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

if is_macos; then
    export PATH=${PATH}:${HOME}/Library/Python/3.6/bin
    #export VAGRANT_DEFAULT_PROVIDER='parallels'
fi
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

source /Users/james.puellmann/.sdkman/bin/sdkman-init.sh

if [ -f ${HOME}/.cargo/env ]; then
    source ${HOME}/.cargo/env
fi
