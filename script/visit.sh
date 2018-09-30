#!/bin/sh
tree=()
visit(){
	directory=$1
	for target in $directory; do	
	  	if [ -d "$target" ];then
	  		visit "$target/*"
		else
			tree+=("$target")
  		fi
	done
}
visit "*"
for (( i=0; i<${#tree[@]}; i++ ));
do
  target=${tree[i]}
  echo "$target"
done