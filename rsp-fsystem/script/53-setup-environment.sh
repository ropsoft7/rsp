WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up environment.d...

cd ..
cd src
cd etc.environment.d

echo Removing current /etc/environment.d/rsp...

sudo rm -rf /etc/environment.d/rsp

echo Placing current environment.d/rsp...

sudo cp -rf rsp /etc/environment.d

exit 0