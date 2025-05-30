
# 🧠 Incident Report Analysis – Unauthorized Port Scanning Attempt

---

## 📝 Summary
The company experienced a security event when unusual traffic patterns were detected originating from an external IP address. Upon investigation, the cybersecurity team identified a **port scanning attack** targeting multiple hosts across the internal network. This scanning activity was likely part of reconnaissance to identify open ports and vulnerable services. The team responded by blocking the offending IP, isolating affected hosts, and reviewing firewall policies.

---

## 🔍 Identify
A malicious actor initiated a port scan using TCP SYN packets directed at multiple internal IP addresses. The attack originated from a single external IP and targeted ports commonly associated with SSH (22), RDP (3389), and SMB (445). While no actual breaches occurred, the activity represents a clear attempt to map the internal network.

---

## 🔐 Protect
The cybersecurity team implemented new firewall rules to block traffic from the source IP and deployed stricter **rate limiting** policies. Additionally, access control lists (ACLs) were updated to limit exposure of sensitive services like SSH and RDP to only known IPs. Unnecessary services on endpoints were also disabled.

---

## 🔎 Detect
Network monitoring software (such as **Zeek** and **Wireshark**) was used to detect the abnormal increase in SYN packets. Alerts were also generated by the **Intrusion Detection System (IDS)** which flagged the scan based on known signature patterns. The security team enabled additional logging and deep packet inspection on border routers.

---

## 🛠️ Respond
To respond to future port scanning attempts:
- Affected endpoints will be isolated for review
- All attempted connections will be logged and analyzed
- A threat intelligence feed will be used to identify repeat offenders
- The incident will be documented and shared with management
- The source IP address will be added to a blocklist

---

## 🔧 Recover
To restore normal operations:
- Network services were confirmed to be unaffected but were rebooted as a precaution
- Firewall rules were tested and updated to ensure persistent protection
- Security policies were reviewed and updated across all endpoint devices
- The incident report was logged for future security audits

---

## 💭 Reflections / Notes
- Proactive monitoring is key to early detection of reconnaissance activity
- IDS and firewall logs were critical to understanding the scope and method of attack
- Regular vulnerability scans can help reduce the attack surface that port scanners look for
- Going forward, the team will consider implementing honeypots to study attacker behavior without endangering production systems
