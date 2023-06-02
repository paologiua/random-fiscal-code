#!/bin/sh

export SHELL_CONFIG=$(if [ "$(basename $SHELL)" = "zsh" ]; then echo .zshrc; else echo .bashrc; fi)
export ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/scripts\/.\/start.sh'")"

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

sed -i'.bak' "s/$ALIAS//" $HOME/$SHELL_CONFIG && rm $HOME/$SHELL_CONFIG.bak

echo
echo "#####################################"
echo "#                                   #"
echo "# random-fiscal-code is uninstalled #"
echo "#                                   #"
echo "#####################################"
echo