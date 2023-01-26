#!/bin/bash/

echo -e "\e[36m--##### SCRIPT STARTING AT:"
pwd
echo -e "\e[0m"

echo -e "--Please insert the following details: "


sleep 1

echo -e "\e[91m--INSERT FTP username:"
echo -e "\e[0m"


read FTPusername
sleep 1

echo -e "\e[91m--Enter Remote Host NAME:"
echo -e "\e[0m"
read FTPhost

echo -e "\e[91m--Enter FTP PASSWORD:"
echo -e "\e[0m"
read FTPpass

echo -e "\e[91m--Enter destination DOMAIN NAME:"
echo -e "\e[0m"
read userDomain

echo -e "\e[32m--Details have been RECORDED... starting to copy remote files... "
echo -e "\e[0m"
sleep 2


cd ~/domains/${userDomain}/public_html/
echo -e "\e[36m--##### Files are being copied in: $PWD/"${FTPhost}""
echo -e "\e[0m"


while [ 1 ]; do
    wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue -m --ftp-user="${FTPusername}" --ftp-password="${FTPpass}" "ftp://"$FTPhost"/*"  -nv 
    if [ $? = 0 ]; 
    then 
    echo -e "Copying have been completed!" 
    break; fi; # check return value, break if successful (0)
    sleep 1s;
done;






