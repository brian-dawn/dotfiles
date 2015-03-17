source ~/repos/antigen/antigen.zsh

#Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle cabal
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
antigen theme norm

# Tell antigen that you're done.
antigen apply

export CASE_SENSITIVE=true

# Tee is a cool program.
autoload -U colors && colors

export ANT_OPTS="-Xmx1024m -Xms512m"
#
# # Prompt.
# # Git integration and all that jazz.
# setopt prompt_subst
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats \
#   '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
# zstyle ':vcs_info:*' enable git 
# precmd () { vcs_info }
#
# PS1="%{$fg[yellow]%}%~ \$vcs_info_msg_0_%{$fg[red]%}$ %{$reset_color%}%"

export HOST=thoreau
export TERM=xterm-256color
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig"
export SHELL=/bin/zsh

export GREP_OPTIONS='--color=always'

export GOPATH=$HOME/.go
export GOROOT=`go env GOROOT`

export PATH=$PATH:~/cabal/ghc-mod-sandbox/.cabal-sandbox/bin
export PATH=$PATH:~/.bin
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOROOT/bin

export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin"

export PATH=$HOME/.cabal/bin:$PATH
export PATH="$HOME/Library/Haskell/bin:$PATH"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

export C42_CORE="${HOME}/repos/core"

alias clang++='clang++ -Wall -Werror -Wextra -Wno-c++11-extensions -std=c++11 -stdlib=libc++'

# Git completion.
autoload -U compinit && compinit

# OSX specific garbage.
if [[ "$(uname)" == "Darwin" ]]; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced

    export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home'
    export ANDROID_HOME=/usr/local/opt/android-sdk

    #alias ls='ls --color=auto'
    # For max fun gh | clipboard
    alias clipboard=pbcopy
    alias open-ports='sudo lsof -i -P | grep -i "listen"'

    alias emacs=Emacs

    # postgres
    alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
    alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
fi

# Awful person aliases
alias ..='cd ..'
alias ../..='cd ../..'
alias ../../..='cd ../../..'

alias sorry='sudo !!'
alias ll='ls -l'
alias clojure='lein repl'

# Git aliases
alias gg='git log --oneline --graph'
alias gs='git status'
alias gco='git checkout'
# Git current commit hash.
alias gh='git rev-parse HEAD'
alias git-fuck-it='git clean -d -X -f; git reset --hard'

# my own alias's/tools.
alias bd-git-head-changed-files='git diff-tree --no-commit-id --name-only -r HEAD'
alias bd-dot-make-links='python ~/.bin/makelinks.py'
alias bd-dot-add-submodule='python ~/.bin/add-submodule.py'

# Docker aliases
alias docker-kill-all='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias docker-kill-exited="docker ps -a | awk '/Exit/ {print $1}' | xargs docker rm"

alias rust-up='curl https://static.rust-lang.org/rustup.sh | sudo sh'

alias pxi=pixie-vm

export PATH=/usr/local/sbin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
