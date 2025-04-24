# 🗂️ SQL Filtering Project

This project demonstrates how SQL filtering can be used to retrieve important and security-relevant information from login logs and employee records. These examples simulate common use cases such as monitoring failed logins, identifying login patterns, and performing basic HR data queries for access control.

---

## 📌 Project Description

Through SQL, we can extract specific and meaningful data from large datasets by applying filters, conditions, and logical clauses. This project showcases how to:

- Monitor failed login attempts
- Identify activity on specific dates
- Detect access from outside designated regions
- Extract department-specific employee data

---

## 🔐 Query Examples

### 1. Retrieve After-Hours Failed Login Attempts

```sql
SELECT username, timestamp, ip_address
FROM login_logs
WHERE status = 'failed'
  AND (HOUR(timestamp) < 8 OR HOUR(timestamp) > 18);

SELECT username, timestamp, ip_address, country
FROM login_logs
WHERE country != 'Mexico';

SELECT employee_id, first_name, last_name, department
FROM employees
WHERE department = 'Marketing';

SELECT employee_id, first_name, last_name, department
FROM employees
WHERE department IN ('Finance', 'Sales');

SELECT employee_id, first_name, last_name, department
FROM employees
WHERE department != 'IT';




-- Retrieve all failed login attempts within the last 30 days
SELECT username, timestamp, ip_address
FROM login_logs
WHERE status = 'failed'
  AND timestamp >= NOW() - INTERVAL 30 DAY;

-- Detect users with more than 5 failed logins within a day (possible brute-force)
SELECT username, COUNT(*) AS failed_attempts, DATE(timestamp) AS login_date
FROM login_logs
WHERE status = 'failed'
GROUP BY username, DATE(timestamp)
HAVING COUNT(*) > 5;

-- List users who accessed the admin panel
SELECT DISTINCT username, timestamp, ip_address
FROM access_logs
WHERE resource_accessed LIKE '%admin%';

-- Find SQL injection attempts by checking for suspicious patterns in user input
SELECT *
FROM user_inputs
WHERE input_text LIKE '%--%'
   OR input_text LIKE '%;%'
   OR input_text LIKE '%DROP TABLE%'
   OR input_text LIKE '%OR 1=1%';

-- Find logins from IP addresses outside allowed regions
SELECT username, ip_address, timestamp
FROM login_logs
WHERE ip_address NOT IN (
  SELECT ip_address FROM allowed_ip_list
);
