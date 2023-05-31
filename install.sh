#!/bin/sh

which -s git >/dev/null 2>&1
if [[ $? != 0 ]]; 
then
    echo "Git is not installed!"
    exit
fi

if [ -d $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

git clone https://github.com/paologiua/random-fiscal-code.git $HOME/.random-fiscal-code

ALIAS="$(echo "alias random-fiscal-code='\$HOME\/.random-fiscal-code\/.\/start.sh'")"

sed -i'.bak' "s/$ALIAS//" $HOME/.zshrc && rm $HOME/.zshrc.bak
echo -e -n "$(cat $HOME/.zshrc)\n\n$(echo $ALIAS | tr -d "\\")" > $HOME/.zshrc

echo
echo "###################################"
echo "#                                 #"
echo "# random-fiscal-code is installed #"
echo "#                                 #"
echo "###################################"
echo