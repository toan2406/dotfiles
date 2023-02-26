#!/bin/sh
exec /usr/bin/arch -arm64 "$HOME/go/bin/dlv" "$@"
