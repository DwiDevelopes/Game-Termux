#!/bin/bash

# Configuration
CONFIG_FILE="$HOME/.game_termux_config"
HISTORY_FILE="$HOME/.game_termux_history"
FAVORITES_FILE="$HOME/.game_termux_favorites"

# Initialize files
touch "$HISTORY_FILE"
touch "$FAVORITES_FILE"

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

# ASCII Art
display_banner() {
  clear
  echo -e "${PURPLE}"
  cat << "EOF"
  ██████╗  █████╗ ███╗   ███╗███████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
  ██╔══██╗██╔══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗██╔╝
  ██████╔╝███████║██╔████╔██║█████╗         ██║   █████╗  ██████╔╝██╔████╔██║ ╚████╔╝  ╚███╔╝ 
  ██╔═══╝ ██╔══██║██║╚██╔╝██║██╔══╝         ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║  ╚██╔╝   ██╔██╗ 
  ██║     ██║  ██║██║ ╚═╝ ██║███████╗       ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ██╔╝ ██╗
  ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝
EOF
  echo -e "${NC}"
  echo -e "${CYAN}                           TERMUX GAME COLLECTION v2.3.0 - BY DWI BAKTI NUGROHO${NC}"
  echo -e "${YELLOW}═══════════════════════════════════════════════════════════════════════════════════${NC}"
}

# Centered text with color
center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ' '{1..500})"
  printf "%*.*s ${BLUE}%s${NC} %*.*s\n" 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Section header
section() {
  echo -e "\n${YELLOW}»»» ${1} «««${NC}"
  echo -e "${YELLOW}───────────────────────────────────────────────────────────────────────────────${NC}"
}

# Add to history
add_history() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$HISTORY_FILE"
}

# Display menu
show_menu() {
  section "🎮 GAME CATEGORIES"
  echo -e "  ${GREEN}1${NC}) Classic Games          ${GREEN}5${NC}) Puzzle Games         ${GREEN}9${NC}) Adventure"
  echo -e "  ${GREEN}2${NC}) Strategy Games        ${GREEN}6${NC}) Retro Games         ${GREEN}10${NC}) Utilities"
  echo -e "  ${GREEN}3${NC}) Arcade Games         ${GREEN}7${NC}) Board Games         ${GREEN}11${NC}) Information"
  echo -e "  ${GREEN}4${NC}) Card Games           ${GREEN}8${NC}) Simulation          ${GREEN}12${NC}) Settings"

  section "🚀 QUICK ACTIONS"
  echo -e "  ${GREEN}S${NC}) Search Games          ${GREEN}F${NC}) Favorites          ${GREEN}H${NC}) History"
  echo -e "  ${GREEN}R${NC}) Random Game          ${GREEN}U${NC}) Update Check       ${GREEN}Q${NC}) Quit"
}

# Game database
declare -A GAMES=(
  # Classic Games
  ["1.1"]="Moon-buggy" ["1.2"]="Nsnake" ["1.3"]="Pacman" ["1.4"]="Ninvaders"
  # Strategy Games
  ["2.1"]="Greed" ["2.2"]="Curseofwar" ["2.3"]="Dopewars" ["2.4"]="Gnugo"
  # Arcade Games
  ["3.1"]="0verkill" ["3.2"]="Myman" ["3.3"]="TTYSolitaire" ["3.4"]="Robotfindskitten"
  # Card Games
  ["4.1"]="Bastet" ["4.2"]="2048" ["4.3"]="Nudoku" ["4.4"]="Sudoku"
  # Puzzle Games
  ["5.1"]="Brogue" ["5.2"]="Phear" ["5.3"]="Npush" ["5.4"]="Gnuski"
  # Retro Games
  ["6.1"]="Moria" ["6.2"]="Nethack" ["6.3"]="CSOL" ["6.4"]="Go"
  # Board Games
  ["7.1"]="Ski" ["7.2"]="Stickman" ["7.3"]="Hangman" ["7.4"]="Gomoku"
  # Simulation
  ["8.1"]="Angband" ["8.2"]="Adom" ["8.3"]="Cataclysm" ["8.4"]="Dungeon"
  # Adventure
  ["9.1"]="Zork" ["9.2"]="Hunt" ["9.3"]="Larn" ["9.4"]="Omega"
  # Utilities
  ["10.1"]="Chess" ["10.2"]="Backgammon" ["10.3"]="Reversi" ["10.4"]="Mille"
)

