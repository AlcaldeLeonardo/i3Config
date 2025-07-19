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

Este config busca un fondo en la carpeta wallpaper de la raiz del repositorio

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
## Configuracion de Picom
En caso de no tener un archivo de configuracion para picom generarlo con estos comandos: 

```bash
mkdir -p ~/.config/picom && cat > ~/.config/picom/picom.conf << 'EOF'
# BACKEND
backend = "xrender";
# VSYNC
vsync = false;
# SHADOWS
shadow = true;
shadow-radius = 12;
shadow-offset-x = -15;
shadow-offset-y = -15;
shadow-opacity = 0.5;
shadow-exclude = [
  "name = 'Notification'",
  "class_g = 'Conky'",
  "class_g ?= 'Notify-osd'",
  "class_g = 'Cairo-clock'",
  "class_g = 'i3-frame'"
];
# TRANSPARENCIA
opacity-rule = [
  "90:class_g = 'Alacritty'",
  "90:class_g = 'URxvt'",
  "90:class_g = 'kitty'",
  "90:class_g = 'code'",
  "90:class_g = 'firefox'"
];
# FADING (suavizado de aparición/desaparición)
fading = true;
fade-delta = 10;
fade-in-step = 0.03;
fade-out-step = 0.03;
# REDONDEO DE BORDES
corner-radius = 10;
rounded-corners-exclude = [
  "class_g = 'i3-frame'",
  "window_type = 'dock'",
  "window_type = 'desktop'"
];
# TRANSPARENCIA ACTIVA GENERAL
inactive-opacity = 0.90;
active-opacity = 1.0;
frame-opacity = 0.9;
inactive-opacity-override = false;
# Otros ajustes
detect-client-opacity = true;
mark-wmwin-focused = true;
mark-ovredir-focused = true;
use-ewmh-active-win = true;
# Logging (opcional para debug)
log-level = "warn";
EOF

```
