if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_helpers ]; then
  source ~/.bash_helpers
fi

if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Move "hidden" dot files by default
shopt -s dotglob
