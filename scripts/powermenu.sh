#!/usr/bin/env bash

# Ruta de temas de rofi (nota: ~ está entre comillas, igual que en tu script original)
dir="~/.config/polybar/cuts/scripts/rofi"

# Uptime para mostrarse en el prompt
uptime=$(uptime -p | sed -e 's/up //g')

# Comando base de rofi con el tema original
rofi_command="rofi -no-config -theme $dir/powermenu.rasi"

# Options (sin Lock)
shutdown="Shutdown"
reboot="Restart"
suspend="Suspend"
logout="Logout"

# Opciones mostradas en rofi
options="$suspend\n$logout\n$reboot\n$shutdown"

# Mostrar menú y leer elección
chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"

# Ejecutar acción directa sin confirmaciones
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        gnome-session-quit --logout --no-prompt
        ;;
esac
