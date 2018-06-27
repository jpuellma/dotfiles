# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
umask 022

alias pat="puppet agent -t 2>&1 | tee ~/pat.out"
alias patd="puppet agent -t --debug 2>&1 | tee ~/pat.out"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
path_bash_inc="${HOME}/google-cloud-sdk/path.bash.inc"
if [ -f "${path_bash_inc}" ]; then
    source "${path_bash_inc}"
fi

completion_bash_inc="${HOME}/google-cloud-sdk/completion.bash.inc"
# The next line enables shell command completion for gcloud.
if [ -f "${completion_bash_inc}" ]; then
    source "${completion_bash_inc}"
 fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/james.puellmann/.sdkman"
[[ -s "/Users/james.puellmann/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/james.puellmann/.sdkman/bin/sdkman-init.sh"
