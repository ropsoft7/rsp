#!/bin/bash

while true; do

    # Executa o comando e atribui as variáveis X, Y, SCREEN e WINDOW
    eval "$(xdotool getmouselocation --shell)"

    # Verifica se X <= 75 e Y <= 75
    if [ "$X" -le 50 ] && [ "$Y" -le 50 ]; then

        # Verifica se o processo 'winskip' está rodando
    
        if pgrep winskip > /dev/null; then
            pkill winskip
        else
            winskip > /dev/null &
        fi
    
        # Pausa para evitar execuções repetidas
        sleep 0.5
    fi

    # Adiciona um pequeno intervalo para evitar alta carga na CPU
    sleep 0.1

done
