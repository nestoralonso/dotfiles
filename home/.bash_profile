# Load the Ruby Loader
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# This loads nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
# allows git usage in PS1
[[ -s "$HOME/scripts/bash-support/git-prompt.sh" ]] && source "$HOME/scripts/bash-support/git-prompt.sh"
# Extend our path, include scripts, etc
[[ -s "$HOME/scripts/bash-support/paths.sh" ]] && source "$HOME/scripts/bash-support/paths.sh"
# allows having the current command running as the title of your terminal window
[[ -s "$HOME/scripts/bash-support/current-command.sh" ]] && source "$HOME/scripts/bash-support/current-command.sh"
# custom PS1, configure by commenting out PS1= lines
[[ -s "$HOME/scripts/bash-support/ps1.sh" ]] && source "$HOME/scripts/bash-support/ps1.sh"

# Apps (these are really just aliases, though, and don't augment the PATH
[[ -s "$HOME/Applications/paths.sh" ]] && source "$HOME/Applications/paths.sh"

# handy aliases
# shopt -s direxpand
shopt -s expand_aliases


eval `dircolors -b`
alias ls='ls --color=auto -h'
alias dir='ls --color=auto --format=vertical -h'
alias vdir='ls --color=auto --format=long -h'
alias ll="ls -lh"
alias la="ls -lah"
alias ng="nuke-gently"

# Git
alias gc='git checkout'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gbs='git branch-status'
alias gb='git branch'
alias gls='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=relative'
alias gia='git add --patch'
alias herpderp='ember'

# Python
alias gmusic='cd ~/Development/etkirsch/gmusic && python gmusic.py'
alias http-local-server='python -m SimpleHTTPServer 19876'


# Ruby
alias be='bundle exec'

# Docker
alias docko="docker-compose"
alias docker-stop-all="docker stop \$(docker ps -a -q)"
alias docker-clean="\
  docker rmi \$(docker images --format '{{.Repository}}:{{.Tag}}'); \
  docker rm -v \$(docker ps -a -q -f status=exited); \
  docker volume rm \$(docker volume ls -qf dangling=true); \
  docker rm \$(docker ps -a -q); \
  docker rmi \$(docker images -q -f dangling=true); \
  docker rmi \$(docker images -q -f) -f; \
  docker volume rm \$(docker volume ls -q) \
  docker network rm \$(docker network ls -q)"

alias docker-destroy='\
  docker kill $(docker ps -q); \
  docker-clean;'

alias ccat='$HOME/scripts/vimcat'

# Clipboard
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

# tab completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# colors!
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

export NVM_DIR="$HOME/.nvm"

# http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
# Prevents Ctrl+s and Ctrl+q from haulting vim sessions
stty -ixon

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Cargo / Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Python....
export PATH="$HOME/.pythons/Python-3.6.3/bin:$PATH"


# http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_EXCLUDE=".git,node_modules,.gem,vendor/gems,bower_components,tmp,dist,obj,bin"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g \"!{$FZF_EXCLUDE}/*\" 2> /dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="bfs -type d -nohidden"

bind -x '"\C-p": vim $(fzf);'

#export JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
alias mvn="~/Applications/apache-maven-3.5.3/bin/mvn"
