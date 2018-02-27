# Tempus themes by Protesilaos Stavrou
# https://github.com/protesilaos/tempus-themes
# A terminal with the appropriate colour values is required
# Color scheme for ranger file manager

    # This program is free software: you can distribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class tempus(ColorScheme):
    progress_bar_color = 8

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                fg = 4
                bg = 7
            if context.copied or context.cut:
                attr |=reverse
            if context.empty or context.error:
                fg = 15
                bg = 1
            if context.border:
                fg = 8
            if context.image:
                fg = 5
            if context.video:
                fg = 13
            if context.audio:
                fg = 6
            if context.document:
                fg = 0
            if context.container:
                fg = 3
            if context.directory:
                fg = 8
                attr |= bold
            elif context.executable and not \
                    any((context.media, context.container,
                       context.fifo, context.socket)):
                fg = 9
            if context.socket:
                fg = 3
                attr |= bold
            if context.fifo or context.device:
                fg = 12
                if context.device:
                    attr |= bold
            if context.link:
                fg = context.good and 0 or 8
                bg = 15
            if context.bad:
                fg = 1
            if context.tag_marker and not context.selected:
                attr |= bold
                if fg in (0, 8):
                    fg = 0
                else:
                    fg = 1
            if context.main_column:
                if context.selected:
                    attr |= reverse
                if context.marked:
                    attr |= bold
                    fg = 13
            if context.badinfo:
                if attr & reverse:
                    bg = 1
                else:
                    fg = 8

        elif context.in_titlebar:
            attr |= normal
            if context.hostname:
                fg = 5
                bg = 15
            elif context.directory:
                fg = 4
            elif context.tab:
                if context.good:
                    fg = 15
                    bg = 4
            elif context.link:
                fg = 6

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = 2
                    bg = 7
                elif context.bad:
                    fg = 1
                    bg = 7
            if context.marked:
                attr |= bold | reverse
                fg = 13
            if context.message:
                if context.bad:
                    attr |= bold
                    fg = 1
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = 14
                attr &= ~bold
            if context.vcscommit:
                fg = 6
                attr &= ~bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = 12

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = 1
            elif context.vcschanged:
                fg = 5
            elif context.vcsunknown:
                fg = 3
            elif context.vcsstaged:
                fg = 2
            elif context.vcssync:
                fg = 4
            elif context.vcsignored:
                fg = 8

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = 12
            elif context.vcsbehind:
                fg = 13
            elif context.vcsahead:
                fg = 9
            elif context.vcsdiverged:
                fg = 9
            elif context.vcsunknown:
                fg = 11

        return fg, bg, attr
