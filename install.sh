#!/bin/bash

clear
echo -e "\e[32mPlease Don't copy the Code And Give credits If you are using this project\e[0m"
clear

echo "Installing Games in Termux by dwi bakti n dev" | lolcat

# Function to display installation header
display_install_header() {
    clear
    figlet "Termux Games" | lolcat
    echo "------------------------------------------------------" | lolcat
    echo "-----------[Website: Dwi Bakti N Dev]------------" | lolcat -as 50
    echo "-----------[GitHub: github.com/DwiDevelopes]-----------" | lolcat -as 50
    echo "------------------------------------------------------" | lolcat
    echo "-----------[Installation Menu]------------" | lolcat -as 50
}

# Function to display installation options
display_install_options() {
    echo
    echo "╔════════════════════════════════════════════════════╗" | lolcat
    echo "║          SELECT GAMES PACKAGE TO INSTALL           ║" | lolcat
    echo "╠════════════════════════════════════════════════════╣" | lolcat
    echo "║  [1] Basic Package (20 essential games)            ║" | lolcat
    echo "║  [2] Standard Package (40 popular games)           ║" | lolcat
    echo "║  [3] Extended Package (80 games)                   ║" | lolcat
    echo "║  [4] Complete Package (120 games)                  ║" | lolcat
    echo "║  [5] Custom Selection (Choose specific games)      ║" | lolcat
    echo "║                                                    ║" | lolcat
    echo "║  [0] Exit Installer                                ║" | lolcat
    echo "╚════════════════════════════════════════════════════╝" | lolcat
    echo
}

# Function to install dependencies
install_dependencies() {
    echo -e "\n\e[32mInstalling Dependencies...\e[0m" | lolcat
    pkg update -y && pkg upgrade -y
    pkg install -y ruby figlet wget clang python git cmake make
    gem install lolcat
    pip install --upgrade pip
}

# Function to install basic package (20 games)
install_basic_package() {
    echo -e "\n\e[32mInstalling Basic Package (20 games)...\e[0m" | lolcat
    
    # Essential games
    pkg install -y moon-buggy bastet pacman4console ninvaders nsnake greed \
        nethack nudoku cmatrix dwarf-fortress gnugo bsd-games angband frotz \
        moria larn omega empire hunt-the-wumpus robotfindskitten
    
    # Additional installations
    echo -e "\n\e[34mInstalling Hangman\e[0m" | lolcat
    git clone https://github.com/Dwidevelopes/HangmanPy.git
    
    echo -e "\n\e[34mInstalling 2048\e[0m" | lolcat
    wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
    gcc -o 2048 2048.c
    
    echo -e "\n\e[34mInstalling Wordle\e[0m" | lolcat
    pip install terminal-wordle
    
    echo -e "\n\e[34mInstalling Flappy Bird\e[0m" | lolcat
    pip install flappy-bird-cli
}

# Function to install standard package (40 games)
install_standard_package() {
    install_basic_package
    
    echo -e "\n\e[32mInstalling Additional Games for Standard Package...\e[0m" | lolcat
    
    # Additional games
    pkg install -y text-golf text-football text-tennis text-boxing text-basketball \
        tron worm battleship solitaire minesweeper simon asciiquarium towdef \
        blackjack poker yahtzee checkers connect-four reversi go dungeon-crawl rogue
    
    # Additional installations
    echo -e "\n\e[34mInstalling Cookie Clicker\e[0m" | lolcat
    pip install cookie-clicker
    
    echo -e "\n\e[34mInstalling Fallout Terminal\e[0m" | lolcat
    pip install fallout-cli
}

# Function to install extended package (80 games)
install_extended_package() {
    install_standard_package
    
    echo -e "\n\e[32mInstalling Additional Games for Extended Package...\e[0m" | lolcat
    
    # More games
    pkg install -y boulderdash curseofwar dopewars duel frozen-bubble gradius \
        jetpack jumpman lunar-lander mule missile-command monkey outpost \
        pipe-mania planetarium police-quest qbert rogue-legacy scorched-earth \
        space-taxi star-control super-mario tempest thrust time-pilot \
        tower-of-hanoi ultima vanguard wolfenstein x-com zzt
    
    # Additional installations
    echo -e "\n\e[34mInstalling Galaga\e[0m" | lolcat
    pip install galaga-terminal
    
    echo -e "\n\e[34mInstalling Game of Life\e[0m" | lolcat
    pip install game-of-life-terminal
}

