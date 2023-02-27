# peco
## ctrl + r: 過去に実行したコマンドを選択できるようにする
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

## checkoutする
alias gco='git checkout $(git branch | sed -r "s/^[ \*]+//" | peco)'

## switchする
alias gs='git switch $(git branch | sed -r "s/^[ \*]+//" | peco)'

## ctrl + j: change directory for ghq
function peco-cd {
  cd "$( ghq list --full-path | peco)"
}

alias sd='peco-cd'
