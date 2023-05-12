#!/bin/sh

rm -rf $HOME/.random-fiscal-code**

ALIAS="alias random-fiscal-code='\$HOME\/.random-fiscal-code\/.\/start.sh'"

sed -i'.bak' "s/$ALIAS//" $HOME/.zshrc && rm $HOME/.zshrc.bak