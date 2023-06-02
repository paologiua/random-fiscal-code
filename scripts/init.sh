#!/bin/sh

ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
