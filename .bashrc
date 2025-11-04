. ~/.bash_aliases

if [ -f /usr/share/git/completion/git-completion.bash ]; then
        source /usr/share/git/completion/git-completion.bash
elif [ -f ~/.git-completion.bash ]; then
        source ~/.git-completion.bash
fi

## Colors?  Used for the prompt.
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

PROMPT_COMMAND=smile_prompt

function smile_prompt
{
        if [ "$?" -eq "0" ]; then
                SC="${GREEN}:)"
        else
                SC="${RED}:("
        fi

        if [ $UID -eq 0 ]; then
                UC="${BRED}"
        else
                UC="${BYELLOW}"
        fi

        git_branch=$(git branch 2>/dev/null | grep '^*' | sed 's/* \(.*\)/(\1)/')
        if [ -n "$git_branch" ]; then
                git_display="${BCYAN}${git_branch}${BWHITE} "
        else
                git_display=""
        fi

        PS1="${BYELLOW}[${BLACK}\W${BYELLOW}]${BBLACK} ${git_display}${SC}${DF} ${BYELLOW}\$${DF} \[\e[0m\]"
}

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
