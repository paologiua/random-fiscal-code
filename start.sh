#!/bin/sh
ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH
python3 main.py $1 $2

