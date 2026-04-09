# Doom By Doom - Solution

## Observation

The video file size is unusually large. That often indicates hidden per-frame
payloads or frame metadata artifacts.

## Strategy

The challenge wording hints at frame-by-frame analysis, so convert video to
images and test LSB payloads.

## Step 1: Export frames

```bash
ffmpeg -i final_lossless.mkv frame_%05d.png
```

## Step 2: Analyze frame LSB data

```bash
zsteg frame_00001.png
```

Repeat across early frames if needed until printable output appears.

## Flag

`JCE{Frames_Of_Fire_Ryt!}`
