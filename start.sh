#!/bin/sh
ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH
dist/main $1 $2

