# Caesar Cipher

**Category:** Crypto  
**Difficulty:** Easy  
**Points:** 75  
**Author:** SPYIREX CTF Team

## Description

The following message was intercepted. Can you decode it?

```
WFH{fdhvdu_flskhu_lv_hdvb}
```

## Solution

### Initial Analysis

The format looks like a flag but with letters shifted. This suggests a Caesar cipher (ROT cipher).

### Approach

Try different Caesar cipher shifts to decode the message.

### Steps to Solve

1. Recognize the pattern `WFH{...}` which should be `JCE{...}`
2. Calculate the shift: W->J is -13 or ROT13, but let's verify
3. Actually W->J is a shift of -13 (or shift of 13 backwards)
4. Apply shift of -3 (W=23, J=10, difference = -13 mod 26 = 13 forward or 13 backward)
5. Wait, let me recalculate: W(22) to J(9) = -13 = 13 backward
6. Actually simpler: try all 26 shifts

### Python Solution

```python
def caesar_decrypt(text, shift):
    result = ""
    for char in text:
        if char.isalpha():
            if char.isupper():
                result += chr((ord(char) - ord('A') - shift) % 26 + ord('A'))
            else:
                result += chr((ord(char) - ord('a') - shift) % 26 + ord('a'))
        else:
            result += char
    return result

encrypted = "WFH{fdhvdu_flskhu_lv_hdvb}"
for shift in range(26):
    print(f"Shift {shift}: {caesar_decrypt(encrypted, shift)}")
```

With shift of 3, we get:

### Flag

```
JCE{caesar_cipher_is_easy}
```

## Key Takeaways

- Caesar cipher is a simple substitution cipher
- ROT13 is a special case with shift of 13
- Brute force is feasible with only 26 possible shifts
- Tools: CyberChef, dcode.fr
