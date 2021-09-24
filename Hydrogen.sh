#!/bin/bash

global_user=""
global_dir=""

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'


############################Functions Begin#################################
function install() {
    clear
    count=2
(( ++count )) 
while (( --count >= 0 )); do
  echo "Preparing Install."
    sleep 1s
    clear
    echo "Preparing Install.."
    sleep 1s
    clear
    echo "Preparing Install..."
    sleep 1s
    clear
  sleep 1s
done
    cd
    sudo apt-get update
    
    cd
    proton_installer
    cupp_installer
    eagleeye_installer
    fluxion_installer
    ehtools_installer
    grgsm_installer
    hackingtool_installer
    lscript_installer
    sdrtrunk_installer
    socialbox_installer
    wifite2_installer
    pineapple_installer
    xerosploit_installer
    kalitorify_installer
    myscripts_installer
    encrypt_tool_installer

    sudo apt-get update
    sudo apt-get upgrade

    touch System_Installed
    clear
    echo "The system has been installed successfully."
    sleep 2s
    echo "DO NOT DELETE THE SYSTEM_INSTALLED FILE"
    sleep 5s
    read -p "Reboot now? (y/n): " reboot_opt

    case $reboot_opt in
    y) sudo cover && sudo reboot now ;;
    esac

}

function encrypt_tool_installer() {
    cd $global_dir
    sudo git clone https://github.com/JElchison/encrypt-tool.git
    clear
    echo "Installing Prerequisites..."
    sleep 2s
    sudo apt-get install openssl coreutils gzip
    cd encrypt-tool
    sudo chmod +x encrypt-tool.sh
}

function encrypt_tool() {
    clear
    cd $global_dir/encrypt-tool
    echo " ./encrypt-tool.sh encrypt <plaintextFile> [outputDir]"
    echo "./encrypt-tool.sh decrypt <encryptedFile> <outputFile>"
    sleep 5s

}

function myscripts_installer() {
    clear
    echo "Installing MyScripts from Github"
    sleep 1s
    cd $global_dir
    sudo git clone https://github.com/Fl04t0n/MyScripts.git
}

function proton_installer() {
    clear
    echo "Installing Proton VPN"
    sleep 2s
    cd $global_dir
    sudo wget https://protonvpn.com/download/protonvpn-stable-release_1.0.0-1_all.deb
    sudo dpkg -i protonvpn-stable-release_1.0.0-1_all.deb; sudo apt-get install -f
    sudo apt-get update
    sudo apt-get install protonvpn
    sleep 3s
    echo ""
    echo ""
    clear
    echo "ProtonVPN Installed"
    sleep 3s
}
function proton() {
    clear
    echo "Starting process in new terminal"
    sleep 1s 
    ##sudo -k protonvpn
    #gnome-terminalv--wait -- protonvpn
    #sudo xterm -hold -e 'protonvpn'
    cd $global_dir
    gnome-terminal -- $global_dir/proton_launcher.sh
}

function cupp_installer() {
    clear
    echo "Installing CUPP"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/Mebus/cupp.git
    cd cupp
    sudo chmod +x cupp.py
    clear
    echo "Cupp Installed"
    sleep 2s
}

function cupp() {
    cd $global_dir/cupp
    python3 cupp.py -i
}

function eagleeye_installer() {
    clear
    echo "Installing Eagle Eye"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/ThoughtfulDev/EagleEye.git
    cd EagleEye
    sudo docker build -t eagle-eye
    echo ""
    clear
    echo "Create a 'known' and 'result' folder anywhere on your pc. "
    sleep 1s
    echo "Put the images of the known person in the known folder"
    sleep 1s
    echo "change the name of the person you are searching for in 'entry.sh' "
    sleep 10s
}

function eagleeye() {

    echo "In progress..."
   # sudo docker run -t --net=host --env="DISPLAY" \
   #                        --volume="$HOME/.Xauthority:/root/.Xauthority:rw"  \
   #                        -v  /path/to/known:/EagleEye/known \
   #                        -v  /path/to/result:/result \
   #                        -v /path/to/EagleEye/Repository/entry.sh:/entry.sh \
   #                        eagle-eye
}

