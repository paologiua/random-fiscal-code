#!/bin/sh

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

bin/random-fiscal-code-$OS-$ARCH $1 $2

