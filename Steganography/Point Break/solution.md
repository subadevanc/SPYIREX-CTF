### Point Break
![1_RCtExwxgr4AS-CMgONu3bQ](https://github.com/user-attachments/assets/dc48533e-50fc-4782-83d6-abf62bb83f86)
## 🔍 Step 1: Inspect the ZIP archive

zipinfo Pointbreak.zip
Output:

readme.txt (18 bytes)
thor.png (~2.5 MB)

The archive itself is not password-protected, indicating the secret is hidden inside the files, not behind ZIP encryption.

.

## 🖼️ Step 2: Identify steganography

Given:
A PNG file (lossless → ideal for hiding data)
Hint: “Extract carefully”
This strongly suggests ZIP steganography.

## 🧪 Step 3: Extract hidden data using zipography

zipography-extract Pointbreak.zip > ex.bin

This extracts hidden embedded data from the ZIP structure into a binary file.

## Step 4: Analyze extracted binary

xxd ex.bin
Hex Output (trimmed):
21 28 2e 10 3c 03 0e 05 34 2f 19 1e 06 18 34 39
04 07 07 34 2c 0e 06 34 3e 05 11 02 1b 18 16

## Step 5: Final Decode
Import Your Ex.bin in Cyberchef Use XOR Brute Force

![1_nQT0p9yrazxLcUZQUxSp0A](https://github.com/user-attachments/assets/35d1688e-e208-4c5f-b916-7a2e89459deb)


Step 6: Successful key discovery
Decoded Output:

JCE{When_Drums_Roll_Gem_Unzips}



