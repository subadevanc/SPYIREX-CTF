# Social Media Hunt

**Category:** OSINT  
**Difficulty:** Easy  
**Points:** 100  
**Author:** SPYIREX CTF Team

## Description

We have a username: `spyirex_user_2026`. Find their secret social media post containing the flag.

Hint: Check popular platforms.

## Solution

### Initial Analysis

OSINT (Open Source Intelligence) challenges require gathering information from publicly available sources like social media, websites, and online databases.

### Approach

Search for the username across various social media platforms.

### Steps to Solve

1. Use username search tools like:
   - Sherlock: `sherlock spyirex_user_2026`
   - namechk.com
   - knowem.com

2. Check major platforms manually:
   - Twitter/X
   - Instagram
   - Facebook
   - LinkedIn
   - GitHub
   - Reddit

3. Found the user on Twitter: `@spyirex_user_2026`

4. Browse their timeline and posts

5. Found a post from January 15, 2026 with an image

6. The flag is in the image metadata or embedded in the post

### Tools Used

```bash
# Sherlock - username search
sherlock spyirex_user_2026

# Google dorking
site:twitter.com "spyirex_user_2026"
site:instagram.com "spyirex_user_2026"
```

### Finding

The user's Twitter bio contained:
```
CTF enthusiast | Flag: JCE{s0c14l_m3d14_0s1nt_pr0} | Always learning
```

### Flag

```
JCE{s0c14l_m3d14_0s1nt_pr0}
```

## Key Takeaways

- Usernames are often reused across platforms
- Always check profiles, bios, and pinned posts
- Image metadata can contain hidden information
- Google dorking is very effective for OSINT
- Tools: Sherlock, Maltego, theHarvester, Google, Wayback Machine
- OSINT requires patience and thoroughness
