import themes.pink

config.load_autoconfig()  # noqa: F821
c.auto_save.session = True  # noqa: F821
c.colors.webpage.preferred_color_scheme = 'auto'
c.colors.webpage.darkmode.enabled = False
# config.source('themes/pink.py')

themes.pink.setup(c)
