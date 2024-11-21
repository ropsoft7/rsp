#!/bin/bash

# Caminho do diretório onde este script está localizado
SCRIPT_DIR="$(dirname "$(realpath "$0")")"

# Nome deste script para exclusão
SELF_SCRIPT="$(basename "$0")"

cd $SCRIPT_DIR;

bash ./git-fetch-all.sh;

cd ..;

cd ./rsp-fsystem

cd script

bash init.sh;

cd $SCRIPT_DIR;
echo $SCRIPT_DIR;

sleep 3

# Itera pelos arquivos no diretório
for script in "$SCRIPT_DIR"/*; do
    # Verifica se é um arquivo, executável, e não o próprio script
    if [[ -f "$script" && -x "$script" ]]; then
        # Nome do arquivo
        SCRIPT_NAME="$(basename "$script")"

        # Ignora este script e arquivos que não começam com números
        if [[ "$SCRIPT_NAME" == "$SELF_SCRIPT" || ! "$SCRIPT_NAME" =~ ^[0-9]+- ]]; then
            continue
        fi

        # Executa o script
        echo "Executando: $SCRIPT_NAME"
        "$script"
        if [[ $? -ne 0 ]]; then
            echo "Erro ao executar o script: $SCRIPT_NAME"
            exit 1
        fi
    fi
done

echo "Todos os scripts enumerados foram executados com sucesso!"

./post.sh;

exit 0;