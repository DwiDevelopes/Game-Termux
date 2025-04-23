#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

# Animation
spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Check if package is installed
check_installed() {
    if [ -x "$(command -v $1)" ] || dpkg -l | grep -q "ii  $1 "; then
        return 0
    else
        return 1
    fi
}

# Install package with error handling
install_pkg() {
    echo -e "${YELLOW}Installing ${CYAN}$1${YELLOW}...${NC}"
    if check_installed $1; then
        echo -e "${GREEN}✓ Already installed: $1${NC}"
        return 0
    fi
    
    if pkg install $1 -y > /dev/null 2>&1; then
        echo -e "${GREEN}✓ Successfully installed: $1${NC}"
        return 0
    else
        echo -e "${RED}✗ Failed to install: $1${NC}"
        return 1
    fi
}

# Banner
display_banner() {
    clear
    echo -e "${PURPLE}"
    cat << "EOF"
  ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗██╔╝
     ██║   █████╗  ██████╔╝██╔████╔██║ ╚████╔╝  ╚███╔╝ 
     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║  ╚██╔╝   ██╔██╗ 
     ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ██╔╝ ██╗
     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝
EOF
    echo -e "${NC}"
    echo -e "${CYAN}                   TERMUX GAME COLLECTION - INSTALLER${NC}"
    echo -e "${YELLOW}══════════════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}By Dwi Bakti N Dev | Version 3.0 | © 2023${NC}\n"
}

# Install dependencies
install_dependencies() {
    echo -e "${PURPLE}${BOLD}Installing Dependencies...${NC}"
    
    # Update packages first
    echo -e "${YELLOW}Updating packages...${NC}"
    pkg update -y > /dev/null 2>&1 &
    spinner
    
    if ! install_pkg ruby; then
        echo -e "${RED}Critical error: Ruby installation failed${NC}"
        exit 1
    fi
    
    echo -e "${YELLOW}Installing Lolcat...${NC}"
    gem install lolcat > /dev/null 2>&1 &
    spinner
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Lolcat installed successfully${NC}"
    else
        echo -e "${RED}✗ Lolcat installation failed${NC}"
    fi
    
    install_pkg figlet
    install_pkg wget
    install_pkg clang
    install_pkg git
    install_pkg python
    install_pkg jq  # Needed for JSON parsing in game images feature
    install_pkg termux-api  # For some advanced features
    
    echo ""
}

