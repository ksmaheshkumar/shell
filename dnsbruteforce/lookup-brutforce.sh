#!/bin/bash

function helper() {
  echo "[INFO] You need to pass two arguments"
  echo "[INFO] ARG 1: the domain name"
  echo "[INFO] ARG 2: the path of the list"
  echo -e "\n[INFO] Example: $0 megacorpone.com /root/Desktop/list.txt"
  echo "[INFO] Example: $0 megacorpone.com subdomains-100.txt"
}

echo "[+] Start brute force ..."
# Check if we have an argument
if [ "$1" == "" ] && [ "$2" == "" ]; then
  helper
  exit
fi

# Check if file exist
if [ ! -f "$2" ]; then
  helper
  exit
fi

# Parse the file
for x in $(cat $2); do
  (host $x.$1 |grep "has address" )
done

echo "[+] End brute force."
