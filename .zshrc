# If you come from bash you might have to change your $PATH.
PATH=$HOME/bin:/usr/local/bin:$PATH

# enable core dumps
ulimit -c unlimited

# use vi bindings
bindkey -v 

# Path to your oh-my-zsh installation.
export ZSH="/Users/jon.kelso/.oh-my-zsh"
export ENABLE_UNITY_BUILD_NOTIFICATIONS=1
export TODOTXT_DEFAULT_ACTION=ls

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell" # look for a theme which uses hg_prompt_info


function google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }
function grepsrc() { find . -type f \( -name '*.cpp' -o -name '*.c' -o -name '*.cs' -o -name '*.h' -o -name '*.hpp' \)  -exec grep --color=auto -Hn "$1" {} \; }

#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[magenta]%}hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[magenta]%})"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="%y/%m/%d %T"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(mercurial git)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# aliases
alias python='python3'
alias buildBoth='./jam MacEditor && ./jam MacPlayer'
alias buildBothRelease='./jam MacEditor -sCONFIG=release && ./jam MacPlayer -sCONFIG=release'
alias buildEditor='./jam MacEditor'
alias jme='./jam MacEditor'
alias buildEditorRelease='./jam MacEditor -sCONFIG=release'
alias buildPlayer='./jam MacPlayer'
alias buildPlayer='./jam MacPlayer -sCONFIG=release'
alias agsrc='ag -i -stats --cpp --csharp'
alias bk='bokken-cli'
alias ll='ls -alhF'
alias ld='ls'
alias t='todo.sh -d /Users/jon.kelso/.todo.cfg'
# Git
alias gs='git status'
alias gb='git branch'
alias gitb='git branch'
alias gits='git status'
alias gnuke='echo "Cleaning build..." && rm -rf artifacts && rm -rf build && echo "Cleaning git repo..." && git reset --hard HEAD && git clean -f -d && echo "Done."'
alias clean='echo "Cleaning build..." && rm -rf artifacts && rm -rf build'
alias gc='git commit -m'
alias hidebranch='git config --add oh-my-zsh.hide-status 1'
alias showbranch='git config --add oh-my-zsh.hide-status 0'
# Example aliases
PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT' 
$: '
ctags=/usr/local/bin/ctags