# Install all games
install_all_games() {
    # Create game directory
    mkdir -p ~/Termux-Games
    cd ~/Termux-Games
    
    # Classic Games
    echo -e "${PURPLE}${BOLD}Installing Classic Games...${NC}"
    install_pkg moon-buggy
    install_pkg bastet
    install_pkg pacman4console
    install_pkg ninvaders
    install_pkg nsnake
    install_pkg greed
    install_pkg nethack
    install_pkg nudoku
    
    # Strategy Games
    echo -e "\n${PURPLE}${BOLD}Installing Strategy Games...${NC}"
    install_pkg curseofwar
    install_pkg dopewars
    install_pkg gnugo
    install_pkg moria
    
    # Puzzle Games
    echo -e "\n${PURPLE}${BOLD}Installing Puzzle Games...${NC}"
    install_pkg brogue
    install_pkg phear
    install_pkg gnuski
    install_pkg npush
    
    # Arcade Games
    echo -e "\n${PURPLE}${BOLD}Installing Arcade Games...${NC}"
    install_pkg 0verkill
    install_pkg csol
    install_pkg robotfindskitten
    install_pkg ttysolitaire
    install_pkg myman
    
    # Additional Games
    echo -e "\n${PURPLE}${BOLD}Installing Additional Games...${NC}"
    install_pkg go
    install_pkg sl
    install_pkg cmatrix
    
    # Special Installations
    echo -e "\n${PURPLE}${BOLD}Special Installations...${NC}"
    
    # Hangman
    echo -e "${YELLOW}Installing Hangman...${NC}"
    if [ -d "HangmanPy" ]; then
        echo -e "${GREEN}✓ Hangman already installed${NC}"
    else
        git clone https://github.com/DwiDevelopes/HangmanPy.git > /dev/null 2>&1 &
        spinner
        if [ -d "HangmanPy" ]; then
            echo -e "${GREEN}✓ Hangman installed successfully${NC}"
        else
            echo -e "${RED}✗ Hangman installation failed${NC}"
        fi
    fi
    
    # 2048 from source
    echo -e "\n${YELLOW}Building 2048 from source...${NC}"
    if [ -f "2048" ]; then
        echo -e "${GREEN}✓ 2048 already built${NC}"
    else
        wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c > /dev/null 2>&1
        gcc -o 2048 2048.c > /dev/null 2>&1 &
        spinner
        if [ -f "2048" ]; then
            echo -e "${GREEN}✓ 2048 built successfully${NC}"
            rm 2048.c
        else
            echo -e "${RED}✗ 2048 build failed${NC}"
        fi
    fi
    
    # Download the main game collection script
    echo -e "\n${YELLOW}Downloading Game Collection Manager...${NC}"
    if [ -f "games.sh" ]; then
        echo -e "${GREEN}✓ Game manager already exists${NC}"
    else
        wget https://raw.githubusercontent.com/DwiDevelopes/Termux-Games/main/games.sh > /dev/null 2>&1 &
        spinner
        if [ -f "games.sh" ]; then
            chmod +x games.sh
            echo -e "${GREEN}✓ Game manager downloaded successfully${NC}"
        else
            echo -e "${RED}✗ Failed to download game manager${NC}"
            echo -e "${YELLOW}Trying alternative download...${NC}"
            curl -o games.sh https://raw.githubusercontent.com/DwiDevelopes/Termux-Games/main/games.sh > /dev/null 2>&1 &
            spinner
            if [ -f "games.sh" ]; then
                chmod +x games.sh
                echo -e "${GREEN}✓ Game manager downloaded successfully${NC}"
            else
                echo -e "${RED}✗ Critical error: Failed to download game manager${NC}"
                exit 1
            fi
        fi
    fi
    
    # Create alias
    echo -e "\n${YELLOW}Creating games alias...${NC}"
    if grep -q "alias games=" $HOME/.bashrc; then
        echo -e "${GREEN}✓ Alias already exists${NC}"
    else
        echo "alias games='cd ~/Termux-Games && bash games.sh'" >> $HOME/.bashrc
        echo -e "${GREEN}✓ Alias created successfully${NC}"
        echo -e "${YELLOW}Note: You may need to run 'source ~/.bashrc' or restart Termux${NC}"
    fi
    
    # Create game installation directory
    mkdir -p ~/Termux-Games/games_install
    
    # Set up termux properties for better keyboard
    echo -e "\n${YELLOW}Configuring Termux keyboard...${NC}"
    mkdir -p ~/.termux
    echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" > ~/.termux/termux.properties
    termux-reload-settings
    echo -e "${GREEN}✓ Keyboard configured${NC}"
}

# Completion message
show_completion() {
    clear
    display_banner
    echo -e "${GREEN}${BOLD}Installation Complete!${NC}\n"
    
    figlet "SUCCESS!" | lolcat
    echo ""
    
    echo -e "${CYAN}All games have been installed successfully.${NC}"
    echo -e "${YELLOW}To start the games menu, type:${NC}"
    echo -e "  ${GREEN}games${NC}\n"
    
    echo -e "${YELLOW}Game Collection Features:${NC}"
    echo -e "• ${GREEN}100+ Terminal Games${NC}"
    echo -e "• ${GREEN}Game Installation System${NC}"
    echo -e "• ${GREEN}Customizable Themes${NC}"
    echo -e "• ${GREEN}Game Images from Unsplash${NC}"
    echo -e "• ${GREEN}Favorites & History Tracking${NC}\n"
    
    echo -e "${UNDERLINE}Important Links:${NC}"
    echo -e "• ${BLUE}Official Website:${NC} https://linkr.bio/BangRoy.go.id"
    echo -e "• ${BLUE}GitHub Repository:${NC} https://github.com/DwiDevelopes"
    echo -e "• ${BLUE}AI Assistant:${NC} https://ai-google.vercel.app/\n"
    
    echo -e "${RED}${BOLD}Copyright Notice:${NC}"
    echo -e "${YELLOW}This project is protected under copyright law.${NC}"
    echo -e "${YELLOW}Unauthorized copying or distribution is prohibited.${NC}\n"
    
    echo -e "${YELLOW}Note: Some games may require additional setup.${NC}"
    echo -e "${YELLOW}Refer to the game's documentation for specific instructions.${NC}\n"
    
    read -p "Press ENTER to exit..."
}

# Main execution
display_banner

# Check if user wants to install
echo -e "${YELLOW}This will install Termux Game Collection with 50+ games (~500MB).${NC}"
echo -e "${YELLOW}It may take 10-20 minutes depending on your connection.${NC}\n"
read -p "Do you want to continue? [Y/n] " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
    install_dependencies
    install_all_games
    show_completion
else
    echo -e "${RED}Installation cancelled.${NC}"
    exit 1
fi
