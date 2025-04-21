#!/usr/bin/env bash

# --- Конфигурация путей ---
CONFIG_GNOME="org.gnome.desktop.interface"
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
WAYBAR_LINK="$HOME/.config/waybar/style.css"
WAYBAR_THEME_DIR="$HOME/.config/waybar"
FUZZEL_CONFIG="$HOME/.config/fuzzel/fuzzel.ini"
WALLPAPER_DIR="$HOME/download"
NIRI_CONFIG_DIR="$HOME/.config/niri"
NIRI_CONFIG_LINK="$NIRI_CONFIG_DIR/config.kdl"

# 1. Определяем текущую цветовую схему GNOME
CURRENT=$(gsettings get $CONFIG_GNOME color-scheme | tr -d "'")

# 2. Устанавливаем параметры в зависимости от текущей схемы
if [[ "$CURRENT" == "prefer-dark" ]]; then
  NEW="prefer-light"
  ALA_THEME="light.toml"
  WB_THEME="style-light.css"
  NVIM_BG="light"
  WALL_BG="wallpaper1.jpg"
  FUZZEL_BG="ffffffcc"
  NIRI_THEME="config-light.kdl"
else
  NEW="prefer-dark"
  ALA_THEME="dark.toml"
  WB_THEME="style-dark.css"
  NVIM_BG="dark"
  WALL_BG="wallpaper2.jpg"
  FUZZEL_BG="000000cc"
  NIRI_THEME="config-dark.kdl"
fi

# 3. Применяем новую цветовую схему GNOME
gsettings set $CONFIG_GNOME color-scheme "$NEW"

# 4. Обновляем конфигурацию Alacritty
sed -i -E "s|^import = \[.*\]|import = [ \"~/.config/alacritty/themes/${ALA_THEME}\" ]|" "$ALACRITTY_CONFIG"

# 5. Обновляем стиль Waybar
ln -sfn "$WAYBAR_THEME_DIR/$WB_THEME" "$WAYBAR_LINK"

# 6. Обновляем конфигурацию Fuzzel
sed -i -E "s|^background=.*|background=${FUZZEL_BG}|" "$FUZZEL_CONFIG"

# 7. Обновляем тему во всех запущенных экземплярах Neovim
for sock in /run/user/1000/nvim.*; do
  if [[ -S "$sock" ]]; then
    nvim --server "$sock" --remote-send "<Esc>:set background=$NVIM_BG | colorscheme pinky1<CR>"
  fi
done

# 8. Обновляем фоновое изображение с помощью swaybg
WALL_PATH="$WALLPAPER_DIR/$WALL_BG"
if [[ -f "$WALL_PATH" ]]; then
  pkill swaybg
  swaybg -i "$WALL_PATH" -m fill &
else
  echo "Файл обоев не найден: $WALL_PATH"
fi

# 9. Обновляем конфигурацию Niri
ln -sfn "$NIRI_CONFIG_DIR/$NIRI_THEME" "$NIRI_CONFIG_LINK"
