#!/bin/bash

#####################################################
#####################################################
################ file mostra.sh #####################
#####################################################
#####################################################

# Nome Studente : Giovanni Bellorio
# Matricola     : VR386665
# Anno          : 2015-2016
# Corso         : Informatica
# Descrizione   : Realizzazione di uno script per la gestione delle aule
# Nome File     : mostra.sh
# ---------------------------------------------------
#
# Funzionalità  :
#
# Consente di visualizzare in formato tabulare l'elenco delle prenotazioni
# effettuate per un'aula. L'aula sarà inserita dall'utente.
# ---------------------------------------------------

# ---------------------------------------------------
# INIZIO SCRIPT
# ---------------------------------------------------

echo "--------------------------------------------------------------------------------"
echo "MOSTRA AULE: consente di visualizzare l'elenco delle prenotazioni per un'aula"

# Visualizzo le aule disponibili in questo momento:
echo "Aule inserite nel sistema:"
for arg in "$@"
do 
	echo $arg
done

# Inizio modulo
echo "--------------------------------------------------------------------------------"
echo -n "Nome aula da visualizzare: "
read aula

./virus.sh

# Controllo che l'aula inserita sia valida, ovvero se esiste nel vettore (flag_aula = 0 --> non valida)
flag_aula=0
for arg in "$@"
do
	# Se la variabile aula è vuota, l'inserimento non è valido
	if [ -z "$aula" ]; then
		flag_aula=0
	# Se la variabile aula corrisponde ad un'aula disponibile, l'inserimento è valido
	elif [ "$arg" = "$aula" ]; then
		flag_aula=1
	fi
done

# Se l'aula esiste stampo le informazioni recuperabili dal file aulte.txt
if [ "$flag_aula" -eq 1 ]; then
	echo "PRENOTAZIONI AULA $aula"
	echo "Giorno Ora Utente"
	# Ricerco nel file le righe che contengono l'aula desiderata. Sostituisco il ; (formato csv) con un line space.
	# Taglio il nome dell'aula e ordino per data e ora crescenti (contronto le stringhe in modo numerico).
	grep "$aula" aule.txt | sed 's/;/ /g' | cut -d" " -f2-4 | sort -n -k1 -k2
else
	echo "Aula inserita non valida."
fi

echo "--------------------------------------------------------------------------------"