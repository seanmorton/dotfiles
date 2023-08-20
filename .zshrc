export PATH="$PATH:$HOME/bin"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/<VAR_USERNAME>/.config
GPG_TTY=$(tty)
export GPG_TTY
export SOPS_PGP_FP=

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %1d%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

# rails
alias routes='rake routes | less'
alias dbmigrate='rake db:migrate && rake db:test:prepare'
alias dbrollback='rake db:rollback && rake db:test:prepare'
alias dbstatus='rake db:migrate:status'

# git doge
alias amaze="doge"
alias such="git"
alias very="git"
alias many="git"
alias much="git"
alias so="git"
alias the="git"
alias wow="git status"

# git
alias g="git "
alias pwnbranches="git branch > /tmp/branches && vim /tmp/branches && xargs git branch -D < /tmp/branches && xargs git push --delete origin < /tmp/branches"
alias yolo="git commit --no-verify"

# shortcuts
alias ag="rg -i"
alias ll="ls -l"
alias cputemp="watch -n3 --color istats"
alias hl="hledger --strict"
alias reload="source ~/.zshrc"
alias python="python3"
alias pip="pip3"
alias acc="cd ~/src/accounting"
alias gol="cd ~/src/go"
alias k="kubectl "
alias kset="kubectl config set-context --current "
alias tf="terraform "

# git completion and current branch in right prompt
autoload -Uz compinit && compinit
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