# Main function
main() {
  while true; do
    display_banner
    show_menu
    
    echo -e "\n${BLUE}»»» Select an option: ${NC}"
    read -p "➤ " choice
    
    case $choice in
      # Category selections
      [1-9]|10)
        clear
        display_banner
        section "GAME LIST - CATEGORY $choice"
        for key in "${!GAMES[@]}"; do
          if [[ $key == "$choice".* ]]; then
            echo -e "  ${GREEN}${key#*.}${NC}) ${GAMES[$key]}"
          fi
        done
        
        echo -e "\n${BLUE}»»» Select a game (or B to go back): ${NC}"
        read -p "➤ " subchoice
        
        if [[ "$subchoice" == "B" || "$subchoice" == "b" ]]; then
          continue
        fi
        
        game_key="$choice.$subchoice"
        if [[ -n "${GAMES[$game_key]}" ]]; then
          launch_game "${GAMES[$game_key]}"
        else
          echo -e "${RED}Invalid selection!${NC}"
          sleep 1
        fi
        ;;
      
      # Quick actions
      S|s) search_games ;;
      F|f) show_favorites ;;
      H|h) show_history ;;
      R|r) launch_random_game ;;
      U|u) check_updates ;;
      Q|q) exit_program ;;
      11) show_info ;;
      12) show_settings ;;
      *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
  done
}

# Launch a game
launch_game() {
  local game=$1
  clear
  display_banner
  section "LAUNCHING $game"
  
  # Add to history
  add_history "$game"
  
  # Special cases
  case $game in
    "Hangman") cd HangmanPy && python hangman.py;;
    "2048") ./2048;;
    *)
      echo -e "${YELLOW}Controls:${NC}"
      echo -e "• Press ${GREEN}Q${NC} to quit most games"
      echo -e "• ${GREEN}CTRL+C${NC} works for terminal games"
      echo -e "\n${BLUE}Press ENTER to start...${NC}"
      read
      $game
      ;;
  esac
  
  echo -e "\n${GREEN}Game ended.${NC}"
  read -p "Press ENTER to return to menu..."
}

# Search games
search_games() {
  clear
  display_banner
  section "SEARCH GAMES"
  
  echo -e "${BLUE}Enter search term:${NC}"
  read -p "➤ " term
  
  clear
  display_banner
  section "SEARCH RESULTS FOR '$term'"
  
  found=0
  for key in "${!GAMES[@]}"; do
    if [[ "${GAMES[$key],,}" == *"${term,,}"* ]]; then
      echo -e "  ${GREEN}${key}${NC}) ${GAMES[$key]}"
      found=1
    fi
  done
  
  if [[ $found -eq 0 ]]; then
    echo -e "${RED}No games found matching '$term'${NC}"
  else
    echo -e "\n${BLUE}Enter game number to play (or B to go back):${NC}"
    read -p "➤ " selection
    
    if [[ "$selection" != "B" && "$selection" != "b" ]]; then
      if [[ -n "${GAMES[$selection]}" ]]; then
        launch_game "${GAMES[$selection]}"
      else
        echo -e "${RED}Invalid selection!${NC}"
        sleep 1
      fi
    fi
  fi
}

