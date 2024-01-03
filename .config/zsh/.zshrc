# load configuration files
source "$ZDOTDIR/init.zsh"
for file in "$ZDOTDIR"/conf.d/*.zsh; do
  source "$file"
done

# lastly, load starship prompt
eval "$(starship init zsh)"