function fluxion_installer() {
    clear
    echo "Installing Fluxion"
    cd $global_dir
    sudo git clone https://github.com/FluxionNetwork/fluxion.git
    cd fluxion
    sudo chmod +x fluxion.sh
    gnome-terminal -- sudo $global_dir/fluxion/fluxion.sh
    clear
    echo "Fluxion Installed Successfully"
    sleep 3s
}

function fluxion() {
    cd $global_dir/fluxion
    gnome-terminal -- sudo $global_dir/fluxion/fluxion.sh
}

function ehtools_installer() {
    clear
    echo "Installing ehtools"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/aresmart/ehtools.git
    cd ehtools
    sudo chmod +x install.sh
    sudo chmod +x ehtools
    xterm -hold -e 'sudo ./install.sh'
    clear
    echo "ehtools installed"
    sleep 3s
}

function ehtools() {
    cd $global_dir/ehtools
    sudo ./ehtools
}

function grgsm_installer() {
    cd $global_dir
    sudo git clone https://github.com/ptrkrysik/gr-gsm.git
    cd gr-gsm
    sudo mkdir build
    cd build
    sudo cmake
    sudo mkdir $Home/ .grc_gnuradio/ $HOME/ .gnuradio/
    sudo make
    sudo make install
    sudo ldconfig
    echo ""
    echo ""
    echo ""
    echo "grgsm installed"
    sleep 5s
}

function grgsm() {
    echo "In progress"
    sleep 5s
}

function hackingtool_installer() {
    clear
    echo "Installing Hackingtool"
    cd $global_dir
    sudo git clone https://github.com/Z4nzu/hackingtool.git
    cd hackingtool
    sudo chmod -R 755 hackingtool
    cd hackingtool
    sudo pip3 install -r requirements.txt
    xterm -hold -e 'sudo bash install.sh'
    clear
    echo "Hackingtool Installed"
    sleep 3s
    }

function hackingtool() {
    cd $global_dir/hackingtool
    sudo ./hackingtool
}

function imsi_catcher_installer() {
    echo "in progress"
}
function imsi_catcher() {
    echo "in progress"
}

function lscript_installer() {
    clear
    echo "Installing Lscript"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/arismelachroinos/lscript.git
    cd lscript
    sudo chmod +x install.sh
    xterm -hold -e 'sudo ./install.sh'
    clear
    echo "Lscript Installed"
    sleep 3s
}
function lscript() {
    cd $global_dir/lscript
    xterm -hold -e 'sudo ./l.sh'
}

function sdrtrunk_installer() {
    clear
    echo "Installing SDRTrunk"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/DSheirer/sdrtrunk.git
    clear
    echo "Sdrtrunk Installed"
    sleep 3s

}
function sdrtrunk() {
    echo "in progress"
}

function socialbox_installer() {
    clear
    echo "Installing social box"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/Cyb0r9/SocialBox.git
    cd SocialBox
    sudo chmod +x SocialBox.sh
    sudo chmod +x install-sb.sh
    sudo ./install-sb.sh
    clear
    echo "Installed SocialBox"
    sleep 3s
}
function socialbox() {
    cd $global_dir/SocialBox
    sudo ./SocialBox.sh
}

function wifite2_installer() {
    clear
    echo "Installing Wifite2"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/derv82/wifite2.git
    cd wifite2
    sudo chmod +x wifite.py
    clear
    echo "Installed wifite2"
    sleep 3s
}
function wifite2() {
    cd $global_dir/wifite2
    sudo ./Wifite.py
}

function pineapple_installer() {
    clear
    echo "installing wifi pineapple software"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/hak5darren/wp6.git
    cd $global_dir
    sudo git clone https://github.com/hak5/mk7-modules.git
    clear
    cd wp6
    sudo chmod +x wp6.sh
    echo "Pineapple software installed"
    sleep 3s
}

function pineapple() {
    cd $global_dir/wp6
    sudo chmod +x wp6.sh
    sudo ./wp6.sh
}

function xerosploit_installer() {
    clear
    echo "Installing xerosploit"
    sleep 2s
    cd $global_dir
    sudo git clone https://github.com/LionSec/xerosploit.git
    cd xerosploit
    xterm -hold -e 'sudo python install.py'
    clear
    echo "Xerosploit Installed"
    sleep 3s
}
function xerosploit() {
    cd $global_dir/xerosploit
    sudo ./xerosploit
}

