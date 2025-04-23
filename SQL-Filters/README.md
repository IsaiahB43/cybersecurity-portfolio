# 🗃️ SQL Filtering Examples

This folder includes examples of SQL queries that demonstrate how to apply filters to data, identify security-relevant information, and prevent common vulnerabilities such as SQL injection.

---

## 🧪 Sample Query: Filtering Failed Login Attempts

```sql
SELECT username, timestamp, ip_address
FROM login_logs
WHERE status = 'failed'
AND timestamp >= NOW() - INTERVAL 7 DAY;

SELECT * FROM users WHERE username = ' " + userInput + " ';
cursor.execute("SELECT * FROM users WHERE username = %s", (userInput,))

