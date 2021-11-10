[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
autoload -U compinit; compinit


# case insensitive matching only if there are no case-sensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# vi mode
bindkey -v
# makes the switch between modes faster
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

export VISUAL='nvim'
export EDITOR="nvim"

# Paths
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/least/.go/bin
export PATH=$PATH:/Users/least/Library/Python/3.8/bin
export GOPATH="${HOME}/.go"
export GOROOT="/opt/homebrew/opt/go/libexec"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/least/.composer/vendor/bin:$PATH"
export PATH="/Users/least/scripts:$PATH"
export PATH="/Users/least/.emacs.d/bin:$PATH"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# completion
_comp_options+=(globdots) # With hidden files
source ~/.zsh/completion.zsh

# Prompt
 fpath+=$HOME/.zsh/pure
 autoload -Uz promptinit
 promptinit
 prompt pure

# FZF integrations
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Git aliases
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

alias l='lsd -la'
alias ls='lsd'
alias la='ls -a'
alias ll='ls -la'

ZPLUGINDIR=$HOME/.zsh/plugins

if [[ ! -d $ZPLUGINDIR/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZPLUGINDIR/zsh-autosuggestions
fi

source $ZPLUGINDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
