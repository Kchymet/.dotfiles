#!/usr/bin/env bash
#
# Install these iTerm2 preferences as this machine's defaults.
#
# This COPIES the checked-in plist into iTerm2's normal preferences location.
# Afterwards the machine's iTerm2 config is independent of this repo: tweak it
# freely without touching these dotfiles (and vice versa). This is a baseline /
# starting point, not a live sync. Re-run to reset a machine to the baseline.
#
# iTerm2 must be FULLY QUIT (Cmd-Q) first, or it will overwrite the file on exit.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$DIR/com.googlecode.iterm2.plist"
DEST="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

if pgrep -xq iTerm2; then
  echo "iTerm2 is running — quit it completely (Cmd-Q), then re-run this script." >&2
  exit 1
fi

# Back up any existing prefs first.
if [ -f "$DEST" ]; then
  backup="$DEST.bak.$(date +%Y%m%d%H%M%S)"
  cp "$DEST" "$backup"
  echo "Backed up existing prefs -> $backup"
fi

cp "$SRC" "$DEST"
# Drop the cached copy so iTerm2 reads the new file on next launch.
killall cfprefsd 2>/dev/null || true

echo "Installed iTerm2 defaults from:"
echo "  $SRC"
echo "Open iTerm2 to use them. This machine is now independent of the repo."
