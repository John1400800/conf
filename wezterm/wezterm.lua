local wezterm = require 'wezterm'

return {
  -- Set the background transparency
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  window_background_opacity = 0.75,

  -- Define the color palette
  colors = {
    -- Background and foreground colors
    background = '#ffffff',
    foreground = '#000000',
    cursor_bg = '#000000',
    cursor_border = '#000000',
    cursor_fg = '#FFFFFF',

    -- Normal (0-7) and Bright (8-15) colors
    ansi = {
      '#000000', -- black
      '#FF0066', -- red
      '#00DB96', -- green
      '#f39c11', -- yellow
      '#0000FF', -- blue
      '#AC00FF', -- magenta
      '#00B7DB', -- cyan
      '#dadada', -- white
    },
    brights = {
      '#999999', -- bright black
      '#FF0066', -- bright red
      '#00DB96', -- bright green
      '#f39c11', -- bright yellow
      '#0000FF', -- bright blue
      '#FF00FF', -- bright magenta
      '#00B7DB', -- bright cyan
      '#dadada', -- bright white
    },
  },

  -- window_padding = {
  --     left = 0,
  --     right = 0,
  --     top = 0,
  --     bottom = 0,
  -- },

  -- Enable font ligatures
  font = wezterm.font('Iosevka'),

  -- Set the font size
  font_size = 14.0,
}
