WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up /root dir...

cd ..
cd src
cd root

echo Removing current /root/* content...

sudo rm -rf /root
sudo mkdir -p /root
sudo chown root /root -R

echo Spreading source /root dir ..

sudo cp -rf . /root
sudo cp -rf .* /root

sudo ls /root -a;

sleep 1;

echo Updating and Upgrading apt...

sudo apt update -y;
sudo apt upgrade -y;

exit 0

