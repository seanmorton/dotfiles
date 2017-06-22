export PATH="$PATH:$HOME/bin"
export CLICOLOR=1
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/seanmorton/.config

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %m%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ]   %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# rails
alias bx='bundle exec '
alias log='tail -f log/development.log '
alias routes='rake routes | less'

# doge
alias amaze="doge"
alias such="git"
alias very="git"
alias many="git"
alias much="git"
alias so="git"
alias the="git"
alias wow="git status"

# tools
alias mergetool="vim `git diff --name-only | uniq`"

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

# worthless neat things
alias starwars="telnet towel.blinkenlights.nl"
alias pipes="pipes.sh -BR -t 1 -p 25 -r 10000 -f 20"
