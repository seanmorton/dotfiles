export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='fd --type f'
#export PATH="$PATH:$HOME/bin"
# export LEDGER_FILE=
# export XDG_CONFIG_HOME=/home/seanmorton/.config

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %m%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# wow
alias amaze="doge"
alias such="git"
alias very="git"
alias many="git"
alias much="git"
alias so="git"
alias the="git"
alias wow="git status"

# git
alias pwnrembranches="git branch >/tmp/git-branches && vim /tmp/git-branches && xargs git push --delete origin </tmp/git-branches"
alias pwnlocbranches="git branch >/tmp/git-branches && vim /tmp/git-branches && xargs git branch -D </tmp/git-branches"

# crypto
alias enc="openssl enc -e -aes-256-cbc -a -salt"
alias dec="openssl enc -d -aes-256-cbc -a"

# shortcuts
alias ll="ls -l"
alias hl="hledger"
alias reload="source ~/.zshrc"
# alias open="xdg-open"

# git completion and current branch in right prompt
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# thefuck
eval $(thefuck --alias)
eval $(thefuck --alias FUCK)
