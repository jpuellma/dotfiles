# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
 
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
 
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jpuellma"
 
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
 
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"
 
# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
 
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
 
# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13
 
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
 
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
 
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
 
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
 
# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
 
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
 
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
 
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
 
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv vscode themes)
 
source $ZSH/oh-my-zsh.sh
 
# User configuration
 
# export MANPATH="/usr/local/man:$MANPATH"
 
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
 
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi
 
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"
 
# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
 
 
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# My stuff here
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
 
 
zsh_config_dir="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh"
source_files=()
source_files+=("_functions.zsh") # This needs to go first; it defines things used later.
source_files+=("aliases.zsh")
source_files+=("less_termcaps.zsh")
source_files+=("macos.zsh")
source_files+=("pathmunge.zsh")
source_files+=("sparks.zsh")
source_files+=("termcaps.zsh")
source_files+=("tputs.zsh")
source_files+=("lscolors.zsh")
 
for i in "${source_files[@]}"; do
  f="${zsh_config_dir}/${i}"
  if [[ -f "${f}" ]]; then
    source "${f}" || (echo "Error trying to source \"${f}\"!." >&2)
  else
    echo "Error in \"${0}\": Source file \"${f}\" not found." >&2
  fi
done
 
pathmunge ~/bin
pathmunge ~/Notes/bin
pathmunge /opt/homebrew/Cellar/bash/latest/bin
 
# git tab completion:
autoload -Uz compinit && compinit
 
 
# . ~/.secrets.sh
 
# source ~/venv/bin/activate
 
# IGNOREEOF=2
# xattr -d com.apple.quarantine ~/bin/jq
 
rehash
 
