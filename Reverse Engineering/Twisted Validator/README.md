# Twisted Validator

## Category
Reverse Engineering

## Difficulty
Medium

## Challenge Summary
Given `twisted_validator.py`, recover the original flag by reversing a chain of byte operations:
XOR mixing, byte rotation, adjacent-byte swapping, and LCG-derived keys.

## Screenshots

![Twisted Validator screenshot 1](../../imports/assets/image-0075.png)
![Twisted Validator screenshot 2](../../imports/assets/image-0080.png)

## Reverse Strategy
The forward validator pipeline was reversed in opposite order:
1. XOR with reversed key2
2. Unscramble adjacent swapped bytes
3. Rotate right by 7
4. XOR with key1

Recovered script:

```python
def generate_key(length, seed):
    key = []
    current = seed
    for _ in range(length):
        current = (current * 1103515245 + 12345) & 0x7fffffff
        key.append(current & 0xff)
    return bytes(key)


def mix(data, key):
    return bytes(data[i] ^ key[i % len(key)] for i in range(len(data)))


def rotate_right(data, n):
    n = n % len(data)
    return data[-n:] + data[:-n]


def unscramble(data):
    result = bytearray(data)
    for i in range(0, len(result) - 1, 2):
        result[i], result[i + 1] = result[i + 1], result[i]
    return bytes(result)


expected = bytes([
    0x9e, 0x1c, 0x77, 0xd4, 0x8e, 0x97, 0x17, 0x58,
    0x73, 0x5e, 0xbe, 0x65, 0x44, 0xaf, 0x9c, 0x23,
    0x7d, 0x19, 0x6e, 0x89, 0xf2, 0x4d, 0x37, 0xc1,
    0x52, 0xa8,
])

key2 = generate_key(26, 0x1337 ^ 0xDEAD)
data = mix(expected, key2[::-1])
data = unscramble(data)
data = rotate_right(data, 7)
key1 = generate_key(26, 0x1337)
flag_bytes = mix(data, key1)

print(flag_bytes.decode("latin-1"))
```

Output:

```text
JCE{LCG_4nd_X0R_m4g1c!}
```

## Flag
`JCE{LCG_4nd_X0R_m4g1c!}`

## Source
Event writeup materials.