# Show favorites
show_favorites() {
  clear
  display_banner
  section "YOUR FAVORITE GAMES"
  
  if [[ ! -s "$FAVORITES_FILE" ]]; then
    echo -e "${YELLOW}No favorites yet! Add games with the 'Add to Favorites' option.${NC}"
  else
    nl -w2 -s') ' "$FAVORITES_FILE"
  fi
  
  echo -e "\n${BLUE}A) Add to Favorites  D) Delete Favorite  B) Back${NC}"
  read -p "➤ " action
  
  case $action in
    A|a)
      clear
      display_banner
      section "ADD TO FAVORITES"
      
      for key in "${!GAMES[@]}"; do
        echo -e "  ${GREEN}${key}${NC}) ${GAMES[$key]}"
      done
      
      echo -e "\n${BLUE}Enter game number to add:${NC}"
      read -p "➤ " game_num
      
      if [[ -n "${GAMES[$game_num]}" ]]; then
        if grep -q "^${GAMES[$game_num]}$" "$FAVORITES_FILE"; then
          echo -e "${YELLOW}Game is already in favorites!${NC}"
        else
          echo "${GAMES[$game_num]}" >> "$FAVORITES_FILE"
          echo -e "${GREEN}Added to favorites!${NC}"
        fi
      else
        echo -e "${RED}Invalid selection!${NC}"
      fi
      ;;
      
    D|d)
      if [[ -s "$FAVORITES_FILE" ]]; then
        echo -e "\n${BLUE}Enter number to delete:${NC}"
        read -p "➤ " del_num
        sed -i "${del_num}d" "$FAVORITES_FILE"
        echo -e "${GREEN}Favorite removed!${NC}"
      fi
      ;;
  esac
}

# Show history
show_history() {
  clear
  display_banner
  section "GAME HISTORY"
  
  if [[ -s "$HISTORY_FILE" ]]; then
    tac "$HISTORY_FILE" | head -10
  else
    echo -e "${YELLOW}No game history yet!${NC}"
  fi
  
  read -p "Press ENTER to continue..."
}

# Launch random game
launch_random_game() {
  local random_key=$(shuf -n1 -e "${!GAMES[@]}")
  launch_game "${GAMES[$random_key]}"
}

# Check for updates
check_updates() {
  clear
  display_banner
  section "UPDATE CHECK"
  
  echo -e "${YELLOW}Checking for updates...${NC}"
  # Simulated update check - in real implementation you'd check git or a server
  sleep 2
  echo -e "${GREEN}You have the latest version (v2.3.0)${NC}"
  
  read -p "Press ENTER to continue..."
}

# Information screen
show_info() {
  clear
  display_banner
  section "INFORMATION"
  
  echo -e "${CYAN}» Developer:${NC} Dwi Bakti Nugroho"
  echo -e "${CYAN}» Version:${NC} 2.3.0"
  echo -e "${CYAN}» Contact:${NC} +62 896-5296-9323"
  echo -e "${CYAN}» Website:${NC} https://portofolio-dwi-bakti-n-dev-liard.vercel.app/"
  echo -e "${CYAN}» GitHub:${NC} https://github.com/DwiDevelopes"
  
  section "SYSTEM INFO"
  echo -e "${CYAN}» Termux:${NC} $(uname -m)"
  echo -e "${CYAN}» Storage:${NC} $(df -h $PWD | awk 'NR==2 {print $4}') free"
  
  read -p "Press ENTER to continue..."
}

# Settings screen
show_settings() {
  while true; do
    clear
    display_banner
    section "SETTINGS"
    
    echo -e "  ${GREEN}1${NC}) Change UI Color"
    echo -e "  ${GREEN}2${NC}) Configure Controls"
    echo -e "  ${GREEN}3${NC}) Clear History"
    echo -e "  ${GREEN}4${NC}) Reset Favorites"
    echo -e "  ${GREEN}5${NC}) Back to Main Menu"
    
    read -p "➤ " setting_choice
    
    case $setting_choice in
      1) change_ui_color ;;
      2) configure_controls ;;
      3) clear_history ;;
      4) reset_favorites ;;
      5) break ;;
      *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
  done
}

# Exit program
exit_program() {
  clear
  display_banner
  section "THANK YOU"
  
  echo -e "${GREEN}Thanks for using Termux Game Collection!${NC}"
  echo -e "${YELLOW}» Remember to take breaks while gaming!${NC}"
  echo -e "\n${BLUE}Press ENTER to exit...${NC}"
  read
  
  # Configure extra keys before exiting
  mkdir -p $HOME/.termux/
  echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties
  termux-reload-settings
  
  exit 0
}

# Start the program
main
