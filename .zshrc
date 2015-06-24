export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/bin" # Custom scripts
export CLICOLOR=1

# prompt
autoload -U colors && colors
PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %n%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# rails
alias bx='bundle exec '
alias log='tail -f log/development.log '
alias startworkers="rake workers:start && rake sidekiq:start"
alias stopworkers="rake workers:killall workers:kill_zombies && rake sidekiq:quiet sidekiq:stop"
alias ts="cd ~/termsync"

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
alias pdfconv="libreoffice --headless --convert-to pdf"

# worthless neat things
alias starwars="telnet towel.blinkenlights.nl"

