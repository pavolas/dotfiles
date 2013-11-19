#export TERM=Apple_Terminal
. ~/bin/bash_colors.sh
# Set the default editor.
export EDITOR=vim

# Add paths that should have been there by default
export PATH=${PATH}:/usr/local/bin
export PATH="$HOME/bin:$PATH"

# Add paths for chromium
export PATH="$HOME/projects/depot_tools:$PATH"

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
else
    platform='darwin'
fi

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
if [[ $platform == 'linux' ]]; then
    alias ls='ls -G --color'
else
    alias ls='ls -G'
    export CLICOLOR=1
fi
export LSCOLORS="gxfxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000
# Append to the history file when exiting instead of overwriting it
shopt -s histappend


source ~/bin/git-completion.bash

# Color the prompt
source ~/bin/git-prompt.sh
# function color_my_prompt {
#     local __user_and_host="\[\033[00;32m\]\u@\h"
#     local __cur_location="\[\033[00;36m\]\w"
#     local __git_branch_color="\[\033[31m\]"
#     local __prompt_tail="\[\033[35m\]$"
#     local __last_color="\[\033[00m\]"
#     export PS1="$__user_and_host $__cur_location $__git_branch_color\$(__git_ps1)$__prompt_tail$__last_color "
# }
#color_my_prompt
# Using tput makes <ctr r> history search work on mac os x
 function color_my_prompt {
    local green=$(tput setaf 2)
    local red=$(tput setaf 1)
    local cyan=$(tput setaf 6)
    local magenta=$(tput setaf 5)
    # local bold=$(tput bold)
    local reset=$(tput sgr0)
    local __user_and_host="\[$green\]\u@\h\[$reset\]"
    local __cur_location="\[$cyan\]\w\[$reset\]"
    local __tail="\[$magenta\]$\[$reset\]"
    export PS1="$__user_and_host $__cur_location \[$red\]\$(__git_ps1)\[$reset\]$__tail "
 }
color_my_prompt

# This seems necessary to make ctrl-r history search work on os-x
# Both commands work. For some reason, setting "xterm" as the emulation terminal under preferences has no effect.
export TERM=xterm
#export TERM=Apple_Terminal
