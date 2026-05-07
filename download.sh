#!/bin/bash

URL=$1

echo "Start download of $URL"

yt-dlp -f "bestvideo+bestaudio" --merge-output-format mp4 -o "videos/$(title).mp4" "$URL"

if[ $? -eq 0]; then
  echo "Succesfull downloaded video from ${URL}"



