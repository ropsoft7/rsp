WRAPPER="`readlink -f "$0"`"
HERE="`dirname "$WRAPPER"`"

    cd $HERE;

echo Installing rsp grub on /boot

    cd ..
    cd src
    cd boot.efi

    sudo rm -rf /boot/efi/EFI
    sudo cp -rf EFI /boot/efi
    sudo chown root /boot/efi -R

echo Setting up grub default config...

    cd ..
    cd etc.default

    sudo cp -rf grub /etc/default/grub

    sleep 3;

echo Running setup-share in order to setup updates on grub splash screen...

    cd ..;
    cd ..;

    npm run setup-share

    sleep 3

echo Ensuring removel of "/etc/default/grub.d"

    sudo rm -rf /etc/default/grub.d

echo Reinstalling and updating grub...

    sudo grub-install /dev/nvme0n1
    sudo update-grub

    sleep 3

exit 0

