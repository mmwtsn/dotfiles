# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Source Bash Aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Source Generic Helper Functions
if [ -f ~/.bash_helpers ]; then
  source ~/.bash_helpers
fi

# Source custom prompt
if [ -f ~/.bash_prompt ]; then
  source ~/.bash_prompt
fi

# Git auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
