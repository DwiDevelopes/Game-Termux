#!/bin/bash

# Termux-Games
# Enhanced by: [Your Name]
# Original by: dwi bakti n dev

# Clear screen
clear

# Color codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

# Banner
echo -e "${CYAN}"
echo "=============================================="
figlet -f slant "Termux Games" | lolcat
echo "=============================================="
echo -e "${NC}"

# Warning message
echo -e "${YELLOW}"
echo "Note: Please don't copy this project without permission"
echo "If you want to use it, please contact the author first"
echo -e "${NC}"
echo ""

# Check if packages are installed
check_pkg() {
    if ! command -v $1 &> /dev/null; then
        echo -e "${RED}$1 not found! Installing...${NC}"
        pkg install $1 -y
    fi
}

# Install required packages
echo -e "${GREEN}[*] Checking and installing prerequisites...${NC}"
check_pkg ruby
check_pkg figlet
check_pkg wget
check_pkg clang
check_pkg git
check_pkg python

if ! command -v lolcat &> /dev/null; then
    echo -e "${RED}lolcat not found! Installing...${NC}"
    gem install lolcat
fi

# Game installation function
install_game() {
    echo -e "\n${PURPLE}"
    figlet "$1" | lolcat
    echo -e "${BLUE}Installing $1...${NC}"
    pkg install "$2" -y
}

# Games list
games=(
    "Bastet:bastet"
    "Pacman:pacman4console"
    "Moon-Buggy:moon-buggy"
    "Space Invaders:ninvaders"
    "Snake:nsnake"
    "Greed:greed"
    "Nethack:nethack"
    "Sudoku:nudoku"
    "Overkill:overkill"
    "2048 Game:2048"
    "Brogue:brogue"
    "Phear:phear"
    "Curse of War:curseofwar"
    "CSOL:csol"
    "Dopewars:dopewars"
    "GNU Go:gnugo"
    "GNU Ski:gnuski"
    "Moria:moria"
    "N-Push:npush"
    "Robot Finds Kitten:robotfindskitten"
    "TTY Solitaire:ttysolitaire"
    "MyMan:myman"
    "Go:go"
    "Stickman:stickman"
)

# Install all games
for game in "${games[@]}"; do
    name="${game%%:*}"
    pkg="${game##*:}"
    install_game "$name" "$pkg"
done

# Special installations
echo -e "\n${CYAN}"
figlet "Hangman" | lolcat
echo -e "${BLUE}Installing Hangman...${NC}"
if [ ! -d "HangmanPy" ]; then
    git clone https://github.com/DwiDevelopes/HangmanPy.git
else
    echo -e "${YELLOW}HangmanPy already exists. Skipping...${NC}"
fi

echo -e "\n${CYAN}"
figlet "2048 (C)" | lolcat
echo -e "${BLUE}Installing 2048 (C version)...${NC}"
if [ ! -f "2048" ]; then
    wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
    gcc -o 2048 2048.c
else
    echo -e "${YELLOW}2048 already exists. Skipping...${NC}"
fi

# Add alias to bashrc
echo -e "\n${GREEN}[*] Setting up alias...${NC}"
if ! grep -q "alias games='cd && cd Termux-Games && bash games.sh'" /data/data/com.termux/files/usr/etc/bash.bashrc; then
    echo "alias games='cd && cd Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
    echo -e "${GREEN}Alias 'games' added to bash.bashrc${NC}"
else
    echo -e "${YELLOW}Alias 'games' already exists in bash.bashrc${NC}"
fi

# Final message
echo -e "\n${GREEN}"
echo "=============================================="
echo "Installation Complete!"
echo "=============================================="
echo -e "${NC}"

echo -e "${CYAN}Useful Links:${NC}"
echo -e "${BLUE}1. Termux Guide: https://linkr.bio/BangRoy.go.id${NC}"
echo -e "${BLUE}2. AI Assistant: https://ai-google.vercel.app/${NC}"
echo ""

echo -e "${GREEN}How to start:${NC}"
echo -e "${YELLOW}1. Restart Termux or run: source /data/data/com.termux/files/usr/etc/bash.bashrc"
echo -e "2. Type 'games' to start the Termux-Games menu"
echo -e "3. Enjoy playing!${NC}"

echo -e "\n${PURPLE}Thank you for using Termux-Games!${NC}"
