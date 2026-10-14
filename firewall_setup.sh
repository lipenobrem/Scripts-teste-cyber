#!/bin/bash

# Verifica se está rodando como root
if [ "$EUID" -ne 0 ]; then 
  echo "Por favor, execute como root."
  exit
fi

echo "[*] Resetando regras do UFW..."
ufw --force reset

echo "[*] Configurando políticas padrão (Negar entrada, Permitir saída)..."
ufw default deny incoming
ufw default allow outgoing

echo "[*] Liberando portas essenciais (SSH, HTTP, HTTPS)..."
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

echo "[*] Habilitando o UFW..."
ufw --force enable

echo "[+] Firewall configurado com sucesso!"
ufw status verbose