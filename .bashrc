# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
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
alias sw="sass --watch --compass ds_campaign.sass:ds_campaign.css"
alias vrc="vim ~/.vimrc"
alias brc="vim ~/.bashrc"
alias vim="vim -p"
alias cc="compass compile --force -s compressed"
alias cw="compass watch -s compressed"
alias gw="grunt watch"
alias todos="grep -ri 'todo' . | wc -l"
alias notes="grep -ri 'note' . | wc -l"

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

# add RVM to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Add PostgreSQL to PATH
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

# Add MongoDB to PATH
export PATH=$PATH:/usr/local/mongodb/bin

# Add ImageMagick to PATH
export MAGICK_HOME="/opt/local"
export PATH="$MAGICK_HOME/bin:$PATH"

# current git branch less the leading asterisk and space
function current_git_branch {
  git branch 2> /dev/null | grep ^* | sed 's/^..//' | sed 's/\(.*\)/\(\1\)/'
}

# ps1
# function idea credit: shaman.sir via StackOverflow.com
# permalink: http://stackoverflow.com/a/6086978
function mac_PS1 {
    local environment="x"
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt="⚡ "
    export PS1="$black$open_bracket$environment$close_bracket$open_bracket$red$current_dir$black$close_bracket$black\$(current_git_branch)$black$prompt$white"
}
mac_PS1

function vagrant_PS1 {
    local environment="v"
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt="⚡ "
    export PS1="$black$open_bracket$environment$close_bracket$open_bracket$blue$current_dir$black$close_bracket$black\$(current_git_branch)$black$prompt$white"
}

# vagrant-specific settings
alias dbox="~/bin/dropbox.py"
alias boom="sudo /usr/sbin/setenforce 0 && sudo /etc/init.d/network restart"

if [[ $USER = "vagrant" ]]; then
  vagrant_PS1
  alias ls="ls --color"
  alias dcc="drush cc all"
  alias dccjs="drush cc css-js"
  `~/bin/dropbox.py start`
fi
