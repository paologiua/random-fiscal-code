#!/bin/bash

which -s git >/dev/null 2>&1
if [[ $? != 0 ]];
then
    echo "Git is not installed!"
    exit
fi

ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
BINARY=random-fiscal-code-$OS-$ARCH

if [ ! -d venv ]; then
	cat scripts/init.sh | bash
fi

source venv/bin/activate

pyinstaller \
  --name $BINARY \
  --specpath specs \
  --add-data "../venv/lib/$(ls venv/lib/ | head -1)/site-packages/codicefiscale:./codicefiscale" \
  --onefile src/main.py

if [ -d venv ]; then
  rm -rf build
fi

echo
echo "############################"
echo "#                          #"
echo "# random-fiscal-code built #"
echo "#                          #"
echo "############################"
echo