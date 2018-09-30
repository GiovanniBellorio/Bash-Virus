#!/bin/bash

#####################################################
#####################################################
################ file prenota.sh ####################
#####################################################
#####################################################

# Nome Studente : Giovanni Bellorio
# Matricola     : VR386665
# Anno          : 2015-2016
# Corso         : Informatica
# Descrizione   : Realizzazione di uno script per la gestione delle aule
# Nome File     : prenota.sh
# ---------------------------------------------------
#
# Funzionalità  :
#
# Procedura che consente di aggiungere una nuova prenotazione. L'utente dovrà inserire il nome dell'aula (controllato),
# la data (controllata sulla lunghezza), l' ora (8-17) e il nome utente (non due prenotazioni uguali).
# ---------------------------------------------------

# ---------------------------------------------------
# INIZIO SCRIPT
# ---------------------------------------------------

echo "--------------------------------------------------------------------------------"
echo "PRENOTA: comando che ci permette di aggiungere una nuova prenotazione"

# Visualizzo le aule disponibili in questo momento:
echo "Aule inserite nel sistema:"
for arg in "$@"
do 
	echo $arg
done

# Inizio modulo di prenotazione aula
echo "--------------------------------------------------------------------------------"
echo -n "Inserire aula             : "
read aula

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

# Continuo con l'inserimento di data e ora
flag_data=0
flag_ora=0
if [ "$flag_aula" -eq 1 ]; then
	echo -n "Inserire data (aaaammgg)  : "
	read data
	# Recupero la lunghezza dell'operando contenuto nella variabile data
	len_data=${#data}
	# Se la lughezza della data è 8 (aaaammgg) allora la data è valida
	if [ "$len_data" -eq 8 ]; then
		flag_data=1
	else
		echo "Data inserita non valida."
	fi
	# Se la data è valida continuo
	if [ "$flag_data" -eq 1  ]; then
		echo -n "Inserire l'ora (8-17)     : "
		read ora
		# Se la variabile ora è vuota, l'inserimento non è valido
		if [ -z "$ora" ]; then
			flag_ora=0
			echo "Orario non valido."
		# Controllo che l'orario inserito sia tra le 8 e le 17
		elif [ "$ora" -ge "8" ] && [ "$ora" -le "17" ]; then
			flag_ora=1
		else
			echo "Orario non valido."
		fi
	fi
else
	echo "Aula inserita non valida."
fi

# Inserimento nome utente e scrittura su file aule.txt
if [ "$flag_ora" -eq 1 ]; then
	# Salvo nella variabile count il numero di righe corrispondenti alla prenotazione richiesta rispetto al file
	count=$(grep "$aula;$data;$ora" aule.txt | wc -l)
	# Se non ci sono corrispondenze, salvo la prenotazione sul file (in fondo)
	if [ "$count" -eq 0 ]; then
		echo -n "Inserire nome utente      : "
		read utente
		echo "$aula;$data;$ora;$utente" >> aule.txt
		echo "Prenotazione andata a buon fine."
	else
		echo "Aula occupata."
	fi
else
	echo "ERRORE. Riprovare a inserire i dati."
fi

echo "--------------------------------------------------------------------------------"