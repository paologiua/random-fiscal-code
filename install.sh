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

if [ ! -f $HOME/.random-fiscal-code ]; then
	rm -rf $HOME/.random-fiscal-code**
fi

git clone https://github.com/paologiua/random-fiscal-code.git $HOME/.random-fiscal-code

pip3 install pandas
pip3 install python-codicefiscale
pip3 install clipboard

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