# SPYIREX-CTF Write-ups

![CTF](https://img.shields.io/badge/CTF-SPYIREX-blue)
![Institution](https://img.shields.io/badge/Institution-JCE-green)

SPYIREX CTF is a Capture The Flag competition organized by the Department of Cybersecurity and Club CYBER NEXUS, Jerusalem College of Engineering. This repository contains the official post-event write-ups for all challenges, with flags in the format `JCE{...}`.

## 📚 Table of Contents

- [Challenge Categories](#challenge-categories)
- [Repository Structure](#repository-structure)
- [Challenge Summary](#challenge-summary)
- [How to Use This Repository](#how-to-use-this-repository)
- [Contributing](#contributing)
- [Resources](#resources)

## 🎯 Challenge Categories

This CTF featured challenges across multiple categories:

### 🌐 [Web Exploitation](Web/)
Challenges involving web application security vulnerabilities.
- [SQL Injection Basic](Web/sql-injection-basic.md) - 100 points
- [XSS Challenge](Web/xss-challenge.md) - 200 points
- [Directory Traversal](Web/directory-traversal.md) - 250 points

### 🔐 [Cryptography](Crypto/)
Encryption, encoding, and cryptographic challenges.
- [Caesar Cipher](Crypto/caesar-cipher.md) - 75 points
- [Base64 Layers](Crypto/base64-layers.md) - 100 points
- [RSA Beginner](Crypto/rsa-beginner.md) - 300 points

### 🔍 [Forensics](Forensics/)
Digital forensics and data analysis challenges.
- [Hidden in Image](Forensics/hidden-in-image.md) - 100 points
- [Memory Dump Analysis](Forensics/memory-dump.md) - 250 points
- [Network Traffic](Forensics/network-traffic.md) - 300 points

### 🔧 [Reverse Engineering](Reverse/)
Binary analysis and reverse engineering challenges.
- [Simple Crackme](Reverse/simple-crackme.md) - 150 points

### 💥 [Binary Exploitation (PWN)](PWN/)
Memory corruption and exploitation challenges.
- [Buffer Overflow Basic](PWN/buffer-overflow-basic.md) - 200 points

### 🕵️ [OSINT](OSINT/)
Open Source Intelligence gathering challenges.
- [Social Media Hunt](OSINT/social-media-hunt.md) - 100 points

### 🎲 [Miscellaneous](Misc/)
Various challenges that don't fit other categories.
- [Sanity Check](Misc/sanity-check.md) - 50 points
- [QR Code](Misc/qr-code.md) - 75 points

## 📁 Repository Structure

```
SPYIREX-CTF/
├── README.md              # This file
├── TEMPLATE.md            # Template for new write-ups
├── Web/                   # Web exploitation challenges
│   ├── README.md
│   └── *.md              # Individual challenge write-ups
├── Crypto/                # Cryptography challenges
│   ├── README.md
│   └── *.md
├── Forensics/             # Forensics challenges
│   ├── README.md
│   └── *.md
├── Reverse/               # Reverse engineering challenges
│   ├── README.md
│   └── *.md
├── PWN/                   # Binary exploitation challenges
│   ├── README.md
│   └── *.md
├── OSINT/                 # OSINT challenges
│   ├── README.md
│   └── *.md
└── Misc/                  # Miscellaneous challenges
    ├── README.md
    └── *.md
```

## 📊 Challenge Summary

| Category | Easy | Medium | Hard | Total Points |
|----------|------|--------|------|--------------|
| Web | 1 | 2 | 0 | 550 |
| Crypto | 2 | 1 | 0 | 475 |
| Forensics | 1 | 2 | 0 | 650 |
| Reverse | 1 | 0 | 0 | 150 |
| PWN | 1 | 0 | 0 | 200 |
| OSINT | 1 | 0 | 0 | 100 |
| Misc | 2 | 0 | 0 | 125 |
| **Total** | **9** | **5** | **0** | **2,250** |

## 🚀 How to Use This Repository

### For Players

1. Browse challenges by category in their respective folders
2. Each write-up includes:
   - Challenge description
   - Solution approach
   - Step-by-step guide
   - Scripts/tools used
   - Key takeaways

### For Challenge Authors

Use the [TEMPLATE.md](TEMPLATE.md) file as a starting point for creating new write-ups.

## 🤝 Contributing

We welcome contributions! If you'd like to add a write-up or improve existing ones:

1. Fork this repository
2. Create a new branch (`git checkout -b feature/new-writeup`)
3. Add your write-up following the template structure
4. Commit your changes (`git commit -m 'Add write-up for [challenge name]'`)
5. Push to the branch (`git push origin feature/new-writeup`)
6. Open a Pull Request

### Write-up Guidelines

- Use the provided [TEMPLATE.md](TEMPLATE.md)
- Include clear, step-by-step solutions
- Add screenshots or code snippets where helpful
- List all tools and resources used
- Include key takeaways and learning points
- Ensure flags are in the format `JCE{...}`

## 📖 Resources

### General CTF Resources

- [CTFtime](https://ctftime.org/) - CTF events and team rankings
- [PicoCTF](https://picoctf.org/) - Beginner-friendly CTF
- [OverTheWire](https://overthewire.org/) - Wargames
- [HackTheBox](https://www.hackthebox.eu/) - Penetration testing labs

### Category-Specific Resources

#### Web
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [PortSwigger Web Security Academy](https://portswigger.net/web-security)

#### Cryptography
- [CryptoHack](https://cryptohack.org/)
- [Cryptopals](https://cryptopals.com/)

#### Forensics
- [Digital Forensics Discord](https://aboutdfir.com/)

#### Reverse Engineering
- [Malware Unicorn Workshops](https://malwareunicorn.org/)
- [Nightmare by guyinatuxedo](https://guyinatuxedo.github.io/)

#### Binary Exploitation
- [pwn.college](https://pwn.college/)
- [ROP Emporium](https://ropemporium.com/)

#### OSINT
- [OSINT Framework](https://osintframework.com/)

---

**Organized by:** Department of Cybersecurity & Club CYBER NEXUS  
**Institution:** Jerusalem College of Engineering  
**Event:** SPYIREX CTF 2026

For questions or feedback, please open an issue in this repository.
