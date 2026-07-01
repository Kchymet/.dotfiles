# iTerm2 settings

Standardized iTerm2 preferences, checked in for reuse across machines via
iTerm2's native "load preferences from a custom folder" feature.

## Activate on a machine

iTerm2 must be **fully quit** first (it overwrites the setting on exit):

```sh
# 1. Quit iTerm2 (Cmd-Q)
# 2. From any other terminal:
~/programming/kchymet/.dotfiles/iterm2/install.sh
# 3. Open iTerm2 — it now loads prefs from this folder.
```

`install.sh` just sets the two bootstrap keys in the local domain:

```
defaults write com.googlecode.iterm2 PrefsCustomFolder <this folder>
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

To do it in the GUI instead: Preferences → General → Preferences →
check "Load preferences from a custom folder or URL" → select this folder.

## Keeping the repo in sync

Once iTerm2 is loading from this folder, enable
Preferences → General → Preferences → "Save changes to folder when iTerm2
quits" so GUI tweaks are written back to `com.googlecode.iterm2.plist`. Then
just commit the changed plist.

## What's standardized

Applied to the **Default** profile unless noted:

| Setting | Value | Why |
| --- | --- | --- |
| Font | CaskaydiaCove Nerd Font Mono 12 | glyphs/devicons for nvim, tmux |
| Use separate non-ASCII font | off | one font renders everything |
| Ligatures / italic / bold | on | |
| Separate light & dark colors | on | light theme (bg #fafafa) in light mode, dark in dark mode |
| Scrollback | 1000 lines | |
| Terminal type | xterm-256color | truecolor-friendly |
| Left/Right Option key | Normal | |
| Mouse reporting | on | |
| Bell | audible + visual | |
| Cursor | solid, no blink | |
| Transparency | ~32% | |
| Default window | 80 × 25 | |
| Prompt on quit (app) | off | |
| Scrollbar (app) | hidden | |
| Copy on select (app) | on | |

Requires the **CaskaydiaCove Nerd Font** (Cascadia Code, nerd-patched) to be
installed for glyphs to render.
