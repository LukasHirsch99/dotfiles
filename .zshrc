# Uncomment for startuptime profiling
# zmodload zsh/zprof
# Set directory for zinit and plugins

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if not installed
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source and load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Use ANSI-color
export TERM=xterm-256color
export EDITOR="nvim"

# Use oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/theme.toml)"
fi

# Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Keybindings
# bindkey '^f' autosuggest-accept
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion Style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# bun completions
[ -s "/home/lukas/.bun/_bun" ] && source "/home/lukas/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"

# Aliases
alias ls='lsd'
alias grep='grep --color=auto'
alias ta='tmux attach'
alias tas='tmux attach -t'
alias td='tmux detach'
alias tl="tmux list-sessions"
alias py='python'
alias ags='AGS_SKIP_V_CHECK=true ags'
alias nvconf='nvim ~/.config/nvim/lua/custom/chadrc.lua'
alias c="clear"
alias e="exit"
# alias ssh="kitty +kitten ssh"
# PS1='[\u@\h \W]\$ '
PS1='[%2d] $ '

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Path
export PATH=$PATH:~/.scripts/
export ANDROID_SDK_ROOT='~/.android-sdk'
export ANDROID_HOME="~/.android-sdk"
path+=('/home/lukas/.android-sdk/emulator/')
path+=('/home/lukas/.android-sdk/platform-tools/')
path+=('/home/lukas/.android-sdk/tools/')
path+=('/home/lukas/.android-sdk/tools/bin/')
path+=('/home/lukas/flutter/bin/')


# export NVM_DIR="$HOME/.nvm"
#     [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
#     [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Uncomment for startuptime profiling
# zmodload zsh/zprof
# zprof
