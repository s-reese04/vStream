#!/bin/bash

URL="$1"
OUTPUT_DIR="$2"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
REFERER=$(echo "$URL" | grep -oP 'https?://[^/]+')
TMP=$(mktemp -d)

# 1: yt-dlp direct
yt-dlp -f "bestvideo+bestaudio/best" \
       --merge-output-format mp4 \
       --referer "$REFERER" \
       --add-header "User-Agent:$UA" \
       -o "${OUTPUT_DIR}/%(title)s.mp4" \
       "$URL" && exit 0

# 2: yt-dlp with firefox cookies
yt-dlp -f "bestvideo+bestaudio/best" \
       --merge-output-format mp4 \
       --referer "$REFERER" \
       --add-header "User-Agent:$UA" \
       --cookies-from-browser firefox \
       -o "${OUTPUT_DIR}/%(title)s.mp4" \
       "$URL" && exit 0

# 3: fetch HTML and search for media URLs
curl -sL \
     -H "User-Agent: $UA" \
     -H "Referer: $REFERER" \
     "$URL" -o "$TMP/page.html"

python3 - "$TMP" <<'EOF' > "$TMP/media_urls.txt"
import re, sys
html = open(sys.argv[1] + "/page.html").read()
pattern = r'(https?://[^\s"\'<>]+\.(m3u8|mp4|flv)[^\s"\'<>]*)'
for match in re.findall(pattern, html, re.IGNORECASE):
    print(match[0])
EOF

while read -r MEDIA_URL; do
    ffmpeg -user_agent "$UA" \
           -referer "$REFERER" \
           -i "$MEDIA_URL" \
           -c copy \
           "${OUTPUT_DIR}/video.mp4" && exit 0
done < "$TMP/media_urls.txt"

echo "Failed: $URL"
rm -rf "$TMP"
exit 1
