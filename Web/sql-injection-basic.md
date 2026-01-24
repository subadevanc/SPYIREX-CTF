# SQL Injection Basic

**Category:** Web  
**Difficulty:** Easy  
**Points:** 100  
**Author:** SPYIREX CTF Team

## Description

A simple login form is provided. Can you bypass the authentication?

URL: `http://challenge.spyirex.local/login`

## Solution

### Initial Analysis

The challenge presents a basic login form with username and password fields. Testing for SQL injection vulnerabilities is the first step.

### Approach

We can attempt a classic SQL injection bypass by manipulating the SQL query used for authentication.

### Steps to Solve

1. Navigate to the login page
2. Try basic SQL injection payloads in the username field
3. Use payload: `admin' OR '1'='1' --` in the username field
4. Leave password field as anything
5. Submit the form

### Payload

```sql
Username: admin' OR '1'='1' --
Password: anything
```

### Flag

```
JCE{sql_1nj3ct10n_1s_st1ll_c0mm0n}
```

## Key Takeaways

- Always sanitize user inputs
- Use parameterized queries to prevent SQL injection
- Never trust user input in web applications
- Tools: Burp Suite, SQLMap
