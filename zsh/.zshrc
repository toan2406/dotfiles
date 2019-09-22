# Config zsh
export ZSH=/Users/toannguyen/.oh-my-zsh

ZSH_THEME="refined"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  dotenv
  z.lua
)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Config PostgreSQL
export PGDATABASE=postgres


# Load EH tokens
source $HOME/.secrets


# Load nvm
export NVM_DIR="$HOME/.nvm"
if [[ -e ~/.nvm/alias/default ]]; then
  PATH="${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin"
fi
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}


# Load rbenv
if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH="${HOME}/.rbenv/shims:${PATH}"
fi
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}


# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden --nocolor --ignore node_modules -g ""'


# New ctags
# alias ctags="`brew --prefix`/bin/ctags"


# Android configs
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Improve CLI
alias cat='bat'
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vim='nvim'
alias vi='nvim'


# Open CircleCI branch
function ci() {
  open https://circleci.com/gh/Thinkei/workflows/$1
}

function ciob() {
  ci `basename $(pwd)`/tree/"${$(git rev-parse --abbrev-ref HEAD)//\//%2F}"
}


# Run mobile emulator
function emu() {
  if [ "$1" == "ios" ]; then
    open -a Simulator.app
  elif [ "$1" == "android" ]; then
    $HOME/Library/Android/sdk/emulator/emulator -avd $2
  fi
}


# Misc
export PATH=$HOME/.fastlane/bin:$PATH

eval "$(hub alias -s)"

alias venv="python3 -m venv"
alias mp="tree $HOME/Workspace -d -L 2"
alias npmg="npm list -g --depth 0"
alias herostag='hero $@ --context solomon.ehrocks.com'
alias heroprod='hero $@ --context david.ehrocks.com'
alias heroclistag='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_STG herocli --server hero2.staging.ehrocks.com:443'
alias herocliprod='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_PROD herocli --server hero2.ehrocks.com:443'

export EDITOR=nvim
export REACT_EDITOR=nvim

export REVIEW_BASE=master


# Have some fun
if [[ -x /usr/local/bin/cowsay && -x /usr/local/bin/fortune && -x ~/.rbenv/shims/lolcat ]]; then
  fortune | cowsay | lolcat
fi
