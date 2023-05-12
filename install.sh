#!/bin/sh

which -s python3 >/dev/null 2>&1
if [[ $? != 0 ]]; 
then
    echo "Python3 is not installed!"
    exit
fi

which -s pip3 >/dev/null 2>&1
if [[ $? != 0 ]]; 
then
    echo "Pip3 is not installed!"
    exit
fi

which -s git >/dev/null 2>&1
if [[ $? != 0 ]]; 
then
    echo "Git is not installed!"
    exit
fi

git clone https://github.com/paologiua/random-fiscal-code.git $HOME/.random-fiscal-code

pip3 install pandas
pip3 install python-codicefiscale
pip3 install clipboard

ALIAS="alias random-fiscal-code='$HOME/.random-fiscal-code/./start.sh'"

sed -i'.bak' "s/$ALIAS//" $HOME/.zshrc && rm $HOME/.zshrc.bak
echo "$(cat $HOME/.zshrc)\n\n$ALIAS" > $HOME/.zshrc

echo "random-fiscal-code is installed"