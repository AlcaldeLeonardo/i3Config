#!/bin/bash

chosen=$(echo -e "🔒 Bloquear\n🔄 Reiniciar\n⏻ Apagar\n🚪 Cerrar sesión" | rofi -dmenu -p "Qué querés hacer?" -lines 4 -theme gruvbox-dark)

case "$chosen" in
"🔒 Bloquear") i3lock ;;
"🔄 Reiniciar") systemctl reboot ;;
"⏻ Apagar") systemctl poweroff ;;
"🚪 Cerrar sesión") i3-msg exit ;;
esac
