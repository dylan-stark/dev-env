# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"
export PATH=${PATH}:${HOME}/.local/scripts

eval "$(uv generate-shell-completion bash)"

export PATH="/home/dylanstark/.pixi/bin:$PATH"

export PATH="/opt/nvidia/nsight-systems/2026.2.1/bin:$PATH"

. "$HOME/.local/share/../bin/env"

# export TASK_EXE='go-task' if needed
alias task="go-task"
eval "$(task --completion bash)"

eval "$(direnv hook bash)"
