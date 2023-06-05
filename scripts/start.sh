#!/bin/bash

cd $(dirname $0)
ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

git fetch > /dev/null 2>&1
if [[ $(git status) != *"Your branch is up to date"* ]]; then
    read -r -p "New update available. Do you want to install it? [y/N] " response

    if [[ "$response" = "y" || "$response" = "Y" ]]; then
        curl -L https://raw.githubusercontent.com/paologiua/random-fiscal-code/main/scripts/install.sh | bash
    fi
fi

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
BINARY=random-fiscal-code-$OS-$ARCH

dist/$BINARY "$@"

