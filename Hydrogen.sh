#!/bin/bash

global_user=""
global_dir=""
current_program=""

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

#Install ALL Software:
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
    cd $global_dir
    sudo apt-get update
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
    b2e_installer

    sudo apt-get update
    sudo apt-get upgrade
    cd $global_dir
    touch System_Installed
    clear
    echo "The system has been installed successfully."
    sleep 2s
    echo "DO NOT DELETE THE SYSTEM_INSTALLED FILE"
    sleep 5s
    read -p "Please type 'UNDERSTOOD' to advance" agree
    
        if ["UNDERSTOOD"==$agree]
    then
        read -p "Reboot now? (y/n): " reboot_opt

        case $reboot_opt in
            y) sudo cover && sudo reboot now ;;
            n) echo "You will need to reboot eventually. I got you ;)"; sleep 3s; sudo reboot now ;;
        esac
        fi

}

function b2e_installer() {
    sudo git clone https://github.com/tokyoneon/B2E.git
    #cd $global_dir/B2E/
}

function pentesting_tools() {
    sudo git clone https://github.com/aquario-crypto/Pentesting_Toolkit.git
    cd $global_dir/Pentesting_Toolkit

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
    logo
    cd $global_dir/encrypt-tool

    read -p "Would you like to 'encrypt' or 'decrypt' ? > " enc_opt

    case $enc_opt in

        encrypt)
            read -p "Drag file to encrypt here > " file
            read -p "Output Directory > " out_dir
            ./encrypt-tool.sh encrypt $file $out_dir
            echo Done!
            sleep 2s
        ;;

        decrypt)
            read -p "Drag file to decrypt here > " file_d
            read -p "Output File > " out_file
            sudo ./encrypt-tool.sh decrypt $file_d $out_file
            echo Done!
            sleep 2s
        ;;
    esac
 #   echo " ./encrypt-tool.sh encrypt <plaintextFile> [outputDir]"
#    echo "./encrypt-tool.sh decrypt <encryptedFile> <outputFile>"

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
    current_program="/usr/bin/protonvpn"
    app_check
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
    current_program="$global_dir/cupp/cupp.py"
    app_check
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
    current_program="$global_dir/fluxion/fluxion.sh"
    app_check
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
    current_program="$global_dir/ehtools/ehtools"
    app_check
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
    current_program="$global_dir/hackingtool/hackingtool"
    app_check
    cd $global_dir/hackingtool
    sudo hackingtool
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
    current_program="$global_dir/lscript/l"
    app_check
    cd $global_dir/lscript
    #xterm -hold -e 'sudo ./l'
    gnome-terminal -- sudo ./l
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
    current_program="$global_dir/SocialBox/SocialBox.sh"
    app_check
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
    current_program="$global_dir/wifite2/Wifite.py"
    app_check
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
    current_program="$global_dir/wp6/wp6.sh"
    app_check
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
    current_program="$global_dir/xerosploit/xerosploit"
    app_check
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
    read -p "Hydro > " toropt

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
    read -p "Hydro > " toropt

    case $toropt in
    1) sudo kalitorify --tor ; security_menu ;;
    2) sudo kalitorify --clearnet ; security_menu ;;
    b) security_menu ;;
    q) cover_and_leave ;;
    esac
}

function torbrowser() {
    current_program="/usr/bin/torbrowser-launcher"
    app_check
   sudo -u $global_user torbrowser-launcher
}

function payload() {
    clear
    cd $global_dir/MyScripts/Payload_Generator
    sudo chmod +x autometer.sh && sudo chmod +x listener.sh
    sudo ./autometer.sh
}

#!/bin/bash

function logo_g() {
echo -e "\033[0;34m          |             "
echo "          |             "
echo "          O             "
echo "   \    /   \   /      "
echo "    \  /     \ /       "
echo "      O       O         "
echo -e " \033[0;34m     |       |    \033[0;32mGrapheneOS Security    "
echo -e "  \033[0;34m    |       |          "
echo -e "  \033[0;34m    O       O         "
echo -e "     /  \    / \         \033[0;32mFree your Pixel >>    "
echo -e " \033[0;34m   /    \  /   \      "
echo "          O             "
echo "          |             "
echo -e "          |       \033[1;31m                    Coded by ~flyaway~      "
echo -e "\033[1;37m---------------------------------------------------------"
}

