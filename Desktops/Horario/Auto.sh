#!/bin/bash

InstallGeogebra(){
    LINKGEO="https://www.geogebra.org/download/deb.php?arch=amd64&ver=6"
    NOMBRE="geogebra.deb"

    wget -O $NOMBRE $LINKGEO
    sudo dpkg -i $NOMBRE
    sudo apt -f install
    sudo sysctl kernel.unprivileged_userns_clone=1

    rm $NOMBRE 1> /dev/null
    sleep 1
    clear
    echo "Geogebra Instalado Exitorsamente"
    sleep 1
}

InstallGCompris(){
    LINKGC="https://gcompris.net/download/qt/linux/gcompris-qt-1.0-Linux64.sh"
    NOMBRE="GCompris.sh"

    wget -O $NOMBRE $LINKGC
    sudo chmod u+x $NOMBRE
    sudo ./$NOMBRE
    sudo dpkg --configure -a
    sudo apt-get install –reinstall libxcb-xinerama0e

    rm $NOMBRE 1> /dev/null
    sleep 1
    clear
    echo "GCompris Instalado Exitorsamente"
    sleep 1
}

InstallZoom(){
    LINKZOOM="https://zoom.us/client/latest/zoom_amd64.deb"
    NOMBRE="zoom.deb"

    wget -O $NOMBRE $LINKZOOM
    sudo dpkg -i $NOMBRE
    sudo apt -f install
    rm $NOMBRE 1> /dev/null

    sleep 1
    clear
    echo "Zoom Instalado Exitorsamente"
    sleep 1
}

InstallAnki(){
    LINKANKI="https://github.com/ankitects/anki/releases/download/2.1.38/anki-2.1.38-linux.tar.bz2"
    NOMBRE="anki.tar.bz2"
    tar="anki-2.1.38-linux"

    wget -O $NOMBRE $LINKANKI
    tar xjf $NOMBRE
    cd $tar
    sudo ./install.sh
    cd ..
    sudo apt-get install –reinstall libxcb-xinerama0
    sudo rm -r $tar 1> /dev/null
    rm $NOMBRE 1> /dev/null

    sleep 1
    clear
    echo "Anki Instalado Exitorsamente"
    sleep 1
}

InstallQalculate(){
    sudo apt-get update 1> /dev/null
    sudo apt install qalculate-gtk 
    sleep 1
    clear
    echo "Qalculate Instalado Exitorsamente"
    sleep 1
}

InstallTraslateShell(){
    LINKCT="https://github.com/soimort/translate-shell"
    NOMBRE="translate-shell"

    git clone $LINKCT $NOMBRE
    cd $NOMBRE
    make
    sudo make install
    cd ..
    sudo rm -r $NOMBRE 1> /dev/null
    sleep 1
    clear
    echo "Traslate Shell Instalado Exitorsamente"
    sleep 1
}

InstallTelegram(){
    LINKTG="https://telegram.org/dl/desktop/linux"
    NOMBRE="telegram-deskop.tar.xz"
    NOMBREAPP="Telegram"

    wget -O $NOMBRE $LINKTG

    tar -Jxvf $NOMBRE

    sudo mv $NOMBREAPP /opt/
    
    sleep 1
    clear
    echo "Telegram Instalado Exitorsamente"
    sleep 1
}

InstallHorario(){
    chmod +x
}

InstallGit(){
    sudo apt-get install git 
    sleep 1
    clear
    echo "Git Instalado Exitorsamente"
    sleep 1
}

InstallWget(){
    sudo apt-get install wget
    sleep 1
    clear
    echo "Wget Instalado Exitorsamente"
    sleep 1
}

InstallUnrar(){
    sudo apt-get install unrar-free
    sleep 1
    clear
    echo "Unrar Instalado Exitorsamente"
    sleep 1
}

InstallZip(){
    sudo apt-get install zip unzip
    sleep 1
    clear
    echo "Unzip Instalado Exitorsamente"
    sleep 1
}

InstallCopilador(){
    sudo apt-get install build-essential linux-source bc kmod cpio flex libncurses5-dev libelf-dev libssl-dev
    sleep 1
    clear
    echo "Compilador Instalado Exitorsamente"
    sleep 1
}

MenuTools(){
    clear
    echo
    echo "+----------------------------------+"
    echo "|              Extras              |"
    echo "+----------------------------------+"
    echo "|[1] Git                           |"
    echo "|[2] wget                          |"
    echo "|[3] Unrar                         |"
    echo "|[4] Zip y UnZip                   |"
    echo "|[5] Compilador codigo fuente      |"
    echo "|[6] Todos los programa anteriores |"    
    echo "|[7] Regresar                      |"
    echo "+----------------------------------+"
    echo
    read -p "Selecciona una Opcion: " m1
    echo
    case $m1 in
        1)
            InstallGit
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        2)
            InstallWget
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        3)
            InstallUnrar
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        4)
            InstallZip
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        5)
            InstallCopilador
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        6)
            InstallGit
            InstallWget
            InstallUnrar
            InstallZip
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                MenuTools
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        7)
            Menu
        ;;
        *)
            clear
            echo 
            echo "Opcion Inconrrecta"
            sleep 1
            MenuTools
        ;;
    esac
}

Menu(){
    clear
    git clone https://github.com/SHAKA-117/Materials.git Materials 2> /dev/null
    sudo apt-get update -y 1> /dev/null
    read -p "Sistema Actualizado Presione [Enter]" msg
    echo
    echo "+------------------------------------+"
    echo "|            Herramientas            |"        
    echo "+------------------------------------+"
    echo "|[1] Extensiones para la Instalacion |"
    echo "|[2] Geogebra                        |"
    echo "|[3] GCompris                        |"
    echo "|[4] Anki                            |"
    echo "|[5] Qalculate                       |"
    echo "|[6] Translate Shell                 |"
    echo "|[7] Zoom                            |"
    echo "|[8] Telegram                        |"
    echo "|[9] Todos los programas anteriores  |"
    echo "|[10] Salir                          |"
    echo "+------------------------------------+"
    echo
    read -p "Selecciona una Opcion: " m2
    echo
    case $m2 in
        1)
            MenuTools
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        2)
            InstallGeogebra
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        3)
            InstallGCompris
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        4)
            InstallAnki
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        5)
            InstallQalculate
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        6)
            InstallTraslateShell
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        7)
            InstallZoom
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        8)
            InstallTelegram
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        9)
            InstallGeogebra
            InstallGCompris
            InstallAnki
            InstallQalculate
            InstallTraslateShell
            InstallZoom
            InstallTelegram
            echo 
            read -p "Necesita otra cosa? s/n" res
            if [[ $resm == S || $resm == s ]]; then
                menu
            else
                clear
                echo "Gracias por usar script de Automatizacion"
                sudo rm -r Materials 1> /dev/null
                exit
            fi
        ;;
        10)
            clear
	        echo "Gracias por usar el Instalador"
            sudo rm -r Materials 1> /dev/null
	        exit
        ;;
        *)
            clear
            echo 
            echo "Opcion Inconrrecta"
            sleep 1
            Menu
        ;;
    esac
}

Menu