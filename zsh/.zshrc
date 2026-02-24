# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="eastwood"
export FZF_BASE="$HOME/.local/share/mise/installs/fzf/latest"
plugins=(git z gh mise docker docker-compose zsh-autosuggestions zsh-syntax-highlighting fzf)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6a6a6a'
source $ZSH/oh-my-zsh.sh
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

# Key bindings
bindkey "\e[1;3D" backward-word
bindkey "\e[1;3C" forward-word

# Editor
export EDITOR='vim'

# Aliases
alias pipx='noglob pipx'
alias ta='tmux attach'

# PATH
export PATH="$PATH:$HOME/.local/bin"

# mise
eval "$(mise activate zsh)"