function flash_process() {
    echo "Please boot phone into recovery"
    echo "**Reboot and then hold volume down until you're in recovery"
    read -n 1 -s -r -p "Press any key when your phone is connected and in recovery"
    clear
    echo "Unlocking Bootloader. . ."
    fastboot flashing unlock

    echo "Downloading verification key. . ."
    curl -O https://releases.grapheneos.org/factory.pub

    read -p "Drag .zip firmware package here > " frmware_path
    signify -Cqp factory.pub -x  $frmware_path && echo verified
    sleep 3s
    echo "Make sure it says 'verified'"

    echo "Extracting Image. . ."
    bsdtar xvf $frmware_path
    read -p "Drag extracted firmware folder here > " extracted_frmware

    echo "Flashing. . ."
    cd $extracted_frmware
    ./flash-all.sh
    read -n 1 -s -r -p "Press any key when your phone is back in recovery/bootloader"

    echo "Complete. Re-Locking Bootloader. . ."
    fastboot flashing lock
    sleep 5s

    clear
    logo
    echo "Congradulations! You are free to reboot and setup your new device. Enjoy GrapheneOS"
}

function menu_g() {
    clear
logo_g
    echo "Which Pixel are you flashing? "
    echo "|Pixel 3 (blueline)            | Pixel 4 (flame)         | 9. Pixel 5 (redfin)" 
    echo "|Pixel 3 XL (crosshatch)       | Pixel 4 XL (coral)      | 10.Pixel 5a (barbet)" 
    echo "|Pixel 3a (sargo)              | Pixel 4a (sunfish)                  " 
    echo "|Pixel 3a XL (bonito)          | Pixel 4a 5G (bramble)               "
    echo "                                                         |Manual Unlock Bootloader: 'unlock'"
    echo "|Main Menu (m)                                           |Manual Lock Bootloader: 'lock'"
    
}

function options() {
    read -p "Codename or option > " pixel_model
    case $pixel_model in

    unlock)
        fastboot flashing unlock; menu_g; options ;;
    lock)
        fastboot flashing lock; menu_g; options ;;
    m) main_menu2
    esac


    read -p "Select Firmware Version (ex. 2021.06.09.13) > " date_picked
    read -p "Enter Install Directory > " global_dir
    clear

    echo -e "\033[0;31m'Please ensure that 'OEM unlocking' and 'USB Debugging' are enabled"
    sleep 5s


      echo "Downloading GrapheneOS. . ."
    sleep 2s

    curl -O https://releases.grapheneos.org/$pixel_model-factory-$date_picked.zip
    curl -O https://releases.grapheneos.org/$pixel_model-factory-$date_picked.zip.sig

    echo "Checking for platform-tools. . ."

    if [ -d "$global_dir/platform-tools" ]
then
    echo "Tools exist"
    sleep 3s

    flash_process
else
    echo "Tools don't exist"
    sleep 2s
    echo "Installing . . ."
    cd $global_dir
    sudo apt install libarchive-tools
    curl -O https://dl.google.com/android/repository/platform-tools_r31.0.3-linux.zip
    echo 'e6cb61b92b5669ed6fd9645fad836d8f888321cd3098b75588a54679c204b7dc  platform-tools_r31.0.3-linux.zip' | sha256sum -c
    bsdtar xvf platform-tools_r31.0.3-linux.zip

    echo "Adding to PATH. . ."
    export PATH="$PWD/platform-tools:$PATH"

    echo "Installing signify. . ."
    sudo apt install signify-openbsd
    alias signify=signify-openbsd

    echo "Script can continue"
    sleep 2s
    flash_process
fi
}

function graphene_installer() {
    logo_g
    menu_g
    options


echo "Script complete! For issues or to attempt manual CLI install,"
echo "visit https://grapheneos.org/install/cli"

}




function anti_logo() {
echo "     _          _   _       _                "
echo "    / \   _ __ | |_(_)_   _(_)_ __ _   _ ___ "
echo "   / _ \ | '_ \| __| \ \ / / | '__| | | / __| "
echo "  / ___ \| | | | |_| |\ V /| | |  | |_| \__ \ "
echo " /_/   \_\_| |_|\__|_| \_/ |_|_|   \__,_|___/ "
}

function antivirus() {
clear
anti_logo
                                            
echo ""
echo ""
echo "1. Rootkit Detection"
echo "2. AIDE"
echo "3. LogCheck"
echo "4. TOP"
echo "5. Network Connections"
echo "6. Block IP/Port"
echo "7. Enable IP Forwarding"
echo "8. Disable IP Forwarding"
echo "9. Login/Shutdown History"
echo ""
read -p "Option: " option

case $option in

1)
clear
echo "Checking via chkrootkit"
sudo chkrootkit
sleep 5s
echo "Checking via rkhunter"
sudo rkhunter --check
echo ""
echo "Scan Complete"
;;

2)
clear
anti_logo
echo ""
echo ""
aide
;;

3)
clear
anti_logo                                     
echo ""
echo ""
sudo -u logcheck
;;

4)
clear
#xterm -e top
#xterm -e htop
htop
;;

5)
clear
anti_logo                                   
echo ""
echo ""
watch ss -tp
;;

