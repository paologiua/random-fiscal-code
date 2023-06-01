#!/bin/sh
ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

dist/random-fiscal-code-$OS-$ARCH $1 $2

