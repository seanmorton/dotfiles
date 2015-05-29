export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PROMPT="[%n|%D{%H:%M:%S}] $ "

bindkey -v
bindkey '^R' history-incremental-search-backward

### Aliases ###

# rails
alias bx='bundle exec '
alias log='tail -f log/development.log '
alias workers="rake workers:start && rake sidekiq:start"
alias stopworkers="rake workers:killall && rake sidekiq:stop"

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