6)
clear
anti_logo                                         
echo ""
echo ""
read -p "IP to block: " ip_usr
read -p "Port to block: " port_usr
tcpkill host $ip_usr and port $port_usr
;;

7)
clear
anti_logo
                                            
echo ""
echo ""
echo "Enabling IPV4 Forwarding..."
echo "1" /proc/sys/net/ipv4/ip_forward
;;

8)
clear
anti_logo                                  
echo ""
echo ""
echo "Disabling IPV4 Forwarding..."
echo "0" /proc/sys/net/ipv4/ip_forward
;;


9)
clear
anti_logo                               
echo ""
echo ""
echo "User History"
sleep 3s
last -a
;;

esac

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

function diagnos_net() {
    echo -e "\033[1;37m-------------------------------------------"
    sudo ifconfig
    sudo service NetworkManager stop
    sleep 5s
    sudo service NetworkManager start
    sleep 5s
    sudo service NetworkManager restart
    echo complete...
    echo "\033[0m"
    main_menu2
}

function iso() {
    clear
    logo
    echo ""
    sudo fdisk -l
    echo ""
    read -p "USB Device (/dev/sdb1) > " $usb_dev
    read -p "ISO Location > " $iso_location

    clear
    logo
    echo ""
    echo "$usb_dev selected. Unmounting. . ."
    sleep 2s
    sudo umount $usb_dev
    sleep 2s
    
    clear
    logo
    echo ""
    echo "Writing Image. . ."
    sleep 1s
    sudo dd if=$iso_location of=$usb_dev
    read -n 1 -s -r -p "Press any key when done with results"


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

function img_decrypt() {
    cd $global_dir
    xterm -hold -e '$gloaldir/Cryptogram-Companion-0.2.3-x86_64.AppImage'
}

function logo() {
    echo -e "\033[0;32m╔╗─╔╗─────╔╗──────  ─  ─"
    echo "║║─║║─────║║──────────── ─  ─"
    echo "║╚═╝╠╗─╔╦═╝╠═╦══╦══╦══╦═╗ ─  ─"
    echo "║╔═╗║║─║║╔╗║╔╣╔╗║╔╗║║═╣╔╗╗─────── ─  ─"
    echo -e "\033[0;31m║║─║║╚═╝║╚╝║║║╚╝║╚╝║║═╣║║║──── ─"
    echo -e "\033[0;31m╚╝─╚╩═╗╔╩══╩╝╚══╩═╗╠══╩╝╚╝─ ─"
    echo -e "\033[0;31m────╔═╝║────────╔═╝║─────────── ─  ─"
    echo -e "\033[0;31m────╚══╝────────╚══╝  ── ─\033[0m"

    #echo "╔╗─╔╗─────╔╗──────  ─  ─                    +  :      ."
    #echo "║║─║║─────║║──────────── ─  ─                        :       _   " 
    #echo "║╚═╝╠╗─╔╦═╝╠═╦══╦══╦══╦═╗ ─  ─                   .   !   '  (_)  "
    #echo "║╔═╗║║─║║╔╗║╔╣╔╗║╔╗║║═╣╔╗╗─────── ─  ─             ,|.'         "
    #echo "║║─║║╚═╝║╚╝║║║╚╝║╚╝║║═╣║║║──── ─          -  -- ---(-O-'--- --  - " 
    #echo "╚╝─╚╩═╗╔╩══╩╝╚══╩═╗╠══╩╝╚╝─ ─                       ,| '.      :  "  
    #echo "────╔═╝║────────╔═╝║─────────── ─  ─             ,   !    .  --+--  "  
    #echo "────╚══╝────────╚══╝  ── ─                             :         !   "

    
}

function security_menu() {
    clear
    logo
    echo "Security Menu"
    echo "________________________"
    #echo "1. ProtonVPN"
    echo "1. Antivirus"
    #echo "3. Cover My Tracks"
    echo "2. Mac Changer"
    #echo "5. kalitorify"
    echo "3. encrypt-tool"
    echo "4. CryptoCamera Decrypter/Key Generator"
    echo "5. Graphene OS Install Script"
    nav
    echo ""
    read -p "Hydro > " opt2

    case $opt2 in
    #1) proton ; security_menu ;;
    1) antivirus; security_menu ;;
    #3) cover; security_menu ;;
    2) mac_changer; security_menu ;;
    #5) kalitorify_security; security_menu ;;
    3) encrypt_tool ; security_menu ;;
    5) graphene_installer; security_menu ;;
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
    echo "2. DIY Password List - cupp"
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
    echo "15. Airgeddon"
    nav
    echo ""
    read -p "Hydro > " opt3

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
    15) airgeddon ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;

    esac
}

function metadata() {
    clear
    logo
    read -p "Input Image Path > " img_user
    clear
    logo
    echo -n "Image set to " && echo $img_user
}