function kalitorify_installer() {
    cd $global_dir
    sudo git clone https://github.com/brainfucksec/kalitorify.git
    sudo apt-get update && sudo apt-get dist-upgrade -y
    sudo apt-get install -y tor curl
    sudo apt-get install torbrowser-launcher
    cd kalitorify
    sudo make install

}

function kalitorify() {
    clear
    echo "Encrypt and route all traffic through Tor proxy"
    echo "_______________________________________________"
    echo ""
    echo "1. Start Proxy"
    echo "2. Stop Proxy"
    nav
    echo ""
    read -p "Option: " toropt

    case $toropt in
    1) sudo kalitorify --tor ; security_menu ;;
    2) sudo kalitorify --clearnet ; security_menu ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    esac
}

function kalitorify_security() {
    clear
    echo "Encrypt and route all traffic through Tor proxy"
    echo "_______________________________________________"
    echo ""
    echo "1. Start Proxy"
    echo "2. Stop Proxy"
    nav
    echo ""
    read -p "Option: " toropt

    case $toropt in
    1) sudo kalitorify --tor ; security_menu ;;
    2) sudo kalitorify --clearnet ; security_menu ;;
    b) security_menu ;;
    q) cover_and_leave ;;
    esac
}

function torbrowser() {
   sudo -u $global_user torbrowser-launcher
}

function payload() {
    clear
    cd $global_dir/MyScripts/Payload_Generator
    sudo chmod +x autometer.sh && sudo chmod +x listener.sh
    sudo ./autometer.sh
}

function antivirus() {
    clear
    cd $global_dir/MyScripts
    sudo chmod +x Antivirus.sh
    sudo ./Antivirus.sh
}

function cover() {
    clear 
    cd $global_dir/MyScripts
    sudo chmod +x cover_tracks.sh
    sudo ./cover_tracks.sh
}

function mac_changer() {
    clear
    cd $global_dir/MyScripts
    sudo chmod +x MacSpoof
    sudo ./MacSpoof
}

function freecad() {
    echo "work in progress"
}
function sdr_tools() {
    echo "work in progress"
}

function shutdown_cover() {
    echo "________________________________________"
    echo "covering your tracks"
    sleep 1s
    echo "Erasing /var/log/auth.log"
    echo "" /var/log/auth.log
    echo "Done"
    echo "Erasing bash history..."
    echo "" ~/.bash_history
    rm ~/.bash_history -rf
    history/ -c
    sudo shred -zu /root/.zsh_history
    echo "Done"
    echo "Cleaning up..."
    export HISTFILESIZE=0
    export HISTSIZE=0
    unset HISTFILE
    sleep 0.5
    echo "~~Tracks Covered~~"
    sleep 1s
    shutdown now
}

function logo() {
    echo "╔╗─╔╗─────╔╗──────  ─  ─"
    echo "║║─║║─────║║──────────── ─  ─"
    echo "║╚═╝╠╗─╔╦═╝╠═╦══╦══╦══╦═╗ ─  ─"
    echo "║╔═╗║║─║║╔╗║╔╣╔╗║╔╗║║═╣╔╗╗─────── ─  ─"
    echo -e "\033[0;31m║║─║║╚═╝║╚╝║║║╚╝║╚╝║║═╣║║║──── ─"
    echo -e "\033[0;31m╚╝─╚╩═╗╔╩══╩╝╚══╩═╗╠══╩╝╚╝─ ─"
    echo -e "\033[0;31m────╔═╝║────────╔═╝║─────────── ─  ─"
    echo -e "\033[0;31m────╚══╝────────╚══╝  ── ─\033[0m"
}

function security_menu() {
    clear
    logo
    echo "Security Menu"
    echo "________________________"
    echo "1. ProtonVPN"
    echo "2. Antivirus"
    echo "3. Cover My Tracks"
    echo "4. Mac Changer"
    echo "5. kalitorify"
    echo "6. encrypt-tool"
    nav
    echo ""
    read -p "Option: " opt2

    case $opt2 in
    1) proton ; security_menu ;;
    2) antivirus; security_menu ;;
    3) cover; security_menu ;;
    4) mac_changer; security_menu ;;
    5) kalitorify_security; security_menu ;;
    6) encrypt_tool ; security_menu ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;
    esac
}

