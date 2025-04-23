#!/bin/bash

# Configuration
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

# ASCII Art Banner
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
  echo -e "${CYAN}                   TERMUX GAME COLLECTION - BY DWI BAKTI N DEV${NC}"
  echo -e "${YELLOW}══════════════════════════════════════════════════════════════════════${NC}"
  echo -e "${RED}${BOLD}NOTE: Please don't copy this project without permission${NC}\n"
}

# Centered text with color
center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ' '{1..500})"
  printf "%*.*s ${BLUE}%s${NC} %*.*s\n" 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Installation header
install_header() {
  clear
  display_banner
  echo -e "${GREEN}${UNDERLINE}Installing Termux Games...${NC}\n"
}

# Install package with status
install_pkg() {
  local pkg=$1
  local name=$2
  
  echo -e "${YELLOW}Installing ${CYAN}${name}${YELLOW}...${NC}"
  if pkg install "$pkg" -y >/dev/null 2>&1; then
    echo -e "${GREEN}✓ ${name} installed successfully${NC}"
  else
    echo -e "${RED}✗ Failed to install ${name}${NC}"
  fi
  echo ""
}

# Main installation function
install_games() {
  install_header
  
  # Install dependencies first
  echo -e "${PURPLE}Installing dependencies...${NC}"
  install_pkg ruby "Ruby (for Lolcat)"
  gem install lolcat >/dev/null 2>&1
  install_pkg figlet "Figlet"
  echo ""
  
  # Classic Games
  echo -e "${PURPLE}Installing Classic Games...${NC}"
  install_pkg bastet "Bastet (Tetris)"
  install_pkg pacman4console "Pacman"
  install_pkg moon-buggy "Moon-Buggy"
  install_pkg ninvaders "Space Invaders"
  install_pkg nsnake "Snake Game"
  
  # Strategy Games
  echo -e "\n${PURPLE}Installing Strategy Games...${NC}"
  install_pkg greed "Greed"
  install_pkg nethack "Nethack"
  install_pkg curseofwar "Curse of War"
  install_pkg dopewars "Dope Wars"
  
  # Puzzle Games
  echo -e "\n${PURPLE}Installing Puzzle Games...${NC}"
  install_pkg nudoku "Sudoku"
  install_pkg 2048 "2048"
  install_pkg brogue "Brogue"
  install_pkg phear "Phear"
  
  # Additional Games
  echo -e "\n${PURPLE}Installing Additional Games...${NC}"
  install_pkg overkill "Overkill"
  install_pkg csol "CSOL"
  install_pkg gnugo "Gnu Go"
  install_pkg gnuski "Gnu Ski"
  install_pkg moria "Moria"
  install_pkg npush "Npush"
  install_pkg robotfindskitten "Robot Finds Kitten"
  install_pkg ttysolitaire "TTY Solitaire"
  install_pkg myman "Myman"
  install_pkg go "Go Game"
  
  # Special Installations
  echo -e "\n${PURPLE}Special Installations...${NC}"
  echo -e "${YELLOW}Installing Hangman...${NC}"
  pkg install git -y && git clone https://github.com/DwiDevelopes/HangmanPy.git
  echo -e "${GREEN}✓ Hangman installed successfully${NC}\n"
  
  echo -e "${YELLOW}Installing Python...${NC}"
  pkg install python -y
  echo -e "${GREEN}✓ Python installed successfully${NC}\n"
  
  echo -e "${YELLOW}Building 2048 from source...${NC}"
  pkg install wget clang -y && wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c && gcc -o 2048 2048.c
  echo -e "${GREEN}✓ 2048 built successfully${NC}\n"
  
  # Create alias
  echo -e "${YELLOW}Creating games alias...${NC}"
  echo "alias games='cd && cd Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
  echo -e "${GREEN}✓ Alias created. You can now type 'games' to start.${NC}\n"
}

# Final message
display_completion() {
  clear
  display_banner
  echo -e "${GREEN}${BOLD}Installation Complete!${NC}\n"
  
  echo -e "${CYAN}Games successfully installed in your Termux.${NC}"
  echo -e "${YELLOW}To start the games menu, type:${NC}"
  echo -e "  ${GREEN}./games.sh${NC} ${YELLOW}or just${NC} ${GREEN}games${NC} ${YELLOW}after restarting Termux${NC}\n"
  
  echo -e "${UNDERLINE}Important Links:${NC}"
  echo -e "• ${BLUE}Termux Guide:${NC} https://linkr.bio/BangRoy.go.id"
  echo -e "• ${BLUE}AI Assistant:${NC} https://ai-google.vercel.app/"
  echo -e "• ${BLUE}GitHub:${NC} https://github.com/DwiDevelopes\n"
  
  echo -e "${RED}${BOLD}Note: This project is protected under copyright.${NC}"
  echo -e "${YELLOW}Please don't copy without permission.${NC}\n"
  
  read -p "Press ENTER to exit..."
}

# Main execution
display_banner
echo -e "${YELLOW}This script will install various games in Termux.${NC}"
read -p "Do you want to continue? [Y/n] " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
  install_games
  display_completion
else
  echo -e "${RED}Installation cancelled.${NC}"
  exit 1
fi
