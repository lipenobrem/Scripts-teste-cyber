#!/bin/bash

echo "========================================"
echo "    Enumeração Básica de Sistema Linux  "
echo "========================================"

echo -e "\n[+] Informações do Kernel:"
uname -ar

echo -e "\n[+] Usuários Logados:"
w

echo -e "\n[+] Portas TCP Ouvindo (Requer privilégios para PID):"
ss -tulpn | grep LISTEN

echo -e "\n[+] Tarefas Cron do Sistema:"
cat /etc/crontab

echo -e "\n[+] Usuários com UID 0 (Root):"
awk -F: '($3 == "0") {print}' /etc/passwd

echo "========================================"