#!/bin/bash

SHELL_CONFIG=$(if [ "$(basename $SHELL)" = "zsh" ]; then echo .zshrc; else echo .bashrc; fi)
EXPORT="$(echo "export PATH=\"\$HOME\/.random-fiscal-code\/bin:\$PATH\"")"

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

sed -i'.bak' "s/$EXPORT//" $HOME/$SHELL_CONFIG

echo
echo "##################################"
echo "#                                #"
echo "# random-fiscal-code uninstalled #"
echo "#                                #"
echo "##################################"
echo