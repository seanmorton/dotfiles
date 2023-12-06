export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/<VAR_USERNAME>/.config
GPG_TTY=$(tty)
export GPG_TTY
export SOPS_PGP_FP=
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export DIRENV_LOG_FORMAT=

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %1d%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

# git
alias g="git "
alias yolo="git commit --no-verify"
alias rebase="git checkout main && git pull && git checkout - && git rebase main"
alias pwnbranches="git branch > /tmp/branches && vim /tmp/branches && xargs git branch -D < /tmp/branches"

# git doge
alias amaze="doge"
alias such="git"
alias very="git"
alias many="git"
alias much="git"
alias so="git"
alias the="git"
alias wow="git status"

# shortcuts
alias ag="rg -i"
alias ll="ls -l"
alias cputemp="watch -n3 --color istats"
alias hl="hledger --strict"
alias reload="source ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias acc="cd ~/src/accounting"
alias k="kubectl "
alias mk="minikube kubectl --"
alias kset="kubectl config set-context --current "
alias gcp="gcloud "
alias tf="terraform "
alias todo="vim ~/TODO"

# setup completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit

# git completion and current branch in right prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# utilities
function csvcat {
  cat "$@" | column -t -s,
}

# completion
source <(kubectl completion zsh)

eval "$(direnv hook zsh)"
