WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

echo Setting up xdg config...

cd ..
cd src
cd etc.xdg

echo Removing current xdg user-dirs.defaults...

sudo rm -rf /etc/xdg/user-dirs.defaults

echo Spreading source xdg user-dirs.defaults...

sudo cp -rf user-dirs.defaults /etc/xdg/user-dirs.defaults
cat /etc/xdg/user-dirs.defaults

echo Updating xdg user-dirs.defaults...

sudo xdg-user-dirs-update
sudo -u $USER xdg-user-dirs-update

exit 0

