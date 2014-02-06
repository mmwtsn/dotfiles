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
