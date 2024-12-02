WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

cd $HERE;

cd ..
cd src
cd usr.share

echo Removing current share asset...

sudo rm -rf /usr/share/grub/rsp
sudo rm -rf /usr/share/icons/rsp
sudo rm -rf /usr/share/themes/Rsp*
sudo rm -rf /usr/share/images/rsp
sudo rm -rf /usr/share/sessions/rsp
sudo rm -rf /usr/share/wallpapers/rsp
sudo rm -rf /usr/share/file-manager/rsp-*

echo Ensuring existence of directories...

sudo mkdir -p /usr/share/grub/rsp
sudo mkdir -p /usr/share/icons/rsp
sudo mkdir -p /usr/share/images/rsp
sudo mkdir -p /usr/share/sessions/rsp
sudo mkdir -p /usr/share/wallpapers/rsp
sudo mkdir -p /usr/share/file-manager

echo Spreading source share asset...

sudo cp -rf grub/* /usr/share/grub
sudo cp -rf icons/* /usr/share/icons
sudo cp -rf images/* /usr/share/images
sudo cp -rf themes/* /usr/share/themes
sudo cp -rf sessions/* /usr/share/sessions
sudo cp -rf wallpapers/* /usr/share/wallpapers
sudo cp -rf file-manager/* /usr/share/file-manager

echo Removing existing session files...

sudo rm -rf /usr/share/xsessions/*
sudo rm -rf /usr/share/x11-sessions/*
sudo rm -rf /usr/share/wayland-sessions/*

sudo rm -rf /usr/local/share/sessions/*
sudo rm -rf /usr/local/share/xsessions/*
sudo rm -rf /usr/local/share/x11-sessions/*
sudo rm -rf /usr/local/share/wayland-sessions/*

echo Spreading source share symlinks...

sudo ln -sf /usr/share/sessions/rsp/* /usr/share/sessions
sudo ln -sf /usr/share/sessions/rsp/* /usr/share/wayland-sessions

exit 0

