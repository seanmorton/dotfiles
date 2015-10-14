export PATH="$PATH:$HOME/bin"
export CLICOLOR=1

# prompt
autoload -U colors && colors
PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# rails
alias bx='bundle exec '
alias log='tail -f log/development.log '

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

# worthless neat things
alias starwars="telnet towel.blinkenlights.nl"
