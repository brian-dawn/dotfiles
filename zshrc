source ~/.antigen.zsh

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

autoload -U colors && colors

export ANT_OPTS="-Xmx1024m -Xms512m"

export TERM=xterm-256color
export PKG_CONFIG_PATH="/usr/X11/lib/pkgconfig"
export SHELL=/bin/zsh

export GREP_OPTIONS='--color=always'

export PATH=$PATH:~/.bin
export PATH=/usr/local/bin:$PATH

# Linux brew
export PATH=$HOME/.linuxbrew/bin:$PATH

# Golang
export GOPATH=$HOME/.go
export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin

# Haskell
export PATH=$PATH:~/cabal/ghc-mod-sandbox/.cabal-sandbox/bin
export PATH=$HOME/.cabal/bin:$PATH

# Ruby
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=/usr/local/opt/ruby/bin:$PATH

# RUST
export RUST_SRC_PATH=$HOME/repos/rust/src
export PATH=$HOME/repos/racer/target/release:$PATH

# C++
alias clang++='clang++ -Wall -Werror -Wextra -Wno-c++11-extensions -std=c++11 -stdlib=libc++'

# Scheme
# Must install rlwrap
alias csi='rlwrap csi'
alias scheme='rlwrap scheme'


# Git completion.
autoload -U compinit && compinit

# Awful person aliases
alias ..='cd ..'
alias ../..='cd ../..'
alias ../../..='cd ../../..'

alias sorry='sudo !!'
alias ll='ls -l'
alias clojure='lein repl'
alias python=python3
alias ipython=ipython3
alias pip=pip3

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
