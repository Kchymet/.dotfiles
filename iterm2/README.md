# iTerm2 settings

A good **baseline** iTerm2 profile, checked in as a starting point. It is
*copied into place* per machine rather than live-synced — so different machines
can diverge (different profiles, tweaks) without affecting this repo.

## Install on a machine

iTerm2 must be **fully quit** first (it overwrites its prefs file on exit):

```sh
# 1. Quit iTerm2 (Cmd-Q)
# 2. From another terminal (e.g. Terminal.app):
~/programming/kchymet/.dotfiles/iterm2/install.sh
# 3. Open iTerm2.
```

`install.sh` backs up any existing prefs, then copies
`com.googlecode.iterm2.plist` to `~/Library/Preferences/` and clears the prefs
cache. After that, iTerm2 uses its normal preferences location — this machine is
independent of the repo. Re-run any time to reset to the baseline.

## Updating the baseline

This is intentionally a one-way starting point, not a sync. To refresh the
checked-in baseline from a machine you like:

```sh
cp ~/Library/Preferences/com.googlecode.iterm2.plist \
   ~/programming/kchymet/.dotfiles/iterm2/com.googlecode.iterm2.plist
plutil -convert xml1 ~/programming/kchymet/.dotfiles/iterm2/com.googlecode.iterm2.plist
# then commit
```

## What's in the baseline

Default profile:

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
