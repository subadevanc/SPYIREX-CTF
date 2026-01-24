# PWN (Binary Exploitation) Challenges

This directory contains write-ups for binary exploitation challenges from SPYIREX CTF.

## Challenges

1. [Buffer Overflow Basic](buffer-overflow-basic.md) - Easy (200 points)
2. [Format String](format-string.md) - Medium (300 points)
3. [ROP Chain](rop-chain.md) - Hard (400 points)

## Common Techniques

- Buffer overflow
- Format string vulnerabilities
- Return-oriented programming (ROP)
- Shellcode injection
- Heap exploitation
- Integer overflow
- Use-after-free

## Useful Tools

- pwntools (Python library)
- gdb with pwndbg/gef/peda
- checksec
- ROPgadget
- one_gadget
- ropper
- radare2
- strace/ltrace

## Binary Protections

- **ASLR** - Address Space Layout Randomization
- **NX/DEP** - Non-executable stack
- **Stack Canary** - Protection against buffer overflows
- **PIE** - Position Independent Executable
- **RELRO** - Relocation Read-Only
