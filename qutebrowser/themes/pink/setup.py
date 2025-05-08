# vim:fileencoding=utf-8:foldmethod=marker


def setup(c):
    """
    Настраивает цвета Qutebrowser.

    Args:
        c: Объект конфигурации Qutebrowser.
        is_dark: True для темной темы (как Vim на скриншоте),
                 False для светлой темы.
    """
    # Палитра цветов, основанная на предоставленном списке и скриншоте {{{
    # Определяем палитру один раз вне функции для чистоты кода
    palette = {
        "black":     "#000000",
        "white":     "#ffffff",
        "red":       "#ff0066",
        "cyan":      "#00B7DB",
        "purple":    "#AC00FF",
        "magenta":   "#ff00ff",
        "gray":      "#999999",
        "darkgray":  "#303030",
        "darkcyan":  "#006A78",
        "blue":      "#0000FF",
        "lightgray": "#dadada",
        "lightcyan": "#CCCCFF",
    }
    # }}}

    if c.colors.webpage.darkmode.enabled:
        # --- ТЕМНАЯ ТЕМА ---

        # completion (Автодополнение) {{{
        c.colors.completion.category.bg = palette["darkgray"]
        c.colors.completion.category.border.bottom = palette["cyan"]
        c.colors.completion.category.border.top = palette["cyan"]
        c.colors.completion.category.fg = palette["cyan"]
        c.colors.completion.even.bg = palette["darkgray"]
        c.colors.completion.odd.bg = palette["darkgray"]
        c.colors.completion.fg = palette["white"]
        c.colors.completion.item.selected.bg = palette["cyan"]
        c.colors.completion.item.selected.border.bottom = palette["cyan"]
        c.colors.completion.item.selected.border.top = palette["cyan"]
        c.colors.completion.item.selected.fg = palette["white"]
        c.colors.completion.item.selected.match.fg = palette["magenta"]
        c.colors.completion.match.fg = palette["magenta"]
        c.colors.completion.scrollbar.bg = palette["darkgray"]
        c.colors.completion.scrollbar.fg = palette["cyan"]
        # }}}

        # downloads (Загрузки) {{{
        c.colors.downloads.bar.bg = palette["black"]
        c.colors.downloads.error.bg = palette["black"]
        c.colors.downloads.start.bg = palette["black"]
        c.colors.downloads.stop.bg = palette["black"]
        c.colors.downloads.error.fg = palette["red"]
        c.colors.downloads.start.fg = palette["blue"]
        c.colors.downloads.stop.fg = palette["cyan"]
        c.colors.downloads.system.fg = "none"
        c.colors.downloads.system.bg = "none"
        # }}}

        # hints (Подсказки) {{{
        c.colors.hints.bg = palette["cyan"]
        c.colors.hints.fg = palette["black"]
        c.hints.border = "1px solid " + palette["black"]
        c.colors.hints.match.fg = palette["white"]
        # }}}

        # keyhints (Подсказки клавиш) {{{
        c.colors.keyhint.bg = palette["darkgray"]
        c.colors.keyhint.fg = palette["white"]
        c.colors.keyhint.suffix.fg = palette["cyan"]
        # }}}

        # messages (Сообщения) {{{
        c.colors.messages.error.bg = palette["darkgray"]
        c.colors.messages.info.bg = palette["darkgray"]
        c.colors.messages.warning.bg = palette["darkgray"]
        c.colors.messages.error.border = palette["darkgray"]
        c.colors.messages.info.border = palette["darkgray"]
        c.colors.messages.warning.border = palette["darkgray"]
        c.colors.messages.error.fg = palette["red"]
        c.colors.messages.info.fg = palette["white"]
        c.colors.messages.warning.fg = palette["purple"]
        # }}}

        # prompts (Приглашения) {{{
        c.colors.prompts.bg = palette["darkgray"]
        c.colors.prompts.border = "1px solid " + palette["gray"]
        c.colors.prompts.fg = palette["white"]
        c.colors.prompts.selected.bg = palette["purple"]
        c.colors.prompts.selected.fg = palette["white"]
        # }}}

        # statusbar (Строка состояния) {{{
        c.colors.statusbar.normal.bg = palette["darkgray"]
        c.colors.statusbar.insert.bg = palette["darkgray"]
        c.colors.statusbar.command.bg = palette["darkgray"]
        c.colors.statusbar.caret.bg = palette["darkgray"]
        c.colors.statusbar.caret.selection.bg = palette["darkgray"]
        c.colors.statusbar.progress.bg = palette["darkgray"]
        c.colors.statusbar.passthrough.bg = palette["darkgray"]
        c.colors.statusbar.normal.fg = palette["white"]
        c.colors.statusbar.insert.fg = palette["magenta"]
        c.colors.statusbar.command.fg = palette["white"]
        c.colors.statusbar.passthrough.fg = palette["white"]
        c.colors.statusbar.caret.fg = palette["purple"]
        c.colors.statusbar.caret.selection.fg = palette["purple"]
        c.colors.statusbar.url.error.fg = palette["red"]
        c.colors.statusbar.url.fg = palette["white"]
        c.colors.statusbar.url.hover.fg = palette["cyan"]
        c.colors.statusbar.url.success.http.fg = palette["cyan"]
        c.colors.statusbar.url.success.https.fg = palette["cyan"]
        c.colors.statusbar.url.warn.fg = palette["purple"]
        c.colors.statusbar.private.bg = palette["black"]
        c.colors.statusbar.private.fg = palette["gray"]
        c.colors.statusbar.command.private.bg = palette["black"]
        c.colors.statusbar.command.private.fg = palette["gray"]
        # }}}

        # tabs (Вкладки) {{{
        c.colors.tabs.bar.bg = palette["darkgray"]
        c.colors.tabs.even.bg = palette["darkgray"]
        c.colors.tabs.odd.bg = palette["darkgray"]
        c.colors.tabs.pinned.even.bg = palette["darkgray"]
        c.colors.tabs.pinned.odd.bg = palette["darkgray"]
        c.colors.tabs.pinned.selected.even.bg = palette["black"]
        c.colors.tabs.pinned.selected.odd.bg = palette["black"]
        c.colors.tabs.even.fg = palette["gray"]
        c.colors.tabs.odd.fg = palette["gray"]
        c.colors.tabs.indicator.error = palette["red"]
        c.colors.tabs.indicator.start = palette["cyan"]
        c.colors.tabs.indicator.stop = palette["purple"]
        c.colors.tabs.indicator.system = "none"
        c.colors.tabs.selected.even.bg = palette["black"]
        c.colors.tabs.selected.odd.bg = palette["black"]
        c.colors.tabs.selected.even.fg = palette["white"]
        c.colors.tabs.selected.odd.fg = palette["white"]
        # }}}

        # context menus (Контекстные меню) {{{
        c.colors.contextmenu.menu.bg = palette["darkgray"]
        c.colors.contextmenu.menu.fg = palette["white"]
        c.colors.contextmenu.disabled.bg = palette["black"]
        c.colors.contextmenu.disabled.fg = palette["gray"]
        c.colors.contextmenu.selected.bg = palette["blue"]
        c.colors.contextmenu.selected.fg = palette["white"]
        # }}}

        # Webpage specific colors (Цвета веб-страниц) {{{
        c.colors.webpage.bg = palette["black"]
        c.colors.webpage.preferred_color_scheme = "dark"
        # }}}

    else:
        # --- СВЕТЛАЯ ТЕМА ---

        # completion (Автодополнение) {{{
        c.colors.completion.category.bg = palette["lightgray"]
        c.colors.completion.category.border.bottom = palette["gray"]
        c.colors.completion.category.border.top = palette["gray"]
        c.colors.completion.category.fg = palette["blue"]
        c.colors.completion.even.bg = palette["white"]
        c.colors.completion.odd.bg = palette["lightgray"]
        c.colors.completion.fg = palette["black"]
        c.colors.completion.item.selected.bg = palette["blue"]
        c.colors.completion.item.selected.border.bottom = palette["blue"]
        c.colors.completion.item.selected.border.top = palette["blue"]
        c.colors.completion.item.selected.fg = palette["white"]
        c.colors.completion.item.selected.match.fg = palette["lightcyan"]
        c.colors.completion.match.fg = palette["magenta"]
        c.colors.completion.scrollbar.bg = palette["lightgray"]
        c.colors.completion.scrollbar.fg = palette["blue"]
        # }}}

        # downloads (Загрузки) {{{
        c.colors.downloads.bar.bg = palette["white"]
        c.colors.downloads.error.bg = palette["white"]
        c.colors.downloads.start.bg = palette["white"]
        c.colors.downloads.stop.bg = palette["white"]
        c.colors.downloads.error.fg = palette["red"]
        c.colors.downloads.start.fg = palette["blue"]
        c.colors.downloads.stop.fg = palette["cyan"]
        c.colors.downloads.system.fg = "none"
        c.colors.downloads.system.bg = "none"
        # }}}

        # hints (Подсказки) {{{
        c.colors.hints.bg = palette["magenta"]
        c.colors.hints.fg = palette["white"]
        c.hints.border = "1px solid " + palette["black"]
        c.colors.hints.match.fg = palette["lightcyan"]
        # }}}

        # keyhints (Подсказки клавиш) {{{
        c.colors.keyhint.bg = palette["lightgray"]
        c.colors.keyhint.fg = palette["black"]
        c.colors.keyhint.suffix.fg = palette["blue"]
        # }}}

        # messages (Сообщения) {{{
        c.colors.messages.error.bg = palette["lightgray"]
        c.colors.messages.info.bg = palette["lightgray"]
        c.colors.messages.warning.bg = palette["lightgray"]
        c.colors.messages.error.border = palette["gray"]
        c.colors.messages.info.border = palette["gray"]
        c.colors.messages.warning.border = palette["gray"]
        c.colors.messages.error.fg = palette["red"]
        c.colors.messages.info.fg = palette["black"]
        c.colors.messages.warning.fg = palette["purple"]
        # }}}

        # prompts (Приглашения) {{{
        c.colors.prompts.bg = palette["lightgray"]
        c.colors.prompts.border = "1px solid " + palette["gray"]
        c.colors.prompts.fg = palette["black"]
        c.colors.prompts.selected.bg = palette["blue"]
        c.colors.prompts.selected.fg = palette["white"]
        # }}}

        # statusbar (Строка состояния) {{{
        c.colors.statusbar.normal.bg = palette["lightgray"]
        c.colors.statusbar.insert.bg = palette["lightgray"]
        c.colors.statusbar.command.bg = palette["lightgray"]
        c.colors.statusbar.caret.bg = palette["lightgray"]
        c.colors.statusbar.caret.selection.bg = palette["lightgray"]
        c.colors.statusbar.progress.bg = palette["blue"]
        c.colors.statusbar.passthrough.bg = palette["cyan"]
        c.colors.statusbar.normal.fg = palette["black"]
        c.colors.statusbar.insert.fg = palette["white"]
        c.colors.statusbar.command.fg = palette["white"]
        c.colors.statusbar.passthrough.fg = palette["black"]
        c.colors.statusbar.caret.fg = palette["white"]
        c.colors.statusbar.caret.selection.fg = palette["white"]
        c.colors.statusbar.url.error.fg = palette["red"]
        c.colors.statusbar.url.fg = palette["black"]
        c.colors.statusbar.url.hover.fg = palette["blue"]
        c.colors.statusbar.url.success.http.fg = palette["blue"]
        c.colors.statusbar.url.success.https.fg = palette["cyan"]
        c.colors.statusbar.url.warn.fg = palette["purple"]
        c.colors.statusbar.private.bg = palette["lightgray"]
        c.colors.statusbar.private.fg = palette["gray"]
        c.colors.statusbar.command.private.bg = palette["lightgray"]
        c.colors.statusbar.command.private.fg = palette["gray"]
        # }}}

        # tabs (Вкладки) {{{
        c.colors.tabs.bar.bg = palette["lightgray"]
        c.colors.tabs.even.bg = palette["white"]
        c.colors.tabs.odd.bg = palette["lightgray"]
        c.colors.tabs.even.fg = palette["black"]
        c.colors.tabs.odd.fg = palette["black"]
        c.colors.tabs.indicator.error = palette["red"]
        c.colors.tabs.indicator.start = palette["blue"]
        c.colors.tabs.indicator.stop = palette["purple"]
        c.colors.tabs.indicator.system = "none"
        c.colors.tabs.selected.even.bg = palette["white"]
        c.colors.tabs.selected.odd.bg = palette["lightgray"]
        c.colors.tabs.selected.even.fg = palette["blue"] # Синий текст на светлом
        c.colors.tabs.selected.odd.fg = palette["blue"]  # Синий текст на светлом
        # }}}

        # context menus (Контекстные меню) {{{
        c.colors.contextmenu.menu.bg = palette["lightgray"]
        c.colors.contextmenu.menu.fg = palette["black"]
        c.colors.contextmenu.disabled.bg = palette["white"]
        c.colors.contextmenu.disabled.fg = palette["gray"]
        c.colors.contextmenu.selected.bg = palette["blue"]
        c.colors.contextmenu.selected.fg = palette["white"]
        # }}}

        # Webpage specific colors (Цвета веб-страниц) {{{
        c.colors.webpage.bg = palette["white"]
        c.colors.webpage.preferred_color_scheme = "light"
        # }}}


# --- Пример использования в config.py ---

# # Загрузить файл темы (например, my_vim_theme.py)
# import my_vim_theme

# # Применить темную тему
# my_vim_theme.setup(c, is_dark=True)

# # ИЛИ применить светлую тему
# # my_vim_theme.setup(c, is_dark=False)

# # Остальная конфигурация...
# # config.load_autoconfig()
