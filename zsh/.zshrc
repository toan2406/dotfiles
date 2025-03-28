# Uncomment this and run zprof to get profiling information
# zmodload zsh/zprof

# Config zsh
export ZSH=/Users/toannguyen/.oh-my-zsh

ZSH_THEME="refined"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  dotenv
  urltools
)

source $ZSH/oh-my-zsh.sh


# Config PostgreSQL
export PGDATABASE=postgres


# Load EH tokens
source $HOME/.secrets


# Lazyload nvm
export NVM_DIR="$HOME/.nvm"
nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}


export PATH="$(pyenv root)/shims:${PATH}"


export PATH="$HOME/.local/bin:$PATH"


export NODE_OPTIONS="--max_old_space_size=8192"


# Lazyload rbenv
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}


# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^ ' autosuggest-accept
export FZF_DEFAULT_COMMAND="rg --files --ignore-vcs --hidden --glob '!{node_modules,.git}'"


# Android configs
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home


# Improve CLI
# alias cat='bat'
alias help='tldr'
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vim='nvim'
alias vi='nvim'
alias bim='nvim'
alias ls='eza'
# alias ctags="$(brew --prefix)/bin/ctags"
alias ctags="/opt/homebrew/bin/ctags"
export BAT_THEME="gruvbox-dark"


# Open CircleCI branch
function ci() {
  open https://circleci.com/gh/Thinkei/workflows/$1
}

function ciob() {
  if [[ -z "$1" ]]; then
    ci "$(basename $(pwd))/tree/$(urlencode $(git rev-parse --abbrev-ref HEAD))"
  else
    ci "$(basename $(pwd))/tree/$(urlencode $1)"
  fi
}


function gaob() {
  if [[ -z "$1" ]]; then
    open "https://github.com/Thinkei/$(basename $(pwd))/actions?query=$(urlencode branch:$(git rev-parse --abbrev-ref HEAD))"
  else
    open "https://github.com/Thinkei/$(basename $(pwd))/actions?query=$(urlencode branch:$1)"
  fi
}


# Run mobile emulator
function emu() {
  if [[ "$1" == "ios" ]]; then
    open -a Simulator.app
  elif [[ "$1" == "android" ]]; then
    $HOME/Library/Android/sdk/emulator/emulator -avd $2
  fi
}


# Find directory
function fdd() {
  local dir
  dir=$(find $HOME -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m --height 40% --reverse) &&
    cd "$dir"
}


# Find project
function fdp() {
  local dir
  dir=$({ echo "${HOME}/.dotfiles"; find $HOME/Workspace -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1") &&
    cd "$dir"

  # local search=$({ echo "${HOME}/.dotfiles"; find $HOME/Workspace -maxdepth 2 -type d -print 2> /dev/null; } | fzf -q "$1")
  # if [[ -n $search ]]; then
  #   local folder=${$(basename $search)//./_}
  #   local session=$(tmux list-sessions | grep $folder | awk -F ':' '{print $1}')
  #   if [[ -z $TMUX ]]; then
  #     if [[ -z $session ]]; then
  #       tmux new-session -s $folder -c $search
  #     else
  #       tmux attach -t $session
  #     fi
  #   else
  #     if [[ -z $session ]]; then
  #       tmux new-session -d -s $folder -c $search
  #       tmux switch-client -t $folder
  #     else
  #       tmux switch-client -t $session
  #     fi
  #   fi
  # fi
}


# Find branch and checkout
function fco() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}


# npm run test
function nrt() {
  local file
  file=$(fd '\.(test|spec)\.' $PWD --type file --exclude '__snapshots__' | fzf --reverse) &&
    yarn test "$file"
}


# Cheatsheet tool
export NAVI_PATH="$HOME/.dotfiles/cheats"
navi() {
  [[ $# -eq 0 ]] && local query=' ' || local query="$*"
  local result_cmd="$(command navi --print --query $query)"
  print $result_cmd && print -s $result_cmd
  eval $result_cmd
}


# Misc
export PATH=$HOME/.fastlane/bin:$PATH

# eval "$(hub alias -s)"

alias venv="python3 -m venv"
alias mp="tree $HOME/Workspace -d -L 2"
alias npmg="npm list -g --depth 0"
alias herostag='hero $@ --context solomon.ehrocks.com'
alias heroprod='hero $@ --context david.ehrocks.com'
alias heroclistag='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_STG herocli --server hero2.staging.ehrocks.com:443'
alias herocliprod='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_PROD herocli --server hero2.ehrocks.com:443'
alias herocliint='HERO_ACCESS_TOKEN=$HERO_ACCESS_TOKEN_INT herocli --server hero2.integration.ehrocks.com:443'

export EDITOR=nvim
export REACT_EDITOR=nvim
export REVIEW_BASE=master


# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true


# Find brew curl first
export PATH=/usr/local/opt/curl/bin:$PATH


# Find rubocop-daemon-wrapper first
export PATH=/usr/local/bin/rubocop-daemon-wrapper:$PATH


# Config zk
export ZK_NOTEBOOK_DIR=$HOME/Workspace/Personal/my-second-brain


# Have some fun
# if [[ -x /usr/local/bin/cowsay && -x /usr/local/bin/fortune && -x ~/.rbenv/shims/lolcat ]]; then
#   fortune | cowsay | lolcat
# fi


alias arm="arch -arm64"
alias intel="arch -x86_64"


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}


# Execute tmux on start Kitty
if [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
  tmux attach || tmux new-session -s main && exit;
fi


# Config Anaconda
export CONDA_AUTO_ACTIVATE_BASE=false

# Lazyload conda
conda() {

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/toannguyen/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/toannguyen/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/toannguyen/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/toannguyen/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

  conda "$@"
}