# Function to install complete package (120 games)
install_complete_package() {
    install_extended_package
    
    echo -e "\n\e[32mInstalling Additional Games for Complete Package...\e[0m" | lolcat
    
    # Final set of games
    pkg install -y arkanoid burger-time centipede crystal-caves defender \
        donkey-kong double-dragon dragons-lair elevator gauntlet ghostbusters \
        joust karateka lemmings prince-of-persia
    
    # Additional installations
    echo -e "\n\e[34mInstalling Super Mario\e[0m" | lolcat
    pip install super-mario-terminal
    
    echo -e "\n\e[34mInstalling Jetpack\e[0m" | lolcat
    pip install jetpack-cli
    
    echo -e "\n\e[34mInstalling Lunar Lander\e[0m" | lolcat
    pip install lunar-lander-terminal
}

# Function to install custom selection
install_custom_selection() {
    echo -e "\n\e[32mCustom Game Installation\e[0m" | lolcat
    echo "Available game categories:"
    echo "1) Puzzle (sudoku, 2048, wordle)"
    echo "2) Arcade (pacman, space invaders)"
    echo "3) Board games (chess, backgammon)"
    echo "4) RPG (nethack, angband)"
    echo "5) Text sports (golf, football)"
    echo "6) Classic Arcade (arkanoid, centipede)"
    echo "7) Adventure (zork, prince of persia)"
    echo "8) Exit custom selection"
    
    while true; do
        read -p "Enter category number to install (or 8 to exit): " cat_choice
        
        case $cat_choice in
            1) 
                pkg install -y nudoku 2048-cli
                pip install terminal-wordle
                echo "Puzzle games installed!" | lolcat
                ;;
            2)
                pkg install -y pacman4console ninvaders moon-buggy arkanoid centipede
                echo "Arcade games installed!" | lolcat
                ;;
            3)
                pkg install -y gnugo backgammon chess checkers connect-four
                echo "Board games installed!" | lolcat
                ;;
            4)
                pkg install -y nethack angband rogue dungeon-crawl ultima
                echo "RPG games installed!" | lolcat
                ;;
            5)
                pkg install -y text-golf text-football text-tennis text-boxing
                echo "Text sports games installed!" | lolcat
                ;;
            6)
                pkg install -y arkanoid burger-time centipede defender donkey-kong
                echo "Classic arcade games installed!" | lolcat
                ;;
            7)
                pkg install -y frotz prince-of-persia
                echo "Adventure games installed!" | lolcat
                ;;
            8)
                break
                ;;
            *)
                echo "Invalid category number!" | lolcat
                ;;
        esac
    done
}

# Function to set up alias and finalize
finalize_installation() {
    echo -e "\n\e[34mSetting up Alias\e[0m" | lolcat
    cd ~
    echo "alias games='cd ~/Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
    
    echo -e "\n\e[32mInstallation Complete!\e[0m" | lolcat
    echo "Visit www.LearnTermux.tech To learn Basic To Advance About Termux" | lolcat
    echo ""
    echo -e '\033[1mType ./games.sh to start the Termux-Games\033[0m' | lolcat
    echo -e '\033[1mAfter restarting Termux, you can type "games" to directly start the Games Menu.\033[0m' | lolcat
    echo -e '\033[1mYou can also run specific games by their commands (e.g., "moon-buggy", "bastet", etc.)\033[0m' | lolcat
}

# Main installation process
display_install_header
display_install_options

while true; do
    read -p "Enter your choice (1-5, or 0 to exit): " choice
    
    case $choice in
        1)
            install_dependencies
            install_basic_package
            finalize_installation
            break
            ;;
        2)
            install_dependencies
            install_standard_package
            finalize_installation
            break
            ;;
        3)
            install_dependencies
            install_extended_package
            finalize_installation
            break
            ;;
        4)
            install_dependencies
            install_complete_package
            finalize_installation
            break
            ;;
        5)
            install_dependencies
            install_custom_selection
            finalize_installation
            break
            ;;
        0)
            echo "Installation cancelled." | lolcat
            exit 0
            ;;
        *)
            echo "Invalid choice! Please try again." | lolcat
            ;;
    esac
done