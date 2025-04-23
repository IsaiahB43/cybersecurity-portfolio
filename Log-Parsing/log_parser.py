import re

# Sample log format:
# 2025-04-10 14:23:55 - LOGIN - user:admin - status:failed - ip:192.168.1.15

def parse_log(file_path):
    failed_logins = []
    ip_counter = {}

    with open(file_path, 'r') as file:
        for line in file:
            if "status:failed" in line:
                failed_logins.append(line.strip())
                ip_match = re.search(r'ip:(\S+)', line)
                if ip_match:
                    ip = ip_match.group(1)
                    ip_counter[ip] = ip_counter.get(ip, 0) + 1

    print("\n--- Failed Login Attempts ---")
    for entry in failed_logins:
        print(entry)

    print("\n--- Suspicious IPs with multiple failures ---")
    for ip, count in ip_counter.items():
        if count > 3:
            print(f"{ip} - {count} failed attempts")

# Run the parser (you can replace 'sample_log.txt' with your own test file)
if __name__ == "__main__":
    parse_log("sample_log.txt")
