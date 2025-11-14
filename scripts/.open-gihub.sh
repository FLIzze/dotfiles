#!/bin/bash

url=$(git remote get-url origin 2>/dev/null)
[[ -z "$url" ]] && { echo "No remote found"; exit 1; }
url=${url/git@github.com:/https://github.com/}
url=${url%.git}

{ command -v xdg-open >/dev/null && xdg-open "$url" >/dev/null 2>&1; } \
|| { command -v open >/dev/null && open "$url"; } \
|| { echo "Could not open browser, here is the URL: $url"; }
