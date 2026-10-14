# Requer execução como Administrador
Write-Host "--- Auditoria de Contas Locais Inativas (30 Dias) ---" -ForegroundColor Cyan

$DaysInactive = 30
$CutoffDate = (Get-Date).AddDays(-$DaysInactive)

$LocalUsers = Get-LocalUser | Where-Object { $_.Enabled -eq $True }

foreach ($User in $LocalUsers) {
    if ($User.LastLogon -eq $null) {
        Write-Host "[!] Usuário $($User.Name) nunca fez login." -ForegroundColor Yellow
    }
    elseif ($User.LastLogon -lt $CutoffDate) {
        Write-Host "[!] Usuário $($User.Name) inativo desde $($User.LastLogon)." -ForegroundColor Red
    }
    else {
        Write-Host "[+] Usuário $($User.Name) ativo. Último login: $($User.LastLogon)." -ForegroundColor Green
    }
}