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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

eval "$(rbenv init -)"


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


# Open Github PR page
function gho() {
  open https://github.com/Thinkei/`basename $(pwd)`/pulls
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

alias mp="tree $HOME/Workspace -d -L 2"
alias npmg="npm list -g --depth 0"
alias herostag='hero $@ --context solomon.ehrocks.com'
alias heroprod='hero $@ --context david.ehrocks.com'

export REACT_EDITOR=nvim
