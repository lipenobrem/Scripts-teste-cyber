import re
import argparse
from collections import Counter

def analyze_logs(file_path, threshold):
    failed_ips = []
    # Regex básica para extrair IPv4 de linhas que contêm "Failed password"
    ip_pattern = re.compile(r"Failed password.*from ([\d\.]+) port")

    try:
        with open(file_path, 'r') as file:
            for line in file:
                match = ip_pattern.search(line)
                if match:
                    failed_ips.append(match.group(1))
        
        counts = Counter(failed_ips)
        print(f"--- IPs com mais de {threshold} falhas de login ---")
        for ip, count in counts.items():
            if count >= threshold:
                print(f"[!] IP: {ip} | Tentativas: {count}")
                
    except FileNotFoundError:
        print(f"Erro: Arquivo {file_path} não encontrado.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Analisador de Log de Autenticação")
    parser.add_argument("-f", "--file", required=True, help="Caminho para o arquivo de log")
    parser.add_argument("-t", "--threshold", type=int, default=5, help="Limite de falhas para alerta")
    args = parser.parse_args()
    
    analyze_logs(args.file, args.threshold)