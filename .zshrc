export PATH="$PATH:$HOME/bin"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/seanmorton/.config

# prompt
autoload -U colors && colors
#PROMPT="%{$fg[yellow]%}% [%{$reset_color%}% %m%{$fg[yellow]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[yellow]%}% ] %{$reset_color%}% %{$fg[green]%}% $ %{$reset_color%}%"
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %m%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# rails
alias bx='bundle exec '
alias log='tail -f log/development.log '
alias routes='rake routes | less'
alias prodhax='fb && heroku run rails c -r production'
alias stagehax='fb && heroku run rails c -r staging'
alias localhax='fb && foreman start -f Procfile.development'
alias dbmigrate='rake db:migrate && rake db:test:prepare'
alias dbrollback='rake db:rollback && rake db:test:prepare'
alias dbstatus='rake db:migrate:status'

# doge
alias amaze="doge"
alias such="git"
alias very="git"
alias many="git"
alias much="git"
alias so="git"
alias the="git"
alias wow="git status"

# git
alias pwnbranches="git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
alias pwncloudbranches="git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git push -delete origin </tmp/merged-branches"

# shortcuts
alias pl="cd ~/src/platform-bazel"
alias wa="cd ~/src/webapp-on-boarding"
alias ll="ls -l"

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
