#!/bin/sh
ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH
dist/random-fiscal-code-$(uname -m) $1 $2

