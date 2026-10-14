import socket
import argparse
from concurrent.futures import ThreadPoolExecutor

def scan_port(ip, port):
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(1.0)
            if s.connect_ex((ip, port)) == 0:
                print(f"[+] Porta {port} aberta")
    except Exception:
        pass

def main():
    parser = argparse.ArgumentParser(description="Scanner de Portas TCP Simples")
    parser.add_argument("-t", "--target", required=True, help="Endereço IP alvo")
    parser.add_argument("-p", "--ports", default="1-1024", help="Intervalo de portas (ex: 1-1024)")
    args = parser.parse_args()

    target_ip = args.target
    start_port, end_port = map(int, args.ports.split('-'))

    print(f"Iniciando varredura em {target_ip} (Portas {start_port} a {end_port})...")
    
    with ThreadPoolExecutor(max_workers=50) as executor:
        for port in range(start_port, end_port + 1):
            executor.submit(scan_port, target_ip, port)

if __name__ == "__main__":
    main()