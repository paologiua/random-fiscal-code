#!/bin/sh
ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH
venv/bin/python main.py $1 $2

