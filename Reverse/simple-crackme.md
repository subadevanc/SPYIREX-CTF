# Simple Crackme

**Category:** Reverse Engineering  
**Difficulty:** Easy  
**Points:** 150  
**Author:** SPYIREX CTF Team

## Description

Can you find the correct password?

Download: `crackme` (Linux ELF binary)

## Solution

### Initial Analysis

Running the binary shows it asks for a password. We need to reverse engineer it to find the correct password or bypass the check.

### Approach

Use reverse engineering tools to analyze the binary and understand the password checking logic.

### Steps to Solve

1. Check file type:
   ```bash
   file crackme
   ```

2. Run the binary to see behavior:
   ```bash
   ./crackme
   Enter password: test
   Wrong password!
   ```

3. Use `strings` to look for interesting text:
   ```bash
   strings crackme | grep -i password
   strings crackme | grep JCE
   ```

4. Disassemble with `objdump` or `radare2`:
   ```bash
   objdump -d crackme | less
   ```

5. Or use Ghidra/IDA for better analysis

### Using radare2

```bash
r2 -A crackme
aaa  # analyze all
afl  # list functions
pdf @main  # disassemble main
```

### Analysis

The binary compares user input with a hardcoded string:

```c
if (strcmp(input, "sup3r_s3cr3t_p4ss") == 0) {
    printf("Correct! Flag: JCE{r3v3rs3_3ng1n33r1ng_b4s1cs}\n");
} else {
    printf("Wrong password!\n");
}
```

### Running with correct password

```bash
./crackme
Enter password: sup3r_s3cr3t_p4ss
Correct! Flag: JCE{r3v3rs3_3ng1n33r1ng_b4s1cs}
```

### Flag

```
JCE{r3v3rs3_3ng1n33r1ng_b4s1cs}
```

## Key Takeaways

- strings command is often the first tool to try
- strcmp comparisons are easy to identify in disassembly
- Static analysis is faster than dynamic analysis for simple binaries
- Tools: strings, objdump, radare2, Ghidra, IDA Pro, gdb
- Understanding x86/x64 assembly is essential