function hacks() {
    clear
    logo
    echo "Hax Menu"
    echo "________________________________________"
    echo "1. Payload_Generator"
    echo "2. CUPP"
    echo "3 EagleEye"
    echo "4. Fluxion"
    echo "5. ehtools"
    echo "6. gr-gsm"
    echo "7. hackingtool"
    echo "8. IMSI-catcher"
    echo "9. lscript"
    echo "10. sdrTrunk"
    echo "11. SocialBox"
    echo "12. wifite2"
    echo "13. WiFi Pineapple"
    echo "14. xerosploit"
    nav
    echo ""
    read -p "option: " opt3

    case $opt3 in
    1) payload; hacks ;;
    2) cupp; hacks ;;
    3) eagleeye; hacks ;;
    4) fluxion; hacks ;;
    5) ehtools; hacks ;;
    6) grgsm; hacks ;;
    7) hackingtool; hacks ;;
    8) imsi_catcher; hacks ;;
    9) lscript; hacks ;;
    10) sdrtrunk; hacks ;;
    11) socialbox; hacks ;;
    12) wifite2; hacks ;;
    13) pineapple; hacks ;;
    14) xerosploit; hacks ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;

    esac
}

function other() {
    clear
    logo
    echo "Non-malicious tools menu"
    echo "_________________________________________"
    echo "1. FreeCad"
    echo "2. SDR Tools (Gqrx)"
    nav
    echo ""
    read -p "option: " opt4

    case opt4 in
    1) freecad; other ;;
    2) sdr_tools; other ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;
    esac
}

function adv1() {
    clear
    read -p "Working Directory Path: " working_dir
    global_dir=$working_dir
    echo "Working Directory Changed"
}

function adv2() {
    clear
    logo
    echo "Manual Install"
    echo "______________________________________________"
    echo ""
    echo "1. ProtonVPN       11. Wifite2"
    echo "2. cupp            12. Wifi Pineapple"
    echo "3. EagleEye        13. xerosploit"
    echo "4. Fluxion         14. kalitorify"
    echo "5. ehtools         15. MyScripts"
    echo "6. grgsm           16. encrypt-tool"
    echo "7. hackingtool"
    echo "8. lscript         17. FULL SYSTEM INSTALL"
    echo "9. sdrtrunk"
    echo "10. socialbox"
    nav
    echo ""
    read -p "Select a program: " program_select

    case $program_select in
    1) proton_installer; adv2 ;;
    2) cupp_installer; adv2;;
    3) eagleeye_installer; adv2 ;;
    4) fluxion_installer; adv2 ;;
    5) ehtools_installer; adv2 ;;
    6) grgsm_installer; adv2 ;;
    7) hackingtool_installer; adv2 ;;
    8) lscript_installer; adv2 ;;
    9) sdrtrunk_installer; adv2 ;;
    10) socialbox_installer; adv2 ;;
    11) wifite2_installer; adv2 ;;
    12) pineapple_installer; adv2 ;;
    13) xerosploit_installer; adv2 ;;
    14) kalitorify_installer; adv2 ;;
    15) myscripts_installer; adv2 ;;
    16) encrypt_tool_installer; adv2 ;;
    17) install ;;
    b) advanced ;;
    q) cover_and_leave ;;
    m) main_menu2
    esac

}
function advanced() {
    clear
    logo
    echo ""
    echo "Advanced Options"
    echo ""
    echo "1. Change working directory"
    echo "2. Manual Install"
    nav
    echo ""
    read -p "Option: " adv_opt

    case $adv_opt in
    1)adv1; main_menu2 ;;
    2)adv2; advanced ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2
    esac
}

function network_manager() {
    clear
    echo "1. Network Manager > OFF"
    echo "2. Network Manager > ON"
    nav
    echo ""
    read -p "Option: " managed_sw

    case $managed_sw in
    1) sudo service NetworkManager stop; main_menu2;;
    2) sudo service NetworkManager start; main_menu2;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;
        esac
}

function cover_and_leave() {
    echo "________________________________________"
    echo "covering your tracks"
    sleep 1s
    echo "Erasing /var/log/auth.log"
    echo "" /var/log/auth.log
    echo "Done"
    echo "Erasing bash history..."
    echo "" ~/.bash_history
    rm ~/.bash_history -rf
    history/ -c
    sudo shred -zu /root/.zsh_history
    echo "Done"
    echo "Cleaning up..."
    export HISTFILESIZE=0
    export HISTSIZE=0
    unset HISTFILE
    sleep 0.5
    echo "~~Tracks Covered~~"
    sleep 1s
    
       
    exit
}

