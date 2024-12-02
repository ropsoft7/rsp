WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

cd ..
cd src
cd etc.bash_completion.d

echo Removing old completions files on /etc/bash_completion.d...

sudo rm -rf /etc/bash_completion.d/rsp-*

echo Installing new files into /etc/bash_completion.d...

sudo cp -rf ./rsp-projman /etc/bash_completion.d;

ls /etc/bash_completion.d;

exit 0

