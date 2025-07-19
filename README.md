# Configuracion de i3 WM

## 🛠 Requisitos

Asegurate de tener instalados los siguientes paquetes:

```bash
sudo pacman -S i3-wm rofi feh picom dex xss-lock i3lock network-manager-applet pipewire wireplumber
```

También deberías tener instalado **Wezterm** para la terminal (mod+Enter lo ejecuta).

## 📂 Estructura esperada

Tu estructura de configuración debería ser:

```bash
~/.config/
├── i3/
│ ├── config # Este archivo
│ └── scripts/
│   └── powermenu.sh # Script de apagado
├── picom/
│ └── picom.conf # Configuración de picom
└── ...
```
## 🖼 Fondo de pantalla

Este config busca un fondo en:

```

~/Imágenes/PaisajePixelArt.png
```

Asegurate de que ese archivo exista, o cambiá la línea correspondiente en el archivo config.

## Nota sobre el powermenu

El script ~/.config/i3/scripts/powermenu.sh debe existir y ser ejecutable. Si no lo tenés, podés crearlo así:

```bash

mkdir -p ~/.config/i3/scripts

cat > ~/.config/i3/scripts/powermenu.sh <<'EOF'
#!/bin/bash

chosen=$(echo -e "🔒 Bloquear\n🔄 Reiniciar\n⏻ Apagar\n🚪 Cerrar sesión" | rofi -dmenu -p "Qué querés hacer?" -lines 4 -theme gruvbox-dark)

case "$chosen" in
"🔒 Bloquear") i3lock ;;
"🔄 Reiniciar") systemctl reboot ;;
"⏻ Apagar") systemctl poweroff ;;
"🚪 Cerrar sesión") i3-msg exit ;;
esac
EOF

chmod +x ~/.config/i3/scripts/powermenu.sh
```
