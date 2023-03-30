# peco
# ctrl + r: Select a command done past
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# kill specific port
# example: pk 3000
function pkill() {
  kill -9 $(lsof -t -i :$1)
}
alias -g pk="pkill"

# Change directory for ghq
function pcd {
  code "$( ghq list --full-path | peco)"
}
alias sd='pcd'

# git
alias -g g='git'
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
alias -g R='`git remote | peco --prompt "GIT REMOTE>" | head -n 1`'
alias -g gsw='git switch $(git branch | sed -r "s/^[ \*]+//" | peco)'
git config --global alias.a 'add'
git config --global alias.b 'branch'
git config --global alias.c 'commit -m'
git config --global alias.co 'checkout'
git config --global alias.p 'pull'
git config --global alias.pu 'push'