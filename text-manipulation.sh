#!/bin/bash

# Replace the first 3 octects of every IP address in each line to XXX.XXX.XXX.

replace-octets () {

	echo -e "\e[36mReplace octets\e[39m"

	echo "$ sed -E 's/^([0-9]{1,3}\.){2}([0-9]{1,3})/XXX.XXX.XXX/g' access.log > access-final.log"

	sed -E 's/^([0-9]{1,3}\.){2}([0-9]{1,3})/XXX.XXX.XXX/g' access.log > access-final.log
	head access-final.log
	echo ""
}

# Print the information between the first " marks to stdout

print-paragraph () {

	echo -e "\e[36mPrint  segments from access.log\e[39m"
	echo "$ awk -F'\"' '{print $2}' access.log | grep POST | head -20 | tail"

	awk -F'"' '{print $2}' access.log | grep POST | head -20 | tail
	echo ""
}

replace-octets
print-paragraph

