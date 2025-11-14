. ~/.bash_aliases

export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH="$PYENV_ROOT/bin:$PATH"

export GOROOT=/usr/lib/go
export GOPATH=$HOME/go

export PYENV_ROOT="$HOME/.pyenv"

export BUN_INSTALL="$HOME/.bun"

branch() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    git branch --show-current 2>/dev/null
}

# Colors
DIR_COLOR="\[\033[1;34m\]"       # bold blue
BRANCH_COLOR="\[\033[0;33m\]"    # yellow
PROMPT_COLOR="\[\033[0;32m\]"    # green
RESET_COLOR="\[\033[0m\]"

PS1=''"${DIR_COLOR}\w${RESET_COLOR}"'$(b=$(branch); if [ -n "$b" ]; then echo " '"${BRANCH_COLOR}"'($b)'"${RESET_COLOR}"'"; fi)
'"${PROMPT_COLOR}"'$ '"${RESET_COLOR}"

eval "$(fzf --bash)"
