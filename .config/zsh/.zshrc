# load configuration files
for file in "$ZDOTDIR"/conf.d/*.zsh; do
    source "$file"
done

# lastly, load starship prompt
eval "$(starship init zsh)"
