WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up apt config...

cd ..
cd src
cd etc.apt

echo Removing current configs...

sudo rm -rf /etc/apt/keyrings
sudo rm -rf /etc/apt/sources.list
sudo rm -rf /etc/apt/preferences.d   
sudo rm -rf /etc/apt/sources.list.d

echo Spreading source configs...

sudo cp -rf keyrings /etc/apt/keyrings
sudo rm -rf sources.list /etc/apt/sources.list
sudo cp -rf preferences.d /etc/apt/preferences.d   
sudo cp -rf sources.list.d /etc/apt/sources.list.d

sleep 3;

echo Updating and Upgrading apt...

sudo apt update -y;
sudo apt upgrade -y;

exit 0

