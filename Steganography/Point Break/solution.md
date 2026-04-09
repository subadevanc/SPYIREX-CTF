# Point Break - Solution

## Step 1: Inspect the ZIP archive

```bash
zipinfo Pointbreak.zip
```

Expected contents include:
- `readme.txt`
- `thor.png`

The archive is not password-protected, so the hidden content is inside the ZIP
data, not behind ZIP encryption.

## Step 2: Identify likely technique

Given a PNG and the hint "Extract carefully", this points to ZIP-level stego.

## Step 3: Extract hidden bytes

```bash
zipography-extract Pointbreak.zip > ex.bin
```

## Step 4: Inspect extracted bytes

```bash
xxd ex.bin
```

Sample output:

```text
21 28 2e 10 3c 03 0e 05 34 2f 19 1e 06 18 34 39
04 07 07 34 2c 0e 06 34 3e 05 11 02 1b 18 16
```

## Step 5: Decode with XOR brute force

Load `ex.bin` in CyberChef and use XOR brute force to recover plaintext.

## Flag

`JCE{When_Drums_Roll_Gem_Unzips}`
