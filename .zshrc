# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/[Username]/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# NEW LINE PROMPT
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# split your segments up between two lines
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)

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
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# auto-suggestion
# plugins=(zsh-autosuggestions)

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Chrome
# parameter $1 as url then chrome will open that url
alias chrome="open -a 'Google Chrome'"

# docker-compose alias
alias dc="docker compose"

# git alias
alias gco="git checkout"
alias gcr="git rev-parse --abbrev-ref HEAD"
alias gb="git branch"
alias gp="git pull"
alias gs="git status"
alias gr="git reset"
alias gf="git fetch"
alias gm="gitCommand"

# node alias
alias kn="killall node"

# gcloud
alias gc="gcloud"
alias gcc="gcloud container"
alias gccc="gcloud container clusters"
alias gcf="gcloud config"
alias gcp="gcloud projects"

# kubectl alias
alias kb="kubectl"
alias kbf="kubectl config"
alias kbpf="kubectl port-forward"

# minikube alias
alias mk="minikube"

# Kafka
export PATH="$PATH:/Users/chaiwatu/kafka_2.13-3.3.1/bin"

# Golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Python
export PATH="$(pyenv root)/shims:$PATH"

# Flutter
# Setup flutter ref: https://www.youtube.com/watch?v=fEfMYAAeHmY
export PATH="$PATH:/Applications/development/flutter/bin"

# Project alias
# source ~/zshrc_alias/.projects_zshrc

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# export PATH="/usr/local/opt/node@10/bin:$PATH"
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Command to use different ssh key for git
alias gnick="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_NickUseGithub_ed25519 -o IdentitiesOnly=yes' git"

# Git Command to commit with right name in description
alias gnickm="GIT_SSH_COMMAND='ssh -i ~/.ssh/id_NickUseGithub_ed25519 -o IdentitiesOnly=yes' git commit --author='Chaiwat Tungtongsoontorn <nickt.tnick@gmail.com>' -m"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/chaiwattungtongsoontorn/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/chaiwattungtongsoontorn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/chaiwattungtongsoontorn/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/chaiwattungtongsoontorn/google-cloud-sdk/completion.zsh.inc'; fi

gitCommand () {
  local description=$1;
  local currentBranch=$(git rev-parse --abbrev-ref HEAD);
  git commit -m "[$currentBranch] $description";
}
