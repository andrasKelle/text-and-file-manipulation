#!/bin/bash


wait () {
        sleep 3
}

print_names () {
# print employees first name
echo -e "\e[36mPrint employees first name\e[39m"
echo "$ cat employees.json | jq '.employees[].firstName'"
cat employees.json | jq '.employees[].firstName'
echo
}

print_original_json () {
# print original file, formatted
echo -e "\e[36mPrint original file, formatted\e[39m"
echo "$ employees.json | jq '.'"
cat employees.json | jq '.'
echo
}

print_names_phonenumbers () {
# print names and phonenumbers of employees
echo -e "\e[36mPrint names and phonenumbers of employees\e[39m"
echo "$ jq -r '.employees | .[] | [.firstName,.phoneNumbers[].number] | @tsv' employees.json"
jq -r '.employees | .[] | [.firstName,.phoneNumbers[].number] | @tsv' employees.json
echo
}

# print only mobile numbers
# jq -r '.employees | .[] | .phoneNumbers[] | select(.type=="mobile").number' employees.json

print_names_mobile_numbers () {
# print persons woth mobile phone number
echo -e "\e[36mPrint names with mobile phone number\e[39m"
echo "$ jq -r '.employees | .[] | [.firstName,(.phoneNumbers[] | select(.type=="mobile").number)] | @tsv' employees.json"
jq -r '.employees | .[] | [.firstName,(.phoneNumbers[] | select(.type=="mobile").number)] | @tsv' employees.json
echo
}

print_names

#print_original_json
#wait

print_names_phonenumbers

print_names_mobile_numbers
