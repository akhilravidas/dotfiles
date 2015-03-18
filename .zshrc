#vi mode
set -o vi

autoload -U compinit && compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#history
export HISTSIZE=1000000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
bindkey '^R' history-incremental-search-backward

if [ -f $HOME/.alias ]; then
  source $HOME/.alias
fi 

function f_vcs_branch {
echo $(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')
}

setopt prompt_subst
autoload -U colors && colors
export PS1='[%{$fg[blue]%}%n@%m%{$reset_color%} %{$fg[yellow]%}%c%{$reset_color%}%{$fg[green]%}$(f_vcs_branch)%{$reset_color%}]\$ '

#cd
setopt correctall
DIRSTACKSIZE=20
setopt autopushd pushdminus pushdsilent pushdtohome

#zsh specific alias
alias dh='dirs -v'

function runtmux() { tmux new-session -As future }
function itermStartup() { runtmux; }
function dock() { boot2docker init;  boot2docker start; export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375; }

export PATH="$HOME/Library/Haskell/bin:$PATH"

export EDITOR=vi

export GOPATH="$HOME/go"

setopt PRINT_EXIT_VALUE
REPORTTIME=1
