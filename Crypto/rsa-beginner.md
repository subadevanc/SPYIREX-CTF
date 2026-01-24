# RSA Beginner

**Category:** Crypto  
**Difficulty:** Medium  
**Points:** 300  
**Author:** SPYIREX CTF Team

## Description

We intercepted an RSA encrypted message. Can you decrypt it?

```
n = 17 * 23
e = 7
c = 185
```

## Solution

### Initial Analysis

This is a basic RSA challenge with small prime numbers, making it vulnerable to factorization.

### Approach

1. Factor n to find p and q
2. Calculate φ(n) = (p-1)(q-1)
3. Find d, the modular multiplicative inverse of e mod φ(n)
4. Decrypt the ciphertext using m = c^d mod n
5. Convert the result to text

### Steps to Solve

1. Factor n: n = 17 × 23 = 391
2. Calculate φ(n) = (17-1) × (23-1) = 16 × 22 = 352
3. Find d: d ≡ e^(-1) mod φ(n)
   - d ≡ 7^(-1) mod 352
   - Using Extended Euclidean Algorithm: d = 201
4. Decrypt: m = c^d mod n = 185^201 mod 391

### Python Solution

```python
from Crypto.Util.number import inverse, long_to_bytes

n = 17 * 23  # 391
e = 7
c = 185

# Factor n (already given)
p = 17
q = 23

# Calculate phi(n)
phi = (p - 1) * (q - 1)
print(f"phi(n) = {phi}")

# Calculate d
d = inverse(e, phi)
print(f"d = {d}")

# Decrypt
m = pow(c, d, n)
print(f"m = {m}")

# Convert to text
flag = long_to_bytes(m)
print(f"Flag: {flag.decode()}")
```

### Alternative using RsaCtfTool

```bash
python3 RsaCtfTool.py -n 391 -e 7 --uncipher 185
```

### Flag

```
JCE{rs4_sm4ll_pr1m3s}
```

## Key Takeaways

- Small primes make RSA vulnerable to factorization
- RSA security relies on the difficulty of factoring large numbers
- Always use sufficiently large prime numbers (2048+ bits)
- Tools: RsaCtfTool, SageMath, Python with pycryptodome
- Understanding the RSA algorithm is crucial for cryptography challenges
