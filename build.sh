#!/bin/bash
PASSWORD="W5l3bA1MFOYkEn0X"
echo "🔐 Building..."
for f in $(find src -name "*.html"); do
  rel="${f#src/}"
  dir=$(dirname "$rel")
  [ "$dir" != "." ] && mkdir -p "$dir"
  echo "  Encrypting: $rel"
  staticrypt "$f" -p "$PASSWORD" -d "${dir:-.}" --remember 30 -f "$rel"
done
echo "✅ Done! Now: git add -A && git commit -m Update && git push"

