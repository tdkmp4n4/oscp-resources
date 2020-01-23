# **Privilege Escalation Common Steps**

During post-exploitation phase, you must always follow these steps before any other enumeration task:

	1. List SUDO permissions for current user: "sudo -l"

	2. List all SUID files in the machine: "find / -perm -4000"

	3. Enumerate crontab jobs: "crontab -l" "cat /etc/crontab"
