export PATH="$PATH:$HOME/bin"
export PATH="$HOME/.jenv/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR="vim"
export XDG_CONFIG_HOME=/Users/seanmorton/.config
export LEDGER_FILE=
GPG_TTY=$(tty)
export GPG_TTY
export SOPS_PGP_FP=

# prompt
autoload -U colors && colors
PROMPT="%{$fg[magenta]%}% [%{$reset_color%}% %m%{$fg[magenta]%}% |%{$reset_color%}% %D{%H:%M:%S}%{$fg[magenta]%}% ] %{$reset_color%}% %{$fg[cyan]%}% $ %{$reset_color%}%"

bindkey -v
bindkey '^r' history-incremental-search-backward

### aliases ###

# rails
alias routes='rake routes | less'
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
alias pwnbranches="git branch > /tmp/branches && vim /tmp/branches && xargs git branch -d < /tmp/branches"
alias pwncloudbranches="git branch > /tmp/branches && vim /tmp/branches && xargs git push --delete origin < /tmp/branches"

# shortcuts
alias ll="ls -l"
alias cputemp="watch -n3 --color istats"
alias hl="hledger --strict"
alias reload="source ~/.zshrc"
alias clockin="time (read)"

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

# jenv
eval "$(jenv init -)"

# worthless neat things
alias starwars="telnet towel.blinkenlights.nl"
alias pipes="pipes.sh -BR -t 1 -p 25 -r 10000 -f 20"

# utilities
function csvcat {
  cat "$@" | column -t -s,
}

# gme shortcuts
alias gme="cd ~/src/gamestop"
alias saml="saml2aws login --session-duration=3600 -a "
alias tlc="telepresence quit && telepresence connect"

function gs-vpn() {
 eval $(op signin)
 TOKEN_SECRET=$(op get totp 'GameStop')
 VPN_PASSWORD=$(op get item gamestop | jq -r '.details.fields[] | select(.designation=="password").value')
 { printf "$VPN_PASSWORD\n"; sleep 1; printf "$TOKEN_SECRET\n"; } | sudo openconnect \
 --authgroup='' \
 --servercert pin-sha256:J6oHAiOd0dh4B+kgX+GvMIrPmHSR9+N4dGuOOPjeNVg= \
 --user='' \
 --passwd-on-stdin \
 vpn.gamestop.com
}
function gs-vpn-kill() {
  sudo kill -2 $(pgrep openconnect)
}

function gs-aws() {
 if if [ -z "$1" ];
 then
   echo "no environment specified - gs-launchpad-sandbox, gs-launchpad-preprod, or gs-launchpad-prod are options"
 else
 eval $(op signin)
  TOKEN_SECRET=$(op get totp 'GameStop')
  PASSWORD=$(op get item gamestop | jq -r '.details.fields[] | select(.designation=="password").value')
  saml2aws login --skip-prompt --password=$PASSWORD --mfa-token=$TOKEN_SECRET --session-duration=3600  --cache-saml -a $1
 fi
}
