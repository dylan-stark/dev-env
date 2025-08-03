if [ -d /opt/homebrew/bin ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Adds installed Go binaries to PATH
export PATH="${PATH}:${HOME}/go/bin"

# Adds volta to PATH
export PATH="${HOME}/.volta/bin:${PATH}"
