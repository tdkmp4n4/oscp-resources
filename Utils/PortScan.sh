#!/bin/bash
echo "[*] Portscan started"
host=$1
for port in $(seq 1 65535);
do
	timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "[+] Port $port is open"
done
echo "[*] Portscan finished"
