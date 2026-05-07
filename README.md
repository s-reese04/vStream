# vStream

> Download any video from the web and store it locally — fast, clean, and hassle-free.

StreamVault is a command-line tool that lets you download videos from virtually any URL and save them to your local machine. Powered by **yt-dlp** for broad platform support and **ffmpeg** for high-quality media processing and conversion.

---

## Features

- Download videos from YouTube, Vimeo, Twitter, and [hundreds of other platforms](https://github.com/yt-dlp/yt-dlp/blob/master/supportedsites.md)
- Automatic video/audio merging via ffmpeg
- Local storage with customizable output paths
- Format selection (MP4, MKV, WebM, MP3, and more)
- Fast downloads with support for concurrent streams

---

## Requirements

- [Python 3.8+](https://www.python.org/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [ffmpeg](https://ffmpeg.org/)

### Install dependencies

**Arch / Manjaro:**
```bash
sudo pacman -S yt-dlp ffmpeg
```

**Ubuntu / Debian:**
```bash
sudo apt install ffmpeg
pip install yt-dlp
```

**macOS (Homebrew):**
```bash
brew install yt-dlp ffmpeg
```

---

## Usage

```bash
1. Fill every other line of urls.txt with the desired urls
2. python start.py
```

## Project Structure

```
videostream/
├── start.py      # Main entry point
├── download.sh      
├── videos   
├── urls.txt    # Fill with urls of desired websites
└── README.md
```

---

## How It Works

1. **yt-dlp** fetches the video stream(s) from the given URL
2. If video and audio are separate streams, **ffmpeg** merges them into a single file
3. The final file is saved to the videos directory


## Disclaimer
Do not use this tool to download copyrighted media.
By downloading this tool, you aggree that every copyright violations occuring while using this tool, are your own problem.
We aren´t charged with any Problems our users create

*Built with [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [ffmpeg](https://ffmpeg.org/)*
