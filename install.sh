#!/bin/bash

# copied from stackoverflow
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# echo $SCRIPTPATH

# test, if phing is already installed
if [ -f $SCRIPTPATH/composer.lock ]; then
	echo "composer already ran"
	exit 1
fi

if [ -f $SCRIPTPATH/../phing ]; then
	echo "phing symlink already exists"
	exit 1
fi

# run installation
cd $SCRIPTPATH && composer install
ln -s $SCRIPTPATH/vendor/bin/phing $SCRIPTPATH/../phing
