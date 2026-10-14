# 🛡️ CyberSec Scripts Collection

Uma coleção de scripts desenvolvidos em **Python**, **Bash** e **PowerShell** focados em automação de tarefas de cibersegurança, auditoria de sistemas, análise de redes e administração segura.

> **⚠️ Aviso Legal / Disclaimer:**
> Todos os scripts neste repositório foram criados para fins educacionais e de uso profissional ético. Não utilize essas ferramentas em sistemas, redes ou aplicações para os quais você não tenha autorização explícita para testar ou auditar. O autor não se responsabiliza pelo uso indevido deste material.

---

## 📂 Estrutura do Repositório

Os scripts estão organizados por linguagem de programação. Cada diretório contém ferramentas específicas para seu respectivo ecossistema.

### 🐍 Python (`/python`)
Ferramentas multiplataforma para análise de dados de segurança, varreduras de rede e automação de APIs.
* `port_scanner.py`: Varredor de portas TCP rápido utilizando *sockets* e *multithreading*.
* `log_analyzer.py`: Analisador de logs do Apache/Nginx para identificar tentativas de ataques de força bruta.

### 🐧 Bash (`/bash`)
Scripts para ambientes Linux/Unix focados em administração, coleta de informações e hardening.
* `sys_enum.sh`: Script de enumeração de sistema para coletar informações de kernel, usuários e serviços ativos.
* `firewall_setup.sh`: Configuração automatizada de regras básicas do `iptables` e `ufw`.

### 🪟 PowerShell (`/powershell`)
Automação e auditoria para ambientes Windows e Active Directory.
* `audit_users.ps1`: Exporta uma lista de usuários inativos no sistema local ou AD.
* `win_hardening.ps1`: Aplica configurações de segurança recomendadas (desabilita serviços vulneráveis, ajusta políticas de senha).

---

## 🚀 Como Usar

### Pré-requisitos
* **Python**: Requer Python 3.8+ e as bibliotecas listadas em `requirements.txt` (se aplicável).
* **Bash**: Ambiente Linux ou WSL (Windows Subsystem for Linux).
* **PowerShell**: Windows PowerShell 5.1 ou PowerShell Core 7+. Requer permissão de execução de scripts (`Set-ExecutionPolicy RemoteSigned`).

### Exemplos de Execução

**Rodando um script Python:**
```bash
cd python
pip install -r requirements.txt
python port_scanner.py -t 192.168.1.1
