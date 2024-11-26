WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

cd ..
cd src
cd usr.share

echo Removing current share asset...

sudo rm -rf /usr/share/base-files/rsp
sudo rm -rf /usr/share/file-manager/rsp-*
sudo rm -rf /usr/share/grub/rsp
sudo rm -rf /usr/share/icons/rsp
sudo rm -rf /usr/share/images/rsp
sudo rm -rf /usr/share/themes/Rsp*
sudo rm -rf /usr/share/wallpapers/rsp
sudo rm -rf /usr/share/wayland-sessions/rsp-*
sudo rm -rf /usr/share/xsessions/rsp-*

echo Ensuring existence of directories...

sudo mkdir -p /usr/share/base-files/rsp
sudo mkdir -p /usr/share/file-manager
sudo mkdir -p /usr/share/grub/rsp
sudo mkdir -p /usr/share/icons/rsp
sudo mkdir -p /usr/share/images/rsp
sudo mkdir -p /usr/share/themes
sudo mkdir -p /usr/share/wallpapers/rsp
sudo mkdir -p /usr/share/wayland-sessions
sudo mkdir -p /usr/share/xsessions

echo Spreading source share asset...

sudo cp -rf base-files/* /usr/share/base-files
sudo cp -rf file-manager/* /usr/share/file-manager
sudo cp -rf grub/* /usr/share/grub
sudo cp -rf icons/* /usr/share/icons
sudo cp -rf images/* /usr/share/images
sudo cp -rf themes/* /usr/share/themes
sudo cp -rf wallpapers/* /usr/share/wallpapers
sudo cp -rf wayland-sessions/* /usr/share/wayland-sessions
sudo cp -rf xsessions/* /usr/share/xsessions

exit 0

