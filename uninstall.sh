#!/bin/sh

if [ ! -f $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/.\/start.sh'")"

sed -i'.bak' "s/$ALIAS//" $HOME/.zshrc && rm $HOME/.zshrc.bak