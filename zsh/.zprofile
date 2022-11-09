export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


eval "$(/opt/homebrew/bin/brew shellenv)"


export PATH="$HOME/.cargo/bin:$PATH"


if (( $+commands[go] )); then
  export PATH=$PATH:$(go env GOPATH)/bin
fi


if [[ -e ~/.nvm/alias/default ]]; then
  PATH="${PATH}:${HOME}/.nvm/versions/node/v$(cat ~/.nvm/alias/default)/bin"
fi


if [[ -s ~/.rbenv/shims/ruby ]]; then
  PATH="${HOME}/.rbenv/shims:${PATH}"
fi

