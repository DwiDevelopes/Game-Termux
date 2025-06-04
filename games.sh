#!/bin/bash

clear

# Function to display header
display_header() {
    clear
    echo "▄▄▄█████▓▓█████  ██▀███   ███▄ ▄███▓ █    ██ ▒██   ██▒" | lolcat -s 100000 
    echo "▓  ██▒ ▓▒▓█   ▀ ▓██ ▒ ██▒▓██▒▀█▀ ██▒ ██  ▓██▒▒▒ █ █ ▒░" | lolcat -s 100000
    echo "▒ ▓██░ ▒░▒███   ▓██ ░▄█ ▒▓██    ▓██░▓██  ▒██░░░  █   ░" | lolcat -s 100000
    echo "░ ▓██▓ ░ ▒▓█  ▄ ▒██▀▀█▄  ▒██    ▒██ ▓▓█  ░██░ ░ █ █ ▒ " | lolcat -s 100000
    echo "  ▒██▒ ░ ░▒████▒░██▓ ▒██▒▒██▒   ░██▒▒▒█████▓ ▒██▒ ▒██▒" | lolcat -s 100000
    echo "  ▒ ░░   ░░ ▒░ ░░ ▒▓ ░▒▓░░ ▒░   ░  ░░▒▓▒ ▒ ▒ ▒▒ ░ ░▓ ░" | lolcat -s 100000
    echo "    ░     ░ ░  ░  ░▒ ░ ▒░░  ░      ░░░▒░ ░ ░ ░░   ░▒ ░" | lolcat -s 100000
    echo "  ░         ░     ░░   ░ ░      ░    ░░░ ░ ░  ░    ░  " | lolcat -s 100000
    echo "            ░  ░   ░            ░      ░      ░    ░  " | lolcat -s 100000
    echo "   ▄████  ▄▄▄       ███▄ ▄███▓▓█████   ██████         " | lolcat -s 100000
    echo "  ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀ ▒██    ▒         " | lolcat -s 100000
    echo " ▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███   ░ ▓██▄           " | lolcat -s 100000
    echo " ░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄   ▒   ██▒        " | lolcat -s 100000
    echo " ░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒▒██████▒▒        " | lolcat -s 100000
    echo "  ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░▒ ▒▓▒ ▒ ░        " | lolcat -s 100000
    echo "   ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░▒  ░ ░        " | lolcat -s 100000
    echo " ░ ░   ░   ░   ▒   ░      ░      ░   ░  ░  ░          " | lolcat -s 100000
    echo "       ░       ░  ░       ░      ░  ░      ░          " | lolcat -s 100000
    echo "------------------------------------------------------" | lolcat
    echo "-----------[Website: Dwi Bakti N Dev]------------" | lolcat -as 50
    echo "-----------[GitHub: github.com/DwiDevelopes]-----------" | lolcat -as 50
    echo "------------------------------------------------------" | lolcat 
}

# Function to display menu
display_menu() {
    echo
    echo "╔══════════════════════════════════════════════════════╗" | lolcat
    echo "║                   GAMES COLLECTION                    ║" | lolcat
    echo "╠══════════════════════════════════════════════════════╣" | lolcat
    echo "║  [1]  Moon-buggy            [2]  Tetris              ║" | lolcat
    echo "║  [3]  Pacman                [4]  Space Invaders      ║" | lolcat
    echo "║  [5]  Snake Game            [6]  Greed               ║" | lolcat
    echo "║  [7]  Nethack               [8]  Hangman             ║" | lolcat
    echo "║  [9]  2048                 [10]  Sudoku              ║" | lolcat
    echo "║  [11] CMatrix              [12] Dwarf Fortress       ║" | lolcat
    echo "║  [13] Chess                [14] Backgammon           ║" | lolcat
    echo "║  [15] Adventure            [16] Sokoban              ║" | lolcat
    echo "║  [17] Zork                 [18] Angband              ║" | lolcat
    echo "║                                                      ║" | lolcat
    echo "║  [0]  Enable Arrow Keys     [a]  About me            ║" | lolcat
    echo "║  [i]  Install All Games     [e]  EXIT                ║" | lolcat
    echo "╚══════════════════════════════════════════════════════╝" | lolcat
    echo
}

