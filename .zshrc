export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/scripts"
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
alias startworkers="rake resque:start sidekiq:start"
alias stopworkers="rake resque:stop sidekiq:quiet sidekiq:stop"
alias ts="cd ~/termsync"
alias tickets="tmux ls"

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
alias mergetool="vim `git diff --name-only | uniq`"

# worthless neat things
alias starwars="telnet towel.blinkenlights.nl"
alias randocow="fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.03/share/cows/ | gshuf -n1)"
eval "$(thefuck-alias)"
eval "$(thefuck-alias FUCK)"
