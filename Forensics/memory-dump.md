# Memory Dump Analysis

**Category:** Forensics  
**Difficulty:** Medium  
**Points:** 250  
**Author:** SPYIREX CTF Team

## Description

We captured a memory dump from a compromised system. Find the flag.

Download: `memory.raw` (500MB)

## Solution

### Initial Analysis

Memory dumps can contain sensitive information including passwords, encryption keys, and running processes. We'll use Volatility for analysis.

### Approach

Use Volatility framework to analyze the memory dump and extract relevant information.

### Steps to Solve

1. Determine the profile (OS version):
   ```bash
   volatility -f memory.raw imageinfo
   ```

2. List running processes:
   ```bash
   volatility -f memory.raw --profile=Win7SP1x64 pslist
   ```

3. Look for suspicious processes or notepad:
   ```bash
   volatility -f memory.raw --profile=Win7SP1x64 notepad
   ```

4. Dump notepad content:
   ```bash
   volatility -f memory.raw --profile=Win7SP1x64 memdump -p <PID> -D output/
   ```

5. Search for the flag in dumped memory:
   ```bash
   strings output/*.dmp | grep JCE
   ```

### Commands Used

```bash
# Identify OS profile
volatility -f memory.raw imageinfo

# List processes
volatility -f memory.raw --profile=Win7SP1x64 pslist

# Check command line history
volatility -f memory.raw --profile=Win7SP1x64 cmdscan

# Check clipboard
volatility -f memory.raw --profile=Win7SP1x64 clipboard

# Search for strings
strings memory.raw | grep -i "JCE{"
```

The flag was found in the clipboard:

### Flag

```
JCE{m3m0ry_f0r3ns1cs_v0l4t1l1ty}
```

## Key Takeaways

- Memory forensics can reveal sensitive information
- Volatility is the go-to tool for memory analysis
- Always check clipboard, notepad, and browser history
- Profile detection is crucial for proper analysis
- RAM can contain unencrypted data even from encrypted applications
- Tools: Volatility, Rekall, strings
