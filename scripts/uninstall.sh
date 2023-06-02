#!/bin/sh

OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)
BINARY=random-fiscal-code-$OS-$ARCH

SHELL_CONFIG=$(if [ "$(basename $SHELL)" = "zsh" ]; then echo .zshrc; else echo .bashrc; fi)
ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/bin\/$BINARY'")"

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

sed -i'.bak' "s/$ALIAS//" $HOME/$SHELL_CONFIG && rm $HOME/$SHELL_CONFIG.bak

echo
echo "##################################"
echo "#                                #"
echo "# random-fiscal-code uninstalled #"
echo "#                                #"
echo "##################################"
echo