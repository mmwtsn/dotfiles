# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# maxwell's preferences

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
alias chromecss="vim ~/Library/Application\ Support/Google/Chrome/Default/User\ StyleSheets/Custom.css"

# git aliases
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m '"
alias gac="git add . && git commit -m '"
alias gpp="git pull --rebase && git push"

# add RVM to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# current git branch less the leading asterisk and space
function current_git_branch {
  git branch 2> /dev/null | grep ^* | sed 's/^..//' | sed 's/\(.*\)/\(\1\)/'
}

# ps1
# function idea credit: shaman.sir via StackOverflow.com
# permalink: http://stackoverflow.com/a/6086978
function my_PS1 {
    local open_bracket="["
    local current_dir="\W"
    local close_bracket="]"
    local prompt="⚡ "
    export PS1="$magenta$open_bracket$current_dir$close_bracket$black\$(current_git_branch)$white$prompt$white"
}
my_PS1

# vagrant-specific settings
alias dbox="~/bin/dropbox.py"
alias boom="sudo /usr/sbin/setenforce 0 && sudo /etc/init.d/network restart"

if [[ $USER = "vagrant" ]]; then
  alias ls="ls --color"
  `~/bin/dropbox.py start`
fi
