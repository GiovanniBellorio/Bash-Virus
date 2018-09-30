#!/bin/bash

#####################################################
#####################################################
################## file main.sh #####################
#####################################################
#####################################################

# Nome Studente : Giovanni Bellorio
# Matricola     : VR386665
# Anno          : 2015-2016
# Corso         : Informatica
# Descrizione   : Realizzazione di uno script per la gestione delle aule
# Nome File     : main.sh
# ---------------------------------------------------
#
# Funzionalità  :
# 
# Script main che contiene le chiamate alle diverse funzioni per la gestione aule.
# Le prenotazioni saranno salvate su un file e le operazioni saranno effetuate su di esso. 
# ---------------------------------------------------

# ---------------------------------------------------
# INIZIO SCRIPT
# ---------------------------------------------------

echo "INIZIO ESECUZIONE"
echo "--------------------------------------------------------------------------------"

# Creazione file aule.txt (se non esiste viene creato vuoto)
touch aule.txt

# Vettore aule disponibili (c/o un qualsiasi edificio)
var_aule=("A" "B" "C" "Tessari")

# Ciclo while di stampa menù con relative procedure per la gestione. 
# L'utente addetto dovà specificare l'operazione da eseguire.
while [ true ]
do
	# STAMPO IL MENU PRINCIPALE
	echo -n "MENU':
1- Prenota
2- Elimina prenotazione
3- Mostra aula
4- Prenotazione per aula
5- Esci
--------------------------------------------------------------------------------
Indicare il nome dell'operazione desiderata: "
	
	# LEGGO PARAMETRO con il comando read
	read choice
	
	# CASE SWITCH con passaggio parametro var_aule ai file sui quali continua lo script dell'operazione specifica
	case "$choice" in
		"1")    ./prenota.sh 		   ${var_aule[@]};;
		"2")    ./elimina.sh           ${var_aule[@]};;
		"3")    ./mostra.sh            ${var_aule[@]};;
		"4") 	./prenotazioneAula.sh  ${var_aule[@]};;
		"5")    echo "Exit"; 
				echo "--------------------------------------------------------------------------------";
				echo "FINE ESECUZIONE";
				exit;;
		  *)    echo "Valore non corretto"
	esac
done