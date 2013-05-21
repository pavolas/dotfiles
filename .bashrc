. ~/bin/bash_colors.sh

# Add paths that should have been there by default
export PATH=${PATH}:/usr/local/bin
export PATH="~/bin:$PATH"

# Unbreak broken, non-colored terminal
export TERM='xterm-color'
alias ls='ls -G --color'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
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
function color_my_prompt {
    local __user_and_host="\[\033[00;32m\]\u@\h"
    local __cur_location="\[\033[00;36m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color\$(__git_ps1)$__prompt_tail$__last_color "
}
color_my_prompt
