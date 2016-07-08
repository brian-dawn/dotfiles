# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

################
# Custom Theme #
################

set fish_color_normal dedede
set fish_color_command 7aa6da
set fish_color_quote e78c45
set fish_color_redirection c397d8
set fish_color_end c397d8
set fish_color_error d54e53
set fish_color_param ffffff
set fish_color_comment 999999
set fish_color_match 70c0b1
set fish_color_search_match c397d8
set fish_color_operator 70c0b1
set fish_color_escape 70c0b1
set fish_color_cwd b9ca4a

# Base16 Shell
if status --is-interactive
  eval sh $HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh
end

# Disable greeting.
set fish_greeting ""

####################
# Custom Functions #
####################

function add_to_path --description 'Persistently prepends paths to your PATH'
  set --universal fish_user_paths $fish_user_paths $argv
end

#########################
# Environment Variables #
#########################

set -x TERM xterm-256color


# Golang
set -x GOPATH $HOME/.go

###########
# Aliases #
###########

# Random
alias ll 'ls -l'

# Git aliases
alias gg  'git log --oneline --graph'
alias gs  'git status'
alias gco 'git checkout'
alias gh  'git rev-parse HEAD'

# Emacs
alias emacs 'emacs -nw'

######################
# Path Modifications #
######################

add_to_path $HOME/.local/bin
add_to_path $HOME/.bin
add_to_path /usr/local/bin

# Emacs
add_to_path $HOME/.cask/bin

# Golang
add_to_path $GOPATH/bin
