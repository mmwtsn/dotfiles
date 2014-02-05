# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# allow for Vim-like command line movement
set -o vi

# set default cd path for quick auto-complete of ~/Code directory
if test "#{PS1+set}"; then
  export CDPATH=$HOME/Code:CDPATH
fi

# colors
black="\[\033[01;30m\]"
red="\[\033[01;31m\]"
green="\[\033[01;32m\]"
yellow="\[\033[01;33m\]"
blue="\[\033[01;34m\]"
magenta="\[\033[01;35m\]"
cyan="\[\033[01;36m\]"
white="\[\033[01;37m\]"

# bash aliases
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ls="ls -G"
alias vrc="vim ~/.vimrc"
alias brc="vim ~/.bashrc"
alias prc="vim ~/.bash_profile"
alias vim="vim -p"
alias cc="compass compile --force -s compressed"
alias cw="compass watch -s compressed"
alias todos="grep -ri 'todo' . | wc -l"
alias notes="grep -ri 'note' . | wc -l"
alias shot="shotgun"

# Default all GitHub Gists to private with a description
alias g="gist -p -d"

# launch iOS Simulator in OS X
alias ios='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/'

# git aliases
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb="git branch"
alias gs="git status -sb --ignore-submodules"
alias ga="git add"
alias gc="git commit -m '"
alias gac="git add . && git commit -m '"
alias gpp="git pull --rebase && git push"
alias gpm="git checkout dev && git fetch --all --prune && git pull" # Git prune, merge

# Abstract path to local installation of the Do Something site
export PRODUCTION_PATH='/Users/maxwell/Code/do-something/production'

# Update Git environment by pulling upstream/dev, rebasing and pushing to origin dev
function update() {
  # Run this in the appropriate directory
  $(cd $PRODUCTION_PATH)

  # Ensure that your working tree is clean
  if git status | grep 'nothing to commit' > /dev/null; then
    # Run the update sequence
    echo -e "\033[01;33mChecking out dev..\033[01;37m"
    git checkout dev
    echo -e "\033[01;33mFetching upstream..\033[01;37m"
    git fetch upstream
    echo -e "\033[01;33mRebasing dev..\033[01;37m"
    git rebase upstream/dev
    echo -e "\033[01;33mUpdating fork..\033[01;37m"
    git push origin dev
    echo -e "\033[01;32m\nDone!\033[01;37m"
  else
    # Failed to update due to dirty working tree
    echo -e "\033[1;31mWoops. Commit your changes before updating.\033[01;37m"
  fi
}

# Gracefully reboot Vagrant
function reboot() {
  # Run this in the appropriate directory
  $(cd $PRODUCTION_PATH)

  echo -e "\033[01;33mSuspending Vagrant..\033[01;37m"
  vagrant suspend
  echo -e "\033[01;33mHalting Vagrant.\033[01;37m"
  vagrant halt
  echo -e "\033[01;33mRestarting Vagrant..\033[01;37m"
  vagrant up
  echo -e "\033[01;33mChecking status..\033[01;37m"
  vagrant status
  echo -e "\033[01;32m\nDone!\033[01;37m"
}

# add RVM to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Add PostgreSQL to PATH
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Add MongoDB to PATH
export PATH=$PATH:/usr/local/mongodb/bin

# Grunt auto-completion
eval "$(grunt --completion=bash)"

# Add ImageMagick to PATH
export MAGICK_HOME="/opt/local"
export PATH="$MAGICK_HOME/bin:$PATH"

# current git branch less the leading asterisk and space
function current_git_branch {
  git branch 2> /dev/null | grep ^* | sed 's/^..//' | sed 's/\(.*\)/\(\1\)/'
}

# Git auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# ps1
# function idea credit: shaman.sir via StackOverflow.com
# permalink: http://stackoverflow.com/a/6086978
function mac_PS1 {
    local environment="maxwell"
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt="⚡ "
    export PS1="$black$open_bracket$environment$close_bracket$open_bracket$red$current_dir$black$close_bracket$black\$(current_git_branch)$black$prompt$white"
    export PS1="$blue[$current_dir]$yellow\$(current_git_branch)$red$prompt$white"
}
mac_PS1

function vagrant_PS1 {
    local environment="vagrant"
    local delimiter=":"
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt=" ⚡ "
    export PS1="$black$open_bracket$environment$close_bracket$open_bracket$blue$current_dir$black$close_bracket$black\$(current_git_branch)$black$prompt$white"
    export PS1="$blue[$current_dir]$black\$(current_git_branch)$blue$prompt$red"
}

if [[ $USER = "vagrant" ]]; then
  vagrant_PS1
fi
