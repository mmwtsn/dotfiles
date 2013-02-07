# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# maxwell's preferences

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

# vm aliases
alias dbox="~/bin/dropbox.py"
alias boom="sudo /usr/sbin/setenforce 0 && sudo /etc/init.d/network restart"

# git aliases
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb="git branch"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m '"
alias gac="git add . && git commit -m '"
alias gpp="git pull --rebase && git push"

# PS1
export PS1="\[\e[0;34m\][\[\e[m\]\[\e[0;37m\]\W\[\e[m\]\[\e[0;34m\]] \[\e[m\]"

# define variables to print path as URL
HTTP="http://localhost:8080"
REST=$(echo $(pwd -P | sed 's:/var/www/html::'))
alias url="echo $HTTP$REST"

# add RVM to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
