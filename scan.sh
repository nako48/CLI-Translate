#!/bin/bash
#issued on : 18 agustus 2018
#coded By Arvan Apriyana
waktu=$(date '+%Y-%m-%d %H:%M:%S')
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
LIGHTGREEN="\e[92m"
MARGENTA="\e[35m"
BLUE="\e[34m"
BOLD="\e[1m"
NOCOLOR="\e[0m"
header(){
printf "${GREEN}
         ####################################
         ####################################
         #######                      #######
         #######                      #######${BLUE}
         ####### www.tatsumi-crew.net #######
         ###############      ###############
         ###############      ###############
         ###############      ###############
         ###############      ###############${RED}
         #######    ####      ####    #######
         #######    ####      ####    #######
         #######    ##############    #######
         #######    ##############    #######
         #######                      #######
         ####################################
         ####################################${NOCOLOR}
         ------------------------------------
               Translate Bash Version
         ------------------------------------
"
}
scanskrng(){ #function
    textna="$1"
    bahasa1="$2"
    bahasa2="$3"
	url="https://translate.yandex.net/api/v1/tr.json/translate?id=a97b9b39.5b784fbe.241e391b-0-0&srv=tr-text&lang=$2-$3&reason=auto"
	ref="https://translate.yandex.net/api/"
	GetRequest=$(curl -s -A "$ua" -e "$ref" -X POST -d "text=$1&options=4" "$url")	
	if [[ $GetRequest =~ "\"code\":200" ]]; then 
	    TransLate=$(echo $GetRequest | grep -Po '(?<=text":)[^}]*' | sed 's/\[\"//g' | sed 's/\"\]//g')
		printf "\nTranslate : ${GREEN}$TransLate \n"
		printf "${NORMAL}"
	else
		printf "\ntidak diketahui\n"
	fi
}

header

read -p "Input Text: " text;
read -p "From : " lang1;
read -p "To : " lang2;

convert=$(echo $text | sed 's/ /%20/g') #buatinputan spasi

scanskrng $convert $lang1 $lang2 #variable
