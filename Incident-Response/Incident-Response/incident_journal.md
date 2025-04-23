# 📓 Incident Handler’s Journal – Unauthorized Access Attempt

**Date:** April 14, 2025  
**Analyst:** Isaiah Benton  
**Incident ID:** IR-2025-014  

---

## 📝 Summary

On April 14, 2025, an unauthorized access attempt was detected on the internal web application hosted on `web01.company.local`. The attacker appeared to use SQL injection techniques to bypass login authentication.

---

## 🕒 Timeline of Events

| Time (CST) | Event |
|------------|-------|
| 12:45 PM   | Alert triggered by SIEM (failed logins and anomaly in SQL query logs) |
| 12:48 PM   | Analyst reviewed logs from `web01` |
| 12:52 PM   | Malicious input pattern found: `admin' OR 1=1 --` |
| 1:05 PM    | Blocked suspicious IP `203.0.113.42` at firewall level |
| 1:15 PM    | Conducted full scan of web server and verified no successful breach |
| 1:30 PM    | Reported incident to management and began root cause analysis |

---

## 🛠️ Actions Taken

- Blocked offending IP at the perimeter firewall
- Reviewed access logs and confirmed only failed attempts
- Ran Nessus scan on `web01` for vulnerabilities
- Identified outdated PHP version; flagged for patching
- Updated WAF rules to filter SQL meta-characters

---

## 📚 Lessons Learned

- Ensure web app input validation is enforced server-side
- Keep web server software and dependencies up to date
- Configure WAF to detect common injection patterns
- Continue weekly log reviews to identify brute-force and injection attempts

---

## 📎 Attachments

- Firewall logs (redacted)  
- Nessus scan summary  
- Screenshots of suspicious input

> 🔐 *This is a simulated entry. No real systems were accessed or exposed.*
