# Base64 Layers

**Category:** Crypto  
**Difficulty:** Easy  
**Points:** 100  
**Author:** SPYIREX CTF Team

## Description

Decode this message:

```
VjBSSllWWnNTRkpUVlRVd1l6SlJQUT09
```

## Solution

### Initial Analysis

The string ends with `==` which is a telltale sign of Base64 encoding. However, one layer might not be enough.

### Approach

Decode Base64 repeatedly until we get the flag.

### Steps to Solve

1. Decode first layer of Base64
2. Result is still Base64 encoded
3. Continue decoding until plaintext is revealed

### Python Solution

```python
import base64

encoded = "VjBSSllWWnNTRkpUVlRVd1l6SlJQUT09"

# Layer 1
layer1 = base64.b64decode(encoded).decode()
print(f"Layer 1: {layer1}")

# Layer 2
layer2 = base64.b64decode(layer1).decode()
print(f"Layer 2: {layer2}")

# Layer 3
layer3 = base64.b64decode(layer2).decode()
print(f"Layer 3: {layer3}")

# Layer 4
layer4 = base64.b64decode(layer3).decode()
print(f"Layer 4: {layer4}")
```

Output:
```
Layer 1: V0RJYVZsSFJTVTUwYzJRPQ==
Layer 2: WDIxYVZlSFJTU50c2Q=
Layer 3: SkNFe2IwczY0X2wxeWVyczF9
Layer 4: JCE{b0s64_l1yers1}
```

### Flag

```
JCE{b0s64_l1yers1}
```

## Key Takeaways

- Base64 is encoding, not encryption
- Multiple layers of encoding are common in CTFs
- Always check for padding (`=` characters)
- Tools: CyberChef, Python base64 module, command line `base64`
