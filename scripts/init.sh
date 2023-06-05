#!/bin/bash

cd $(dirname $0)
ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
