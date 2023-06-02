#!/bin/sh

which -s git >/dev/null 2>&1
if [[ $? != 0 ]];
then
    echo "Git is not installed!"
    exit
fi

export SHELL_CONFIG=$(if [ "$(basename $SHELL)" = "zsh" ]; then echo .zshrc; else echo .bashrc; fi)
export ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/scripts\/.\/start.sh'")"

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

git clone https://github.com/paologiua/random-fiscal-code.git $HOME/.random-fiscal-code

sed -i'.bak' "s/$ALIAS//" $HOME/$SHELL_CONFIG && rm $HOME/$SHELL_CONFIG.bak
echo -e -n "$(cat $HOME/$SHELL_CONFIG)\n\n$(echo $ALIAS | tr -d "\\")" > $HOME/$SHELL_CONFIG

echo
echo "###################################"
echo "#                                 #"
echo "# random-fiscal-code is installed #"
echo "#                                 #"
echo "###################################"
echo