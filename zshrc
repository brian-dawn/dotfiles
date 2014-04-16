# Created by newuser for 4.3.10
autoload -U colors && colors
PS1="%{$fg[yellow]%}%~ %{$fg[red]%}$ %{$reset_color%}%"

export TERM=xterm-256color
export GREP_OPTIONS='--color=auto'
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig"
export SHELL=/bin/zsh
export PATH=$PATH:~/.dawn/scripts/
alias clang++='clang++ -Wall -Werror -Wextra -Wno-c++11-extensions -std=c++11 -stdlib=libc++'

# Git completion.
autoload -U compinit && compinit

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


# my own alias's/tools.
alias bd-git-head-changed-files='git diff-tree --no-commit-id --name-only -r HEAD'
alias make-links='python ~/repos/dotfiles/makelinks.py'

cd ~

