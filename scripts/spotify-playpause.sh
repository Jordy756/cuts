#!/bin/bash
# Muestra icono play o pause según estado actual de Spotify

status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" = "Playing" ]; then
  echo ""  # Icono pause
else
  echo ""  # Icono play
fi
