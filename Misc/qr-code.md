# QR Code

**Category:** Misc  
**Difficulty:** Easy  
**Points:** 75  
**Author:** SPYIREX CTF Team

## Description

Scan this QR code to get the flag.

![QR Code](qr_code.png)

## Solution

### Initial Analysis

A QR code is provided. We need to decode it to reveal the flag.

### Approach

Use a QR code scanner/decoder to read the contents.

### Steps to Solve

1. Save the QR code image

2. Use an online QR decoder:
   - https://zxing.org/w/decode
   - https://www.qr-code-generator.com/qr-code-scanner/

3. Or use command line tools:
   ```bash
   zbarimg qr_code.png
   ```

4. Or use Python:
   ```python
   from pyzbar.pyzbar import decode
   from PIL import Image
   
   img = Image.open('qr_code.png')
   result = decode(img)
   print(result[0].data.decode())
   ```

5. The decoded text reveals the flag

### Python Solution

```python
from pyzbar.pyzbar import decode
from PIL import Image

# Decode QR code
img = Image.open('qr_code.png')
decoded = decode(img)

for obj in decoded:
    print(f"Data: {obj.data.decode()}")
    print(f"Type: {obj.type}")
```

Output:
```
Data: JCE{qr_c0d3_d3c0d3d_345y}
Type: QRCODE
```

### Flag

```
JCE{qr_c0d3_d3c0d3d_345y}
```

## Key Takeaways

- QR codes can store various types of data
- Multiple tools available for decoding
- Can contain URLs, text, or other data
- Tools: zbarimg, online decoders, smartphone apps
- Python libraries: pyzbar, opencv
