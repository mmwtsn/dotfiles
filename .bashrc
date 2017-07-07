files=(
  /etc/bashrc
  ~/.bash_aliases
  ~/.bash_helpers
  ~/.bash_prompt
  ~/.git-completion.bash
)

for file in "${files[@]}"; do
  if [ -f $file ]; then
    source $file
  fi
done

# Move "hidden" dot files by default
shopt -s dotglob
