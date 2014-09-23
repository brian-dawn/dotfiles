# Created by newuser for 4.3.10
autoload -U colors && colors

export ANT_OPTS="-Xmx1024m -Xms512m"

# Prompt.
# Git integration and all that jazz.
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats \
  '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
zstyle ':vcs_info:*' enable git 
precmd () { vcs_info }

PS1="%{$fg[yellow]%}%~ \$vcs_info_msg_0_%{$fg[red]%}$ %{$reset_color%}%"

# Disable VI mode lag, note this may cause issues with other commands.
export KEYTIMEOUT=1

export TERM=xterm-256color
export GREP_OPTIONS='--color=always'
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig"
export SHELL=/bin/zsh
export PATH=$PATH:~/.bin
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export GOPATH=$HOME/.go
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin
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

alias ..='cd ..'
alias ../..='cd ../..'
alias ../../..='cd ../../..'

# OSX pipe into clipboard.
alias clipboard=pbcopy
# OSX create my fullscreen window.
alias iterm='open -n -a iTerm'

alias tc=truecrypt
alias open-ports='sudo lsof -i -P | grep -i "listen"'
alias sorry='sudo !!'
alias ll='ls -l'

#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

alias clojure='lein repl'

# tree is awesome!!
# ag is awesome!!

alias gg='git log --oneline --graph'
alias gs='git status'
# Git current commit hash.
alias gh='git rev-parse HEAD'
alias git-fuck-it='git clean -d -X -f; git reset --hard'

# postgres
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# my own alias's/tools.
alias bd-git-head-changed-files='git diff-tree --no-commit-id --name-only -r HEAD'
alias bd-dot-make-links='python ~/.bin/makelinks.py'
alias bd-dot-add-submodule='python ~/.bin/add-submodule.py'

export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
