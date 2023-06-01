#!/bin/sh

ABSPATH=$(cd "$(dirname "$0")"; pwd -P)
cd $ABSPATH

if [ ! -d venv ]; then
	python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
fi

source venv/bin/activate

pyinstaller --add-data "venv/lib/$(ls venv/lib)/site-packages/codicefiscale:./codicefiscale" --onefile main.py

mv dist/main dist/random-fiscal-code-$(uname -m)

echo
echo "###############################"
echo "#                             #"
echo "# random-fiscal-code is built #"
echo "#                             #"
echo "###############################"
echo