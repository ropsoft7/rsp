#!/bin/bash

echo "Installing ngetty packages.."

# Atualiza o cache de pacotes e instala o ngetty, se não estiver instalado
if ! command -v ngetty &>/dev/null; then
    echo "Instalando o ngetty..."
    sudo apt update && sudo apt install -y ngetty
else
    echo "O ngetty já está instalado."
fi

echo "Installing setting up ngetty..."

# Desativa o serviço padrão do agetty para os terminais TTY 2 a 6, evitando duplicidades
for tty in {2..6}; do
    if systemctl is-enabled getty@tty$tty.service &>/dev/null; then
        echo "Desativando o getty@tty$tty.service..."
        systemctl disable getty@tty$tty.service
        systemctl stop getty@tty$tty.service
    fi
done

# Cria o arquivo de unidade systemd para o ngetty (não afeta o TTY1)
echo "Criando arquivo de unidade systemd para o ngetty..."

cat <<EOF > /etc/systemd/system/ngetty@.service
[Unit]
Description=Getty on %I
Documentation=man:ngetty
After=network.target

[Service]
ExecStart=/sbin/ngetty --keep-baud %I 115200
Type=idle

[Install]
WantedBy=multi-user.target
EOF

# Habilita e inicia o serviço ngetty para os terminais TTY 2 a 6 (não afeta o TTY1 usado pelo sddm)
for tty in {2..6}; do
    if ! systemctl is-enabled ngetty@tty$tty.service &>/dev/null; then
        echo "Habilitando o serviço ngetty para tty$tty..."
        systemctl enable ngetty@tty$tty.service
        systemctl start ngetty@tty$tty.service
    else
        echo "O serviço ngetty já está habilitado para tty$tty."
    fi
done

# Confirmação final
echo "Configuração concluída. O ngetty agora é o TTY padrão para tty2 a tty6."
echo "O TTY1 foi mantido para o sddm."

exit 0;