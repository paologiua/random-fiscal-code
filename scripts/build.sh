#!/bin/sh

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

ABSPATH=$(git rev-parse --show-toplevel)
cd $ABSPATH

if [ ! -d venv ]; then
	cat scripts/init.sh | bash
fi

source venv/bin/activate

pyinstaller \
  --distpath bin \
  --name random-fiscal-code-$OS-$ARCH \
  --specpath specs \
  --add-data "../venv/lib/$(ls venv/lib/ | head -1)/site-packages/codicefiscale:./codicefiscale" \
  --onefile src/main.py

if [ -d venv ]; then
  rm -rf build
fi

echo
echo "###############################"
echo "#                             #"
echo "# random-fiscal-code is built #"
echo "#                             #"
echo "###############################"
echo