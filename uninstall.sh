#!/bin/sh

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/.\/start.sh'")"

sed -i'.bak' "s/$ALIAS//" $HOME/.zshrc && rm $HOME/.zshrc.bak

echo
echo "#####################################"
echo "#                                   #"
echo "# random-fiscal-code is uninstalled #"
echo "#                                   #"
echo "#####################################"
echo