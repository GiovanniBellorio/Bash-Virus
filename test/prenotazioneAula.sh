#!/bin/bash

#####################################################
#####################################################
########### file prenotazioneAula.sh ################
#####################################################
#####################################################

# Nome Studente : Giovanni Bellorio
# Matricola     : VR386665
# Anno          : 2015-2016
# Corso         : Informatica
# Descrizione   : Realizzazione di uno script per la gestione delle aule
# Nome File     : prenotazioneAula.sh
# ---------------------------------------------------
#
# Funzionalità  :
#
# Mostrare il numero totale di prenotazioni per ciascuna aula.
# Ordinare in modo crescente le aule in base al numero di prenotazione di ciascuna.
# ---------------------------------------------------

# ---------------------------------------------------
# INIZIO SCRIPT
# ---------------------------------------------------

echo "--------------------------------------------------------------------------------"
echo "PRENOTAZIONI PER AULA: numero totale di prenotazioni per ciascuna aula"

# Creazione file sort_aule.txt (se non esiste viene creato vuoto - file ausiliario)
touch sort_aule.txt

# Ciclo for che scorre tutte le aule inserite nel vettore.
# Per ciascuna si conatno le occorrenze all'interno del file aule.txt.
for arg in "$@"
do 
	count=$(grep "$arg" aule.txt |  wc -l)
	# Scrivo sul file ausiliario sort_aule.txt il nome dell'aula e il numero di prenotazioni
	echo "$arg: $count" >> sort_aule.txt
done

# Ordino per nome aula e numero prenotazioni crescenti (contronto le stringhe in modo numerico)
sort -n -k1 -k2 sort_aule.txt

# Elimino il file ausiliario sort_aule.txt
rm sort_aule.txt

echo "--------------------------------------------------------------------------------"