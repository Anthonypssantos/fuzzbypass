#!/bin/bash

figlet Tonho

function cases {
clear
echo "1: para fuzzing || 2: para bypass-403"
echo "3: mostrar resultados do fuzzing || 4: sair"
read -p "Digite um dos numeros: " a
case $a in
        "1")
                fuzzing
		;;
        "2")
                bypass-403
                ;;
	"3")
		print
		;;
	"4")
                exit 0
esac
}

function print {
cat resultados
echo "====<>===="
read -p "1 para terminar de visualizar: " t
if [[ $t == "1" ]]; then
	cases
else
	clear
	print
fi
}

function fuzzing {
clear
read -p "Passe o dominio: " dominio
sudo gobuster dir -u $dominio -w /home/bypass-403/scriptfuzz.txt -t 100 -e --no-error -r -o resultados
clear
cases
}

function bypass-403 {
clear
figlet Tonho
read -p "Passe o link do 403: " link
./bypass-403.sh $link
read -p "Digite 1 para voltar ou 2 para sair" n
echo "==>><<=="
if [[ $n == "1" ]]; then
	cases
else
	echo "flw"
fi
}

cases
