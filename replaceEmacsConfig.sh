#!/bin/sh
NOW=$(date +"%Y%m%d")
DOTEMACS=~/.emacs
DOTEMACSDOTD=~/.emacs.d
HOME_PATH=`eval echo ~$USER`

echo "This will replace the emacs setting under you home folder: .emacs, .emacs.d/ !"
echo "Press Y to continue, other to abort: "

read input


if [ $input = "Y" ] ; then
    echo "Replacing..."
    if [ -f "$DOTEMACS" ]; then
	mv ~/.emacs ~/.emacs.bak.$NOW
    fi
    if [ -d "$DOTEMACSDOTD" ]; then
	mv ~/.emacs.d ~/.emacs.d.bak.$NOW
	mkdir ~/.emacs.d
    fi
    cp ./dotemacs.txt ~/.emacs
    cp -R ./dotemacs.d/* ~/.emacs.d/
    echo "Replace finishd."
else
    echo "Not replaced."
    exit
fi
