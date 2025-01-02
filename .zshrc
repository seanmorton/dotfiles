# man zshparam
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000
# man zshoptions
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/go/bin"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/<VAR_USERNAME>/.config
export RIPGREP_CONFIG_PATH=~/.rgrc
GPG_TTY=$(tty)
export GPG_TTY
export SOPS_PGP_FP=
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export DIRENV_LOG_FORMAT=
export KUBECONFIG="$HOME/.kube/config"

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %1d%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

# git
alias g="git "
alias yolo="git commit --no-verify"
alias rebasemain="git checkout main && git pull && git checkout - && git rebase main"
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
alias watch="watch " # so `watch {alias command}` works
alias cputemp="watch -n3 --color istats"
alias hl="hledger --strict"
alias reload="source ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias acc="cd ~/src/accounting"
alias k="kubectl "
alias ks="switch "
alias mk="minikube kubectl --"
alias kset="kubectl config set-context --current "
alias pods="watch -n 1 kubectl get pods"
alias gcp="gcloud "
alias tf="terraform "
alias todo="vim ~/TODO"
alias diff="git tui diff origin/main"

# setup completion
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit

# install with $(brew --prefix)/opt/fzf/install
# ctrl-r: search $HISTFILE
# ctrl-t: search for a file under cwd
# alt-c: search for a directory name under cwd, then cd into it
# ls ~/Downloads/**<TAB>: filename autocomplete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
# thanks to https://github.com/aws/aws-cli/issues/6979#issuecomment-1355545535
function awsctx() {
  export AWS_PROFILE="$(aws configure list-profiles | fzf)"
  echo "Switched to profile ""$AWS_PROFILE""."
}

# completion
source <(kubectl completion zsh)

eval "$(direnv hook zsh)"
