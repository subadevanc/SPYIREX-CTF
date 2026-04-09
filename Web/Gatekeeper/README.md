# Gatekeeper

## Category
Web

## Difficulty
Medium

## Challenge Summary
A web login challenge where normal users receive a fake flag, while admin login reveals the real one.
The key logic is implemented in a downloadable `auth.wasm` file.

Target site from event writeup:
`https://gatekeeper-spyirex.ct.ws/`

## Screenshots

![Gatekeeper screenshot 1](../../imports/assets/image-0042.png)
![Gatekeeper screenshot 2](../../imports/assets/image-0048.png)
![Gatekeeper screenshot 3](../../imports/assets/image-0053.png)
![Gatekeeper screenshot 4](../../imports/assets/image-0058.png)

## Approach
1. Register and log in as a normal user and observe fake flag behavior.
2. Download and decompile `auth.wasm` using `wasm2wat`.
3. Identify exported validation function and recover its XOR-based logic.
4. Reverse the byte transformation to reconstruct admin password.

Key logic from decompiled WASM:

```text
length == 24
enc[i] = input[i] XOR (0x42 + i * 3)
=> input[i] = enc[i] XOR (0x42 + i * 3)
```

Recovery script:

```python
enc = [
    0x15, 0x04, 0x1b, 0x06, 0x11, 0x18, 0x07, 0x08,
    0x1c, 0x12, 0x32, 0x3c, 0x28, 0x2c, 0x3e, 0x2b,
    0x2b, 0x2a, 0x28, 0x2c, 0x30, 0xc4, 0xd6, 0xd4
]
out = ''.join(chr(b ^ (0x42 + i * 3)) for i, b in enumerate(enc))
print(out)
```

Output:

```text
WASM_IS_FOR_NERDY_PWNERS
```

## Flag
`JCE{Y0Ur_A_N3rDY_R3_H3R0!!}`

## Source
Event writeup materials.
