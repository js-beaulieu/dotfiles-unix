# auto install antidote plugin manager
ANTIDOTE_DIR="$HOME/.local/share/antidote"
if [ ! -d "$ANTIDOTE_DIR" ]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

# load antidote and plugins
source "$ANTIDOTE_DIR/antidote.zsh"
zstyle ":antidote:bundle" file "$HOME/.config/zsh/plugins.txt"
antidote load
