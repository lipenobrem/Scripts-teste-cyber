# Requer execução como Administrador
Write-Host "--- Iniciando Hardening Básico do Windows ---" -ForegroundColor Cyan

# 1. Desabilitar SMBv1 (Prevenção contra exploits legados)
Write-Host "[*] Desabilitando protocolo SMBv1..."
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
Write-Host "[+] SMBv1 desabilitado." -ForegroundColor Green

# 2. Desabilitar serviço Telnet se estiver presente
Write-Host "[*] Desabilitando serviço Telnet..."
if (Get-Service -Name "TlntSvr" -ErrorAction SilentlyContinue) {
    Set-Service -Name "TlntSvr" -StartupType Disabled
    Stop-Service -Name "TlntSvr" -Force
    Write-Host "[+] Telnet desabilitado." -ForegroundColor Green
} else {
    Write-Host "[-] Serviço Telnet não encontrado (já seguro)." -ForegroundColor Green
}

# 3. Configura Política de Senha Local (Tamanho Mínimo de 12 Caracteres)
Write-Host "[*] Ajustando tamanho mínimo de senha local..."
net accounts /minpwlen:12 | Out-Null
Write-Host "[+] Tamanho mínimo de senha definido para 12." -ForegroundColor Green

Write-Host "--- Hardening Concluído ---" -ForegroundColor Cyan