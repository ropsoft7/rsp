#!/bin/bash

# Desativa o coredump através do systemd
echo "Configurando para desativar a geração de arquivos coredump..."

if [ -d "/etc/systemd" ]; then
    # Cria ou modifica a configuração para o coredump do systemd
    echo "Storage=none" | sudo tee /etc/systemd/coredump.conf.d/disable-coredump.conf > /dev/null
    echo "ProcessSizeMax=0" | sudo tee -a /etc/systemd/coredump.conf.d/disable-coredump.conf > /dev/null

    # Recarrega as configurações do systemd
    sudo systemctl daemon-reload

    echo "Configuração do systemd atualizada. Coredump desativado."
else
    echo "Erro: O diretório /etc/systemd não foi encontrado. Verifique se você está usando systemd."
fi

# Adiciona a configuração do ulimit de forma permanente
echo "Configurando ulimit para desativar coredumps de forma permanente..."

# Adiciona a linha ao arquivo /etc/security/limits.conf
sudo bash -c 'echo "* soft core 0" >> /etc/security/limits.conf'
sudo bash -c 'echo "* hard core 0" >> /etc/security/limits.conf'

echo "Configuração de ulimit adicionada a /etc/security/limits.conf."
echo "Desativação de coredumps concluída."

exit 0
