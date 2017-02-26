#!/bin/bash

if [ -z $1 ]; then
  echo -e "\n[+] DNS zone transfert script"
  echo -e "[+] Usage   : $0 <domain name>\n"
  exit 0
fi

echo -e "\n[+] Start zone transfert test ...\n"
for server in $(host -t NS $1 |cut -d" " -f4); do
  host -l $1 $server |grep "has address"
done

echo -e "\n[+] Stope zone transfert test.\n"
