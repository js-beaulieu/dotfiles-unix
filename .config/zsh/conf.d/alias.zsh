alias cat="batcat"
alias ssh="kitty +kitten ssh"
alias ls="exa"

# Create a directory and cd into it
function mcd() {
    mkdir -p "$1" && cd "$1"
}

# ----------------------------------------    
# Git functions
# ----------------------------------------    
alias __git_current_branch="git branch --show-current"
alias __git_main_branch="git config --get init.defaultBranch || echo 'main'"

# manage 'wip' commits
function gwip() {
    git add -A
    git rm "$(git ls-files --deleted)" 2> /dev/null
    git commit -m "--wip--" --no-verify
}
function gunwip() {
    git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1
}
