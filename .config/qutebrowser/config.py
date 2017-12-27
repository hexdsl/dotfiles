# qutebrowser user configs

# General settings
#  =============================================================================
c.content.headers.accept_language = 'en-GB,en-US,en,el-GR' 
c.content.pdfjs = True
c.content.plugins = True
c.url.default_page = 'about:blank' 

#  User interface
#  =============================================================================
c.completion.height = '25%' 
c.completion.scrollbar.width = 4
c.completion.scrollbar.padding = 1
c.downloads.position = 'bottom'
c.statusbar.padding = {"top": 2, "bottom": 2, "left": 4, "right": 4}
c.tabs.padding = {"top": 4, "bottom": 4, "left": 8, "right": 8}
c.tabs.width.indicator = 0

#  Colours
#  -----------------------------------------------------------------------------
c.colors.completion.fg = '#798ba5'
c.colors.completion.odd.bg = '#202427'
c.colors.completion.even.bg = '#202427'
c.colors.completion.category.fg = '#987dc2'
c.colors.completion.category.bg = '#000407'
c.colors.completion.category.border.top = '#000407'
c.colors.completion.category.border.bottom = '#000407'
c.colors.statusbar.insert.fg = '#202427'
c.colors.statusbar.insert.bg =  '#2c9a81'
c.colors.completion.item.selected.fg = '#202427'
c.colors.completion.item.selected.bg = '#b572b6'
c.colors.completion.item.selected.border.top = '#b572b6'
c.colors.completion.item.selected.border.bottom = '#b572b6'
c.colors.completion.match.fg = '#ffffff'
c.colors.completion.scrollbar.fg = '#798ba5'
c.colors.completion.scrollbar.bg = '#1b2431'
c.colors.downloads.bar.bg = '#1b2431'
c.colors.downloads.start.fg = '#202427'
c.colors.downloads.start.bg = '#2b92c8'
c.colors.downloads.stop.fg = '#202427'
c.colors.downloads.stop.bg = '#c47818'
c.colors.downloads.error.fg = '#202427'
c.colors.downloads.error.bg = '#ca7162'
c.colors.hints.fg = '#ffffff'
c.colors.hints.bg = '#dd8822'
c.colors.hints.match.fg = '#000000'
c.colors.messages.error.fg = '#202427'
c.colors.messages.error.bg = '#ca7162'
c.colors.messages.error.border = '#a2864b'
c.colors.messages.warning.fg = '#202427'
c.colors.messages.warning.bg = '#a2864b'
c.colors.messages.warning.border = '#ca7162'
c.colors.messages.info.fg = '#798ba5'
c.colors.messages.info.bg = '#202427'
c.colors.messages.info.border = '#798ba5'
c.colors.prompts.fg = '#899bb5'
c.colors.prompts.border = '1px solid #899bb5'
c.colors.prompts.bg = '#303437'
c.colors.prompts.selected.bg = '#1b2431'
c.colors.statusbar.normal.fg = '#798ba5'
c.colors.statusbar.normal.bg = '#202427'
c.colors.statusbar.private.fg = '#987dc2'
c.colors.statusbar.private.bg = '#1b2431'
c.colors.statusbar.command.fg = '#2c9a81'
c.colors.statusbar.command.bg = '#101417'
c.colors.statusbar.command.private.fg = '#b572b6'
c.colors.statusbar.command.private.bg = '#1b2431'
c.colors.statusbar.progress.bg = '#888a8a'
c.colors.statusbar.url.fg = '#589584'
c.colors.statusbar.url.error.fg = '#ca7162'
c.colors.statusbar.url.hover.fg = '#1f96b0'
c.colors.statusbar.url.success.http.fg = '#798ba5'
c.colors.statusbar.url.success.https.fg = '#2c9a81'
c.colors.statusbar.url.warn.fg = '#988b21'
c.colors.tabs.bar.bg = '#202427'
c.colors.tabs.indicator.start = '#2b92c8'
c.colors.tabs.indicator.stop = '#589584'
c.colors.tabs.indicator.error = '#ca7162'
c.colors.tabs.odd.fg = '#798ba5'
c.colors.tabs.odd.bg = '#202427'
c.colors.tabs.even.fg = '#798ba5'
c.colors.tabs.even.bg = '#202427'
c.colors.tabs.selected.odd.fg = '#899bb5'
c.colors.tabs.selected.odd.bg = '#404447'
c.colors.tabs.selected.even.fg = '#899bb5'
c.colors.tabs.selected.even.bg = '#404447'

#  Fonts
#  -----------------------------------------------------------------------------
my_sans = '"DejaVu Sans Condensed", "Roboto Condensed", Cantarell'

c.fonts.monospace = '"DejaVu Sans Mono", "Liberation Mono", "xos4 Terminus", Terminus, monospace'
c.fonts.web.family.serif = '"DejaVu Serif", "Liberation Serif"'
c.fonts.web.family.sans_serif = '"DejaVu Sans", Roboto, "Liberation Sans"'
c.fonts.completion.entry = '13px my_sans'
c.fonts.completion.category = 'bold 13px my_sans'
c.fonts.debug_console = '13px my_sans'
c.fonts.downloads = '13px my_sans'
c.fonts.hints = 'bold 13px my_sans'
c.fonts.keyhint = '13px my_sans'
c.fonts.messages.error = '13px my_sans'
c.fonts.messages.info = '13px my_sans'
c.fonts.messages.warning = '13px my_sans'
c.fonts.prompts = '13px my_sans'
c.fonts.statusbar = 'bold 11px monospace'
c.fonts.tabs = '13px my_sans'

# Functionality
#  =============================================================================
c.editor.command = ["/usr/bin/urxvtc", "-e", "/usr/bin/vim", "-f", "{}"]
c.scrolling.smooth = True
c.tabs.background = True
c.url.searchengines = {"DEFAULT": "https://searx.eu/?q={}", "awk": "https://wiki.archlinux.org/?search={}", "aur": "https://aur.archlinux.org/packages/?O=0&SeB=nd&K={}&outdated=&SB=p&SO=d&PP=250&do_Search=Go"}
c.url.start_pages = 'https://www.archlinux.org' 

# Aliases
#  -----------------------------------------------------------------------------
config.bind('gh', 'open https://github.com')
config.bind('tw', 'open https://twitter.com')
config.bind('yt', 'open https://www.youtube.com')
config.bind('me', 'open https://protesilaos.com')