function other() {
    clear
    logo
    echo "Non-malicious tools menu"
    echo "_________________________________________"
    echo "1. FreeCad"
    echo "2. SDR Tools (Gqrx)"
    echo "3. EXIF"
    nav
    echo ""
    read -p "Hydro > " opt4

    case $opt4 in
    1) freecad; other ;;
    2) sdr_tools; other ;;
    3) metadata; other ;;
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
    read -p "Hydro > " adv_opt

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
    read -p "Hydro > " managed_sw

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

function payload_tool() {
    clear
    logo
    echo ""
    echo "1. Start Veil"
    echo "2. Bat>Exe Editor"
    nav
    echo ""
    read -p "Hydro > " payload_opt

    case $payload_opt in
    1) veil; payload_tool ;;
    2) gnome-terminal -- wine $global_dir/B2E/Bat_To_Exe_Converter/installer.exe; payload_tool ;;
    b) main_menu2 ;;
    q) cover_and_leave ;;
    m) main_menu2 ;;
    esac
}

function nav() {
    echo -e "\033[1;37m- - - - - - - - - - - - - - - - - - "
    echo -e "q: Quit   b: Back   m: Main Menu\033[0m"
}

function reload() {
    $global_dir/Desktop/Hydrogen.sh
}

function network_tools() {
    echo "hello"
}

main_menu() {
    clear
    logo
    echo ""
    echo "Type 'install' For Full System Install"
    echo "*Typing 'bypass' will skip the full install"
    echo ""
    echo ""
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
    echo -e "\033[0m.______________________________________________________________________."
    echo "|                                                                      |"
    echo "|  1. | ProtonVPN                   8. | Security                      |"
    echo "|  2. | Kalitorify                  9. | Hax Scripts                   |"
    echo "|  3. | TorBrowser                  10.| Other tools                   |"
    echo "|  4. | Network Switch              11.| Advanced                      |"
    echo "|  5. | Cleanup                     12.| Network Diagnos               |"
    echo "|  6. | DIY Backdoor                13.| ISO > USB                     |"
    echo "|  7. | Local Network Tools                                            |"

    echo ".----------------------------------------------------------------------."
    if [ -f "$global_dir/System_Installed" ]
        then
    echo ""
        else
    echo ""
    echo -e "\033[0;31m***SETUP INCOMPLETE. TYPE 'INSTALL' FOR FULL SYSTEM INSTALL***\033[0m"
    fi
    echo -e "\033[1;37m- - - - - - - - - - - - - - - - - - "
    echo -e "q: Quit  l: Lock \033[0m   \033[0;31ms: Shutdown\033[0m"
    echo ""
    read -p "Hydro > " opt_menu2

    case $opt_menu2 in
    1) proton; main_menu2 ;;
    2) kalitorify; main_menu2 ;;
    3) torbrowser; main_menu2 ;;
    4) network_manager; main_menu2 ;;
    5) cover; main_menu2 ;;
    6) payload_tool; main_menu2 ;;
    7) network_tools; main_menu2 ;; 
    8) security_menu ; main_menu2 ;;
    9) hacks ; main_menu2 ;;
    10) other ;;
    11) advanced ;;
    12) diagnos_net; main_menu2 ;;
    13) iso; main_menu2 ;;
    s) shutdown_cover ;;
    q) cover_and_leave ;;
    4) reload ;;
    INSTALL) install ;;
    install) install ;;
    m) main_menu2 ;;
    l) clear; loading; startup ;;
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
    echo -e "\033[0m────╚══╝────────╚══╝   Version 2.0 BETA"
    echo -e "\033[0mDeveloped by Flyaway"
    echo ""
    sleep 0.5s
}

function startup() {
echo -n -e "\033[0;34mEnter Linux Username >\033[0m" && read -p " " kaliuser
global_user=$kaliuser
global_dir="/home/"$global_user
global_dir=$global_dir"/hydrogen"
echo "$global_dir"
sleep 10s
echo -n -e "\033[0;31mNecessary files found in \033[0m" && echo $global_dir


if [ -f "$global_dir/System_Installed" ]
then
sleep 2s
main_menu2
else
main_menu
fi
}

function app_check() {
    if [ -f "$current_program" ]
then
    echo "Program Installed"
else
    read -p "Program not installed. Would you like to go to install menu? (y/n) > " inst_opt

case $inst_opt in
y)
adv2;;
n)
main_menu2;;
esac
fi
}

######################################################################################################
#Runtime

ROOT_UID=0

if [ "$UID" -eq "$ROOT_UID" ]
then
    clear
    echo "Script run as root"
    sleep 1s
    echo "Please don't do that again :'("
    read -n 1 -s -r -p "Press any key to continue... "
    echo "Goodbye !!"
    sleep 2s
    exit 0
else
    loading
    startup
fi
