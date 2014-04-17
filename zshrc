# Created by newuser for 4.3.10
autoload -U colors && colors

# Prompt.
# Git integration and all that jazz.
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:*' enable git 
precmd () { vcs_info }

PS1="%{$fg[yellow]%}%~ \$vcs_info_msg_0_%{$fg[red]%}$ %{$reset_color%}%"

export TERM=xterm-256color
export GREP_OPTIONS='--color=auto'
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig"
export SHELL=/bin/zsh
export PATH=$PATH:~/.bin/
alias clang++='clang++ -Wall -Werror -Wextra -Wno-c++11-extensions -std=c++11 -stdlib=libc++'

# Git completion.
autoload -U compinit && compinit

# OSX specific garbage.
case $OSTYPE in darwin*) 
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
    ;;
*)

    alias ls='ls --color=auto'
    ;;
esac

alias python=python3
alias ipython=ipython3
alias pip=pip3

# OSX pipe into clipboard.
alias clipboard=pbcopy
alias vim=mvim

# my own alias's/tools.
alias bd-git-head-changed-files='git diff-tree --no-commit-id --name-only -r HEAD'
alias bd-dot-make-links='python ~/.bin/makelinks.py'
alias bd-dot-add-submodule='python ~/.bin/add-submodule.py'


