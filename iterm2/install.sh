#!/usr/bin/env bash
#
# Point iTerm2 at this folder for its preferences.
#
# IMPORTANT: iTerm2 reads this setting only at launch, and a running instance
# overwrites it on quit. So iTerm2 must be FULLY QUIT (Cmd-Q) before running
# this script. Re-open iTerm2 afterwards to load the standardized settings.
#
# Safe to re-run and to use on a fresh machine.
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if pgrep -xq iTerm2; then
  echo "iTerm2 is running — quit it completely (Cmd-Q), then re-run this script." >&2
  exit 1
fi

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DIR"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "iTerm2 will now load preferences from:"
echo "  $DIR"
echo "Open iTerm2 to apply."
