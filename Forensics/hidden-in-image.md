# Hidden in Image

**Category:** Forensics  
**Difficulty:** Easy  
**Points:** 100  
**Author:** SPYIREX CTF Team

## Description

We found this image. Something seems hidden inside it.

Download: `image.png`

## Solution

### Initial Analysis

When dealing with images in CTF forensics, several techniques can hide data: steganography, metadata, LSB encoding, or simply appended data.

### Approach

Use various forensics tools to examine the image for hidden data.

### Steps to Solve

1. Check file type: `file image.png`
2. Examine with `exiftool image.png` for metadata
3. Use `strings image.png | grep JCE` to search for the flag
4. Try `binwalk image.png` to find embedded files
5. Use `steghide extract -sf image.png` (if JPEG)
6. For PNG, try `zsteg image.png -a` to check for LSB steganography

### Commands Used

```bash
# Check file type
file image.png

# Extract strings
strings image.png | grep -i jce

# Check for embedded files
binwalk image.png

# For PNG LSB steganography
zsteg image.png -a

# Extract metadata
exiftool image.png
```

In this case, running `strings image.png | grep JCE` reveals:

### Flag

```
JCE{h1dd3n_1n_pl41n_s1ght}
```

## Key Takeaways

- Always check strings in binary files
- Images can hide data in multiple ways
- Tools: strings, binwalk, exiftool, steghide, zsteg, stegsolve
- Metadata often contains useful information
- LSB (Least Significant Bit) steganography is common
