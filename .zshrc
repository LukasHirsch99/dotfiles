ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# Pure
PURE_CMD_MAX_EXEC_TIME=10
zstyle :prompt:pure:path color green
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

# Ctrl - Arrowkey jumps
# bindkey "$terminfo[kRIT5]" forward-word
# bindkey "$terminfo[kLFT5]" backward-word
# bindkey "^[[1;3C" end-of-line
# bindkey "^[[1;3D" beginning-of-line

# Plugins
zinit wait lucid for \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  Aloxaf/fzf-tab

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# Snippets
# zinit snippet OMZP::git
# zinit snippet OMZP::sudo
# zinit snippet OMZP::archlinux
# zinit snippet OMZP::command-not-found

autoload -U compinit promptinit
compinit

# Use ANSI-color
export TERM=xterm-256color
export EDITOR="nvim"

# Keybindings
bindkey '^f' autosuggest-accept
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
# [ -s "/home/lukas/.bun/_bun" ] && source "/home/lukas/.bun/_bun"
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="/var/lib/snapd/snap/bin:$PATH"

# Aliases
alias ls='lsd'
alias grep='grep --color=auto'
alias ta='tmux attach'
alias tas='tmux attach -t'
alias td='tmux detach'
alias tl="tmux list-sessions"
alias py='python'
alias ags='AGS_SKIP_V_CHECK=true ags'
alias nv='nvim .'
alias c="clear"
alias e="exit"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Environment Variables
if [ -f .env ]; then
  set -a; source .env; set +a
fi
