# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH=/Users/cjh/.opencode/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# keybinds
bindkey "^[b" backward-word
bindkey "^[f" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# hooks
autoload -Uz add-zsh-hook
_disable_mouse() { printf '\e[?1000l\e[?1002l\e[?1003l\e[?1006l' }
add-zsh-hook precmd _disable_mouse

# aliases
term-setname() { wezterm cli set-tab-title "$*"; }
alias tt=term-setname
alias python3='/opt/homebrew/bin/python3'
alias pip3='/opt/homebrew/bin/pip3'

# local overrides
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
