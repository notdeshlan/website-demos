#!/usr/bin/env bash
# Create a new concept demo folder from an existing template.
# Usage: new_demo.sh "Business Name" trades|salon|practice
set -euo pipefail

name="${1:?Business name required}"
kind="${2:-trades}"
root="$(git -C "$(dirname "$0")" rev-parse --show-toplevel)"
cd "$root"

case "$kind" in
  trades)   pattern='c/francis-the-plumber-*' ;;
  salon)    pattern='c/hadis-barber-*' ;;
  practice) pattern='c/dr-kirshen-naidu-*' ;;
  *) echo "Unknown template '$kind' (use trades, salon or practice)" >&2; exit 1 ;;
esac

src=$(ls -d $pattern 2>/dev/null | head -1 || true)
[ -n "$src" ] || { echo "Template folder for '$kind' not found ($pattern)" >&2; exit 1; }

slug=$(python3 -c '
import re, sys, unicodedata
s = unicodedata.normalize("NFKD", sys.argv[1]).encode("ascii", "ignore").decode().lower()
s = re.sub(r"[\x27\u2019]", "", s.replace("&", " and "))
print(re.sub(r"[^a-z0-9]+", "-", s).strip("-")[:40].rstrip("-"))
' "$name")
existing=$(ls -d "c/$slug-"* 2>/dev/null | head -1 || true)
if [ -n "$existing" ]; then
  echo "A demo already exists for this business: $existing" >&2
  exit 2
fi

dir="c/$slug-$(od -An -N3 -tx1 /dev/urandom | tr -d ' \n')"
mkdir -p "$dir"
cp "$src/index.html" "$dir/index.html"

echo "Created:  $dir/index.html  (copied from $src)"
echo "URL:      https://notdeshlan.github.io/website-demos/$dir/"
echo "Next:     replace every detail from $(basename "$src") with $name's details."
