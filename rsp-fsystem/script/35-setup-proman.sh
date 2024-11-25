WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up proman services on /etc/proman...

cd ..
cd src
cd etc.proman

sudo rm -rf /etc/proman

sudo mkdir /etc/proman

sudo cp -rf * /etc/proman

exit 0

