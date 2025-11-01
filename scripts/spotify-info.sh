#!/bin/bash
# Muestra artista y título de la canción actual, limitado a 25 caracteres

artist=$(playerctl --player=spotify metadata artist 2>/dev/null)
title=$(playerctl --player=spotify metadata title 2>/dev/null)

if [ -n "$artist" ] && [ -n "$title" ]; then
    echo "$artist - $title"
else
    echo "Offline"
fi

