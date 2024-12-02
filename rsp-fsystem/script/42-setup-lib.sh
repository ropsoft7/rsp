WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

cd ..
cd src
cd usr.lib

echo Removing current rsp lib...

sudo rm -rf /usr/lib/rsp

echo Ensuring existence of directory...

sudo mkdir -p /usr/lib/rsp

echo Spreading rsp lib...

sudo cp -rf rsp/* /usr/lib/rsp

sudo ln -sf /usr/lib/rsp/toggle/* /usr/local/bin
sudo ln -sf /usr/lib/rsp/misc/* /usr/local/bin

sudo ln -sf /usr/lib/rsp/desktop/startRspDesktopWayland /usr/local/bin
sudo ln -sf /usr/lib/rsp/desktop/archive/startRspDesktop /usr/local/bin

ls /usr/lib/rsp

exit 0