function nav() {
    echo -e "\033[1;37m- - - - - - - - - - - - - - - - - - "
    echo -e "q: Quit   b: Back   m: Main Menu\033[0m"
}

function reload() {
    $global_dir/Desktop/Hydrogen.sh
}

main_menu() {
    clear
    logo
    echo ""
    echo "Type 'install' For Full System Install"
    echo "*Typing 'bypass' will skip the full install"
    echo ""
    echo "***Make sure to use q to exit as extra security measure***"
    echo "- - -"
    echo ""
    read -p "Command: " opt1

    case $opt1 in
    install) install ; main_menu2 ;;
    bypass) main_menu2 ;;
    esac
}

main_menu2() {
    clear
    logo
    echo ""
    echo -n -e "\033[0;34mWelcome, " && echo $global_user
    echo -e "Working directory set to:\033[0;31m" $global_dir #&& echo -n "/home/" && echo $global_user
    echo -e "\033[0m_______________________________________________________________________"
    echo ""
    echo "1. ProtonVPN                   6. Security"
    echo "2. Kalitorify                  7. Hax Scripts"
    echo "3. TorBrowser                  8. Other tools"
    echo "4. Network Switch              9. Advanced"
    echo "5. Cleanup                     10. Shutdown"
    if [ -f "$global_dir/System_Installed" ]
        then
    echo ""
        else
    echo ""
    echo -e "\033[0;31m***SETUP INCOMPLETE. TYPE 'INSTALL' FOR FULL SYSTEM INSTALL***\033[0m"
    fi
    echo -e "\033[1;37m- - - - - - - - - - - - - - - - - - "
    echo -e "q: Quit\033[0m"
    echo ""
    read -p "Option: " opt_menu2

    case $opt_menu2 in
    1) proton; main_menu2 ;;
    2) kalitorify; main_menu2 ;;
    3) torbrowser; main_menu2 ;;
    4) network_manager; main_menu2 ;;
    5) cover; main_menu2 ;;
    6)security_menu ; main_menu2 ;;
    7)hacks ; main_menu2 ;;
    8)other ; main_menu2 ;;
    9) advanced ;;
    10) shutdown_cover ;;
    q) cover_and_leave ;;
    4) reload ;;
    INSTALL) install ;;
    install) install ;;
    m) main_menu2 ;;
    esac

}

function loading() {
    clear
    echo "╔╗─╔╗─────╔╗"
    sleep 0.5s
    echo "║║─║║─────║║"
    sleep 0.5s
    echo "║╚═╝╠╗─╔╦═╝╠═╦══╦══╦══╦═╗"
    sleep 0.5s
    echo -e "║╔═╗║║─║║╔╗║╔╣╔╗║╔╗║║═╣╔╗╗       \033[0;31m~~The quieter you become~~\033[0m"
    sleep 0.5s
    echo -e "\033[0m║║─║║╚═╝║╚╝║║║╚╝║╚╝║║═╣║║║         \033[0;31m~    ~~The more you are able to hear~~\033[0m"
    sleep 0.5s
    echo -e "\033[0m╚╝─╚╩═╗╔╩══╩╝╚══╩═╗╠══╩╝╚╝"
    sleep 0.5s
    echo -e "\033[0m────╔═╝║────────╔═╝║                     \033[0;31m     << BackTrack <<\033[0m"
    sleep 0.5s
    echo -e "\033[0m────╚══╝────────╚══╝   Version 1.0 BETA"
    echo -e "\033[0mDeveloped by Flyaway"
    echo ""
    sleep 0.5s
}


######################################################################################################
#Runtime


loading
echo -n -e "\033[0;34mEnter Linux Username:\033[0m" && read -p " " kaliuser
global_user=$kaliuser
global_dir="/home/"$global_user
echo -n -e "\033[0;31mChecking installed software in \033[0m" && echo $global_dir
if [ -f "$global_dir/System_Installed" ]
then
sleep 2s
main_menu2
else
main_menu
fi