# Function to display about me
about_me() {
    clear
    echo "𝐀𝐛𝐨𝐮𝐭 𝐦𝐞: " | lolcat
    echo "  ___  " | lolcat -as 100
    echo " |[_]| " | lolcat -as 100
    echo " |+ ;|  Hello " | lolcat -as 100
    echo " '---' " | lolcat -as 100
    echo "[-----------------------------------------------------]" | lolcat -as 100
    echo " [ɴᴀᴍᴇ] = [Royhtml] " | lolcat -as 50
    echo ""
    echo " [ᴡᴇʙsɪᴛᴇ] = [Dwi Bakti N Dev] " | lolcat -as 50
    echo ""
    echo " [ɢɪᴛʜᴜʙ] = [https://github.com/DwiDevelopes] " | lolcat -as 50
    echo ""
    echo " [Facebook] = [@dwidevelopes]" | lolcat -as 50
    echo "[-----------------------------------------------------]" | lolcat -as 100
    read -p "Press [ENTER] to continue: "
}

# Function to install all games
install_games() {
    echo "Installing all games..." | lolcat
    pkg update -y && pkg upgrade -y
    pkg install -y moon-buggy bastet pacman ninvaders nsnake greed nethack nudoku cmatrix dwarf-fortress gnugo bsd-games
    pip install hangman-py
    echo "All games installed successfully!" | lolcat
    read -p "Press [ENTER] to continue: "
}

# Main loop
while true; do
    display_header
    display_menu
    
    echo -e "Enter your choice: \c" | lolcat
    read option

    case $option in
        "1") 
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Moon-buggy: " 
            moon-buggy
            ;;
        "2")
            echo "Press CTRL + c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Tetris: " 
            bastet
            ;;
        "3")
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Pacman: " 
            pacman
            ;;
        "4") 
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Space Invaders: " 
            ninvaders || nInvaders 
            ;;
        "5")
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Snake Game: " 
            nsnake
            ;;
        "6")
            echo "Press q then y to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Greed: " 
            greed
            ;;
        "7")
            echo "Press CTRL + c then answer the question to quit" | lolcat -a
            read -p "Press [ENTER] to start Nethack: " 
            nethack
            ;;
        "8") 
            echo "Follow the on-screen instructions to play" | lolcat -a
            read -p "Press [ENTER] to start Hangman: " 
            if [ -d "HangmanPy" ]; then
                cd HangmanPy && python hangman.py
            else
                pip install hangman-py
                hangman
            fi
            ;;
        "9")
            echo "Press q then y to exit the game" | lolcat -a
            read -p "Press [ENTER] to start 2048: " 
            if [ -f "./2048" ]; then
                ./2048
            else
                echo "2048 game not found in current directory" | lolcat
            fi
            ;;
        "10")
            echo "Press Q (uppercase) to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Sudoku: " 
            nudoku
            ;;
        "11")
            echo "Press CTRL + c to exit the matrix" | lolcat -a
            read -p "Press [ENTER] to start CMatrix: " 
            cmatrix
            ;;
        "12")
            echo "Type 'quit' to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Dwarf Fortress: " 
            dwarf-fortress
            ;;
        "13")
            echo "Type 'quit' to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Chess: " 
            gnugo --mode gtp
            ;;
        "14")
            echo "Follow the on-screen instructions to exit" | lolcat -a
            read -p "Press [ENTER] to start Backgammon: " 
            backgammon
            ;;
        "15")
            echo "Type 'quit' to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Adventure: " 
            adventure
            ;;
        "16")
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Sokoban: " 
            if command -v xsok >/dev/null; then
                xsok
            else
                echo "Sokoban not installed. Try 'pkg install xsok'" | lolcat
            fi
            ;;
        "17")
            echo "Type 'quit' to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Zork: " 
            if command -v frotz >/dev/null; then
                frotz /data/data/com.termux/files/usr/share/zork1/DATA/ZORK1.DAT
            else
                echo "Zork not installed. Try 'pkg install frotz'" | lolcat
            fi
            ;;
        "18")
            echo "Type 'quit' to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Angband: " 
            angband
            ;;
        "0")
            mkdir -p $HOME/.termux/
            echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties 
            termux-reload-settings
            echo "Arrow keys enabled! Please restart Termux for best results." | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
        "a") about_me ;;
        "i") install_games ;;
        "e") 
            echo "▄▄▄▄·  ▄· ▄▌▄▄▄ .      " | lolcat -s 10000
            echo "▐█ ▀█▪▐█▪██▌▀▄.▀·      " | lolcat -s 10000
            echo "▐█▀▀█▄▐█▌▐█▪▐▀▀▪▄      " | lolcat -s 10000
            echo "██▄▪▐█ ▐█▀·.▐█▄▄▌      " | lolcat -s 10000
            echo "·▀▀▀▀   ▀ •  ▀▀▀  ▀  ▀ " | lolcat -s 10000
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again." | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
    esac
done