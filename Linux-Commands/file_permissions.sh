#!/bin/bash
# Script to demonstrate basic Linux commands for file security

echo "Creating a secure directory..."
mkdir secure_dir
chmod 700 secure_dir
echo "Directory 'secure_dir' created with owner-only access (rwx------)"

echo "Creating a user 'analyst'..."
sudo useradd analyst
sudo passwd analyst
echo "User 'analyst' created."

echo "Creating a file and setting custom permissions..."
touch secure_file.txt
chmod 600 secure_file.txt
echo "File 'secure_file.txt' created with owner read/write only (rw-------)"

echo "Displaying file permissions:"
ls -l secure_file.txt

echo "Displaying current users and activity:"
who
last -a | head -n 5

## 🔧 How to Run

To run the sample script on a Linux machine:

```bash
chmod +x file_permissions.sh
./file_permissions.sh
