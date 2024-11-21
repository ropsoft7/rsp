#!/bin/bash

# Diretório onde o script "init" está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Nome do próprio script
SELF_NAME="$(basename "$0")"

# Itera pelos scripts em ordem numérica
for script in "$SCRIPT_DIR"/*; do
    # Ignora o próprio script
    if [[ "$(basename "$script")" == "$SELF_NAME" ]]; then
        continue
    fi

    # Verifica se é um arquivo executável
    if [[ -f "$script" && -x "$script" ]]; then
        echo "Executando: $script"
        "$script"
        if [[ $? -ne 0 ]]; then
            echo "Erro ao executar o script: $script"
            exit 1
        fi
    fi
done

echo "Todos os scripts enumerados foram executados com sucesso!"
echo "Rodando git-fetch-all-proj.sh"

sleep 3

bash ./git-fetch-all-proj.sh;

exit 0;