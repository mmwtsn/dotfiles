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

# define variables to print path as URL
HTTP="http://localhost:8080"
REST=$(echo $(pwd -P | sed 's:/var/www/html::'))
alias url="echo $HTTP$REST"

# add RVM to path
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# customize PS1 with Git integration
# function idea credit: shaman.sir via StackOverflow.com
# permalink: http://stackoverflow.com/a/6086978
function my_PS1 {
    local open_bracket="\[\033[01;32m\]["
    local my_directory="\[\033[01;32m\]\W"
    local close_bracket="\[\033[01;32m\]]"
    local my_git_branch="\[\033[01;30m\]`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\/`"
    local prompt_symbol="\[\033[01;34m\]$"
    local input_colors="\[\033[01;00m\] "
    export PS1="$open_bracket$my_directory$close_bracket$my_git_branch$prompt_symbol$input_colors"
}
my_PS1
