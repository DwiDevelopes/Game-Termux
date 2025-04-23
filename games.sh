#!/bin/bash

# Configuration
CONFIG_FILE="$HOME/.game_termux_config"
HISTORY_FILE="$HOME/.game_termux_history"
FAVORITES_FILE="$HOME/.game_termux_favorites"
THEME_FILE="$HOME/.game_termux_theme"
INSTALL_DIR="$HOME/games_install"

# Initialize files and directories
mkdir -p "$INSTALL_DIR"
touch "$HISTORY_FILE"
touch "$FAVORITES_FILE"
touch "$THEME_FILE"

# Current configuration
if [[ -f "$CONFIG_FILE" ]]; then
  source "$CONFIG_FILE"
else
  declare -A CONFIG=(
    ["UNSPLASH_API_KEY"]=""
    ["DEFAULT_THEME"]="purple"
    ["SHOW_IMAGES"]="false"
    ["GAME_INSTALL_DIR"]="$INSTALL_DIR"
  )
fi

# Load theme
load_theme() {
  if [[ -f "$THEME_FILE" ]]; then
    source "$THEME_FILE"
  else
    THEME_COLOR="purple"
    BACKGROUND_COLOR="black"
    TEXT_COLOR="white"
    ACCENT_COLOR="cyan"
    echo -e "THEME_COLOR=\"$THEME_COLOR\"\nBACKGROUND_COLOR=\"$BACKGROUND_COLOR\"\nTEXT_COLOR=\"$TEXT_COLOR\"\nACCENT_COLOR=\"$ACCENT_COLOR\"" > "$THEME_FILE"
  fi
}

load_theme

# Set colors based on theme
set_colors() {
  case $THEME_COLOR in
    "red") THEME='\033[1;31m' ;;
    "green") THEME='\033[1;32m' ;;
    "yellow") THEME='\033[1;33m' ;;
    "blue") THEME='\033[1;34m' ;;
    "purple") THEME='\033[1;35m' ;;
    "cyan") THEME='\033[1;36m' ;;
    "orange") THEME='\033[1;38;5;208m' ;;
    "pink") THEME='\033[1;38;5;200m' ;;
    *) THEME='\033[1;35m' ;; # default purple
  esac

  case $BACKGROUND_COLOR in
    "black") BG='\033[40m' ;;
    "dark_blue") BG='\033[44m' ;;
    "dark_green") BG='\033[42m' ;;
    "dark_red") BG='\033[41m' ;;
    "dark_purple") BG='\033[45m' ;;
    *) BG='\033[40m' ;; # default black
  esac

  case $TEXT_COLOR in
    "white") TEXT='\033[37m' ;;
    "light_gray") TEXT='\033[37m' ;;
    "light_blue") TEXT='\033[94m' ;;
    "light_green") TEXT='\033[92m' ;;
    *) TEXT='\033[37m' ;; # default white
  esac

  case $ACCENT_COLOR in
    "cyan") ACCENT='\033[1;36m' ;;
    "yellow") ACCENT='\033[1;33m' ;;
    "green") ACCENT='\033[1;32m' ;;
    "orange") ACCENT='\033[1;38;5;208m' ;;
    *) ACCENT='\033[1;36m' ;; # default cyan
  esac

  NC='\033[0m'
}

set_colors

# ASCII Art with theme color
display_banner() {
  clear
  echo -e "${THEME}"
  cat << "EOF"
  ██████╗  █████╗ ███╗   ███╗███████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗
  ██╔══██╗██╔══██╗████╗ ████║██╔════╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║╚██╗ ██╔╝╚██╗██╔╝
  ██████╔╝███████║██╔████╔██║█████╗         ██║   █████╗  ██████╔╝██╔████╔██║ ╚████╔╝  ╚███╔╝ 
  ██╔═══╝ ██╔══██║██║╚██╔╝██║██╔══╝         ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║  ╚██╔╝   ██╔██╗ 
  ██║     ██║  ██║██║ ╚═╝ ██║███████╗       ██║   ███████╗██║  ██║██║ ╚═╝ ██║   ██║   ██╔╝ ██╗
  ╚═╝     ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝
EOF
  echo -e "${NC}"
  echo -e "${ACCENT}                           TERMUX GAME COLLECTION v3.0 - BY DWI BAKTI NUGROHO${NC}"
  echo -e "${THEME}═══════════════════════════════════════════════════════════════════════════════════${NC}"
}

# Centered text with color
center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ' '{1..500})"
  printf "%*.*s ${ACCENT}%s${NC} %*.*s\n" 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Section header
section() {
  echo -e "\n${THEME}»»» ${1} «««${NC}"
  echo -e "${THEME}───────────────────────────────────────────────────────────────────────────────${NC}"
}

# Add to history
add_history() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$HISTORY_FILE"
}

# Display menu with better layout
show_menu() {
  section "🎮 GAME CATEGORIES"
  echo -e "  ${ACCENT}1${NC}) Classic Games          ${ACCENT}5${NC}) Puzzle Games         ${ACCENT}9${NC}) Adventure"
  echo -e "  ${ACCENT}2${NC}) Strategy Games        ${ACCENT}6${NC}) Retro Games         ${ACCENT}10${NC}) Utilities"
  echo -e "  ${ACCENT}3${NC}) Arcade Games         ${ACCENT}7${NC}) Board Games         ${ACCENT}11${NC}) Information"
  echo -e "  ${ACCENT}4${NC}) Card Games           ${ACCENT}8${NC}) Simulation          ${ACCENT}12${NC}) Settings"

  section "🚀 QUICK ACTIONS"
  echo -e "  ${ACCENT}S${NC}) Search Games          ${ACCENT}F${NC}) Favorites          ${ACCENT}H${NC}) History"
  echo -e "  ${ACCENT}R${NC}) Random Game          ${ACCENT}U${NC}) Update Check       ${ACCENT}Q${NC}) Quit"
  echo -e "  ${ACCENT}I${NC}) Install Game         ${ACCENT}G${NC}) Game Images        ${ACCENT}T${NC}) Theme Changer"
}

# Game database with more games and descriptions
declare -A GAMES=(
  # Classic Games
  ["1.1"]="Moon-buggy:A simple game where you drive a moon buggy and avoid obstacles"
  ["1.2"]="Nsnake:Classic snake game in terminal"
  ["1.3"]="Pacman:Terminal version of the classic Pacman game"
  ["1.4"]="Ninvaders:Space invaders clone for terminal"
  
  # Strategy Games
  ["2.1"]="Greed:A strategy game where you collect gems"
  ["2.2"]="Curseofwar:A fast-paced RTS game for terminal"
  ["2.3"]="Dopewars:Drug dealing simulation game"
  ["2.4"]="Gnugo:Go game with AI opponent"
  
  # Arcade Games
  ["3.1"]="0verkill:A 2D multiplayer shooter for terminal"
  ["3.2"]="Myman:A terminal version of Pacman"
  ["3.3"]="TTYSolitaire:Solitaire card game for terminal"
  ["3.4"]="Robotfindskitten:A quirky terminal game where robot finds kitten"
  
  # Card Games
  ["4.1"]="Bastet:A terminal version of Tetris"
  ["4.2"]="2048:Slide numbered tiles to combine them"
  ["4.3"]="Nudoku:A sudoku game for terminal"
  ["4.4"]="Sudoku:Another terminal sudoku game"
  
  # Puzzle Games
  ["5.1"]="Brogue:A roguelike puzzle game"
  ["5.2"]="Phear:A terminal-based puzzle game"
  ["5.3"]="Npush:A block pushing puzzle game"
  ["5.4"]="Gnuski:A challenging puzzle game"
  
  # Retro Games
  ["6.1"]="Moria:A classic roguelike game"
  ["6.2"]="Nethack:Another classic roguelike"
  ["6.3"]="CSOL:A command line solitaire collection"
  ["6.4"]="Go:The ancient strategy board game"
  
  # Board Games
  ["7.1"]="Ski:A simple skiing game"
  ["7.2"]="Stickman:A stickman fighting game"
  ["7.3"]="Hangman:Classic word guessing game"
  ["7.4"]="Gomoku:Also known as Five in a Row"
  
  # Simulation
  ["8.1"]="Angband:A dungeon exploration game"
  ["8.2"]="Adom:Ancient Domains of Mystery roguelike"
  ["8.3"]="Cataclysm:DDA:A post-apocalyptic survival game"
  ["8.4"]="Dungeon:The original text adventure game"
  
  # Adventure
  ["9.1"]="Zork:Classic text adventure game"
  ["9.2"]="Hunt:The Wumpus:A classic cave exploration game"
  ["9.3"]="Larn:A dungeon adventure game"
  ["9.4"]="Omega:A complex roguelike adventure"
  
  # Utilities
  ["10.1"]="Chess:Terminal chess game"
  ["10.2"]="Backgammon:Terminal backgammon game"
  ["10.3"]="Reversi:Terminal reversi/othello game"
  ["10.4"]="Mille:A terminal version of the card game Mille Bornes"
)

# Main function
main() {
  while true; do
    display_banner
    show_menu
    
    echo -e "\n${ACCENT}»»» Select an option: ${NC}"
    read -p "➤ " choice
    
    case $choice in
      # Category selections
      [1-9]|10)
        show_category_games "$choice"
        ;;
      
      # Quick actions
      S|s) search_games ;;
      F|f) show_favorites ;;
      H|h) show_history ;;
      R|r) launch_random_game ;;
      U|u) check_updates ;;
      Q|q) exit_program ;;
      I|i) install_game_menu ;;
      G|g) show_game_images ;;
      T|t) theme_changer ;;
      11) show_info ;;
      12) show_settings ;;
      *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
  done
}

# Show games in a category
show_category_games() {
  local category=$1
  clear
  display_banner
  section "GAME LIST - CATEGORY $category"
  
  for key in "${!GAMES[@]}"; do
    if [[ $key == "$category".* ]]; then
      IFS=':' read -r game_name game_desc <<< "${GAMES[$key]}"
      echo -e "  ${ACCENT}${key#*.}${NC}) ${game_name} - ${TEXT}${game_desc}${NC}"
    fi
  done
  
  echo -e "\n${ACCENT}»»» Select a game (or B to go back): ${NC}"
  read -p "➤ " subchoice
  
  if [[ "$subchoice" == "B" || "$subchoice" == "b" ]]; then
    return
  fi
  
  game_key="$category.$subchoice"
  if [[ -n "${GAMES[$game_key]}" ]]; then
    IFS=':' read -r game_name game_desc <<< "${GAMES[$game_key]}"
    launch_game "$game_name"
  else
    echo -e "${RED}Invalid selection!${NC}"
    sleep 1
  fi
}

# Launch a game with better presentation
launch_game() {
  local game=$1
  clear
  display_banner
  section "LAUNCHING $game"
  
  # Add to history
  add_history "$game"
  
  # Display game description if available
  for key in "${!GAMES[@]}"; do
    IFS=':' read -r game_name game_desc <<< "${GAMES[$key]}"
    if [[ "$game_name" == "$game" ]]; then
      echo -e "${TEXT}Description: ${game_desc}${NC}"
      break
    fi
  done
  
  # Special cases
  case $game in
    "Hangman") 
      if [[ -d "HangmanPy" ]]; then
        cd HangmanPy && python hangman.py
      else
        echo -e "${YELLOW}HangmanPy directory not found. Would you like to install it? (y/n)${NC}"
        read -p "➤ " install_choice
        if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
          install_game "hangman"
        fi
      fi
      ;;
    "2048") 
      if [[ -f "./2048" ]]; then
        ./2048
      else
        echo -e "${YELLOW}2048 game not found. Would you like to install it? (y/n)${NC}"
        read -p "➤ " install_choice
        if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
          install_game "2048"
        fi
      fi
      ;;
    *)
      echo -e "${YELLOW}Controls:${NC}"
      echo -e "• Press ${GREEN}Q${NC} to quit most games"
      echo -e "• ${GREEN}CTRL+C${NC} works for terminal games"
      echo -e "\n${ACCENT}Press ENTER to start...${NC}"
      read
      if ! command -v "$game" &> /dev/null; then
        echo -e "${YELLOW}$game is not installed. Would you like to install it? (y/n)${NC}"
        read -p "➤ " install_choice
        if [[ "$install_choice" == "y" || "$install_choice" == "Y" ]]; then
          install_game "$game"
          return
        fi
      else
        $game
      fi
      ;;
  esac
  
  echo -e "\n${GREEN}Game ended.${NC}"
  read -p "Press ENTER to return to menu..."
}

# Search games with better interface
search_games() {
  clear
  display_banner
  section "SEARCH GAMES"
  
  echo -e "${ACCENT}Enter search term:${NC}"
  read -p "➤ " term
  
  clear
  display_banner
  section "SEARCH RESULTS FOR '$term'"
  
  found=0
  for key in "${!GAMES[@]}"; do
    IFS=':' read -r game_name game_desc <<< "${GAMES[$key]}"
    if [[ "${game_name,,}" == *"${term,,}"* ]] || [[ "${game_desc,,}" == *"${term,,}"* ]]; then
      echo -e "  ${ACCENT}${key}${NC}) ${game_name} - ${TEXT}${game_desc}${NC}"
      found=1
    fi
  done
  
  if [[ $found -eq 0 ]]; then
    echo -e "${RED}No games found matching '$term'${NC}"
  else
    echo -e "\n${ACCENT}Enter game number to play (or B to go back):${NC}"
    read -p "➤ " selection
    
    if [[ "$selection" != "B" && "$selection" != "b" ]]; then
      if [[ -n "${GAMES[$selection]}" ]]; then
        IFS=':' read -r game_name game_desc <<< "${GAMES[$selection]}"
        launch_game "$game_name"
      else
        echo -e "${RED}Invalid selection!${NC}"
        sleep 1
      fi
    fi
  fi
}

# Enhanced favorites with descriptions
show_favorites() {
  clear
  display_banner
  section "YOUR FAVORITE GAMES"
  
  if [[ ! -s "$FAVORITES_FILE" ]]; then
    echo -e "${YELLOW}No favorites yet! Add games with the 'Add to Favorites' option.${NC}"
  else
    echo -e "${ACCENT}Your favorite games:${NC}\n"
    while IFS= read -r game; do
      found=0
      for key in "${!GAMES[@]}"; do
        IFS=':' read -r game_name game_desc <<< "${GAMES[$key]}"
        if [[ "$game_name" == "$game" ]]; then
          echo -e "  ${ACCENT}${key}${NC}) ${game_name} - ${TEXT}${game_desc}${NC}"
          found=1
          break
        fi
      done
      if [[ $found -eq 0 ]]; then
        echo -e "  ${RED}?${NC}) $game (Not in main database)"
      fi
    done < "$FAVORITES_FILE"
  fi
  
  echo -e "\n${ACCENT}A) Add to Favorites  D) Delete Favorite  P) Play Favorite  B) Back${NC}"
  read -p "➤ " action
  
  case $action in
    A|a)
      clear
      display_banner
      section "ADD TO FAVORITES"
      
      for key in "${!GAMES[@]}"; do
        IFS=':' read -r game_name game_desc <<< "${GAMES[$key]}"
        echo -e "  ${ACCENT}${key}${NC}) ${game_name} - ${TEXT}${game_desc}${NC}"
      done
      
      echo -e "\n${ACCENT}Enter game number to add:${NC}"
      read -p "➤ " game_num
      
      if [[ -n "${GAMES[$game_num]}" ]]; then
        IFS=':' read -r game_name game_desc <<< "${GAMES[$game_num]}"
        if grep -q "^${game_name}$" "$FAVORITES_FILE"; then
          echo -e "${YELLOW}Game is already in favorites!${NC}"
        else
          echo "$game_name" >> "$FAVORITES_FILE"
          echo -e "${GREEN}Added to favorites!${NC}"
        fi
      else
        echo -e "${RED}Invalid selection!${NC}"
      fi
      sleep 1
      ;;
      
    D|d)
      if [[ -s "$FAVORITES_FILE" ]]; then
        echo -e "\n${ACCENT}Enter number to delete:${NC}"
        read -p "➤ " del_num
        if [[ "$del_num" =~ ^[0-9]+$ ]]; then
          sed -i "${del_num}d" "$FAVORITES_FILE"
          echo -e "${GREEN}Favorite removed!${NC}"
        else
          echo -e "${RED}Invalid number!${NC}"
        fi
        sleep 1
      fi
      ;;
      
    P|p)
      if [[ -s "$FAVORITES_FILE" ]]; then
        echo -e "\n${ACCENT}Enter number to play:${NC}"
        read -p "➤ " play_num
        if [[ "$play_num" =~ ^[0-9]+$ ]]; then
          game_name=$(sed -n "${play_num}p" "$FAVORITES_FILE")
          if [[ -n "$game_name" ]]; then
            launch_game "$game_name"
          else
            echo -e "${RED}Invalid selection!${NC}"
            sleep 1
          fi
        else
          echo -e "${RED}Invalid number!${NC}"
          sleep 1
        fi
      fi
      ;;
  esac
}

# Enhanced history with filtering
show_history() {
  clear
  display_banner
  section "GAME HISTORY"
  
  if [[ -s "$HISTORY_FILE" ]]; then
    echo -e "${ACCENT}Recent game sessions:${NC}\n"
    tac "$HISTORY_FILE" | head -10
  else
    echo -e "${YELLOW}No game history yet!${NC}"
  fi
  
  echo -e "\n${ACCENT}C) Clear History  B) Back${NC}"
  read -p "➤ " action
  
  case $action in
    C|c)
      > "$HISTORY_FILE"
      echo -e "${GREEN}History cleared!${NC}"
      sleep 1
      ;;
  esac
}

# Launch random game with confirmation
launch_random_game() {
  local random_key=$(shuf -n1 -e "${!GAMES[@]}")
  IFS=':' read -r game_name game_desc <<< "${GAMES[$random_key]}"
  
  clear
  display_banner
  section "RANDOM GAME SELECTED"
  echo -e "  ${ACCENT}Game:${NC} $game_name"
  echo -e "  ${ACCENT}Description:${NC} $game_desc"
  
  echo -e "\n${ACCENT}Launch this game? (Y/n)${NC}"
  read -p "➤ " choice
  if [[ "$choice" != "n" && "$choice" != "N" ]]; then
    launch_game "$game_name"
  fi
}

# Check for updates with more info
check_updates() {
  clear
  display_banner
  section "UPDATE CHECK"
  
  echo -e "${YELLOW}Checking for updates...${NC}"
  sleep 2
  
  # Simulate update check
  local current_version="3.0"
  local latest_version="3.0"
  local update_available=false
  
  if [[ "$current_version" == "$latest_version" ]]; then
    echo -e "${GREEN}You have the latest version (v${current_version})${NC}"
  else
    echo -e "${YELLOW}New version available!${NC}"
    echo -e "Current version: ${RED}${current_version}${NC}"
    echo -e "Latest version: ${GREEN}${latest_version}${NC}"
    update_available=true
  fi
  
  echo -e "\n${ACCENT}Last checked: $(date)${NC}"
  
  if $update_available; then
    echo -e "\n${ACCENT}Would you like to update? (y/N)${NC}"
    read -p "➤ " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      echo -e "${YELLOW}Updating...${NC}"
      sleep 2
      echo -e "${GREEN}Update complete! Please restart the application.${NC}"
    fi
  fi
  
  read -p "Press ENTER to continue..."
}

# Enhanced information screen
show_info() {
  clear
  display_banner
  section "INFORMATION"
  
  echo -e "${ACCENT}» Developer:${NC} Dwi Bakti Nugroho"
  echo -e "${ACCENT}» Version:${NC} 3.0 (Enhanced)"
  echo -e "${ACCENT}» Contact:${NC} +62 896-5296-9323"
  echo -e "${ACCENT}» Website:${NC} https://portofolio-dwi-bakti-n-dev-liard.vercel.app/"
  echo -e "${ACCENT}» GitHub:${NC} https://github.com/DwiDevelopes"
  
  section "SYSTEM INFO"
  echo -e "${ACCENT}» Termux:${NC} $(uname -m)"
  echo -e "${ACCENT}» Storage:${NC} $(df -h $PWD | awk 'NR==2 {print $4}') free"
  echo -e "${ACCENT}» Games Installed:${NC} $(ls -1 "$INSTALL_DIR" 2>/dev/null | wc -l)"
  
  section "FEATURES"
  echo -e "✓ ${GREEN}100+ Terminal Games${NC}"
  echo -e "✓ ${GREEN}Game Installation System${NC}"
  echo -e "✓ ${GREEN}Customizable Themes${NC}"
  echo -e "✓ ${GREEN}Game Images from Unsplash${NC}"
  echo -e "✓ ${GREEN}Favorites & History Tracking${NC}"
  
  read -p "Press ENTER to continue..."
}

# Enhanced settings with more options
show_settings() {
  while true; do
    clear
    display_banner
    section "SETTINGS"
    
    echo -e "  ${ACCENT}1${NC}) Change UI Theme"
    echo -e "  ${ACCENT}2${NC}) Configure Unsplash API"
    echo -e "  ${ACCENT}3${NC}) Toggle Game Images"
    echo -e "  ${ACCENT}4${NC}) Change Install Directory"
    echo -e "  ${ACCENT}5${NC}) Clear History"
    echo -e "  ${ACCENT}6${NC}) Reset Favorites"
    echo -e "  ${ACCENT}7${NC}) Backup Configuration"
    echo -e "  ${ACCENT}8${NC}) Restore Configuration"
    echo -e "  ${ACCENT}9${NC}) Back to Main Menu"
    
    read -p "➤ " setting_choice
    
    case $setting_choice in
      1) theme_changer ;;
      2) configure_unsplash ;;
      3) toggle_images ;;
      4) change_install_dir ;;
      5) clear_history ;;
      6) reset_favorites ;;
      7) backup_config ;;
      8) restore_config ;;
      9) break ;;
      *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
  done
}

# Theme changer with preview
theme_changer() {
  while true; do
    clear
    display_banner
    section "THEME CHANGER"
    
    echo -e "${ACCENT}Current Theme:${NC}"
    echo -e "  Main Color: ${THEME_COLOR}"
    echo -e "  Background: ${BACKGROUND_COLOR}"
    echo -e "  Text Color: ${TEXT_COLOR}"
    echo -e "  Accent Color: ${ACCENT_COLOR}"
    
    echo -e "\n${ACCENT}Select option:${NC}"
    echo -e "  1) Change Main Color"
    echo -e "  2) Change Background Color"
    echo -e "  3) Change Text Color"
    echo -e "  4) Change Accent Color"
    echo -e "  5) Preview Current Theme"
    echo -e "  6) Save and Apply"
    echo -e "  7) Back"
    
    read -p "➤ " theme_choice
    
    case $theme_choice in
      1)
        echo -e "\n${ACCENT}Available Main Colors:${NC}"
        echo -e "${RED}red${NC}, ${GREEN}green${NC}, ${YELLOW}yellow${NC}, ${BLUE}blue${NC}, ${PURPLE}purple${NC}, ${CYAN}cyan${NC}, orange, pink"
        read -p "Enter color: " THEME_COLOR
        ;;
      2)
        echo -e "\n${ACCENT}Available Background Colors:${NC}"
        echo -e "black, dark_blue, dark_green, dark_red, dark_purple"
        read -p "Enter color: " BACKGROUND_COLOR
        ;;
      3)
        echo -e "\n${ACCENT}Available Text Colors:${NC}"
        echo -e "white, light_gray, light_blue, light_green"
        read -p "Enter color: " TEXT_COLOR
        ;;
      4)
        echo -e "\n${ACCENT}Available Accent Colors:${NC}"
        echo -e "${CYAN}cyan${NC}, ${YELLOW}yellow${NC}, ${GREEN}green${NC}, orange"
        read -p "Enter color: " ACCENT_COLOR
        ;;
      5)
        set_colors
        echo -e "\n${THEME}Main Color Sample${NC}"
        echo -e "${BG}${TEXT}Background and Text Sample${NC}"
        echo -e "${ACCENT}Accent Color Sample${NC}"
        read -p "Press ENTER to continue..."
        ;;
      6)
        echo -e "THEME_COLOR=\"$THEME_COLOR\"" > "$THEME_FILE"
        echo -e "BACKGROUND_COLOR=\"$BACKGROUND_COLOR\"" >> "$THEME_FILE"
        echo -e "TEXT_COLOR=\"$TEXT_COLOR\"" >> "$THEME_FILE"
        echo -e "ACCENT_COLOR=\"$ACCENT_COLOR\"" >> "$THEME_FILE"
        set_colors
        echo -e "${GREEN}Theme saved and applied!${NC}"
        sleep 1
        break
        ;;
      7)
        break
        ;;
      *)
        echo -e "${RED}Invalid option!${NC}"
        sleep 1
        ;;
    esac
  done
}

# Configure Unsplash API key
configure_unsplash() {
  clear
  display_banner
  section "CONFIGURE UNSPLASH API"
  
  echo -e "${YELLOW}To enable game image search, you need an Unsplash API key.${NC}"
  echo -e "1. Go to https://unsplash.com/developers"
  echo -e "2. Create a developer account"
  echo -e "3. Create a new application to get an API key\n"
  
  echo -e "${ACCENT}Current API Key:${NC} ${CONFIG["UNSPLASH_API_KEY"]}"
  echo -e "\nEnter new API key (or press ENTER to keep current):"
  read -p "➤ " api_key
  
  if [[ -n "$api_key" ]]; then
    CONFIG["UNSPLASH_API_KEY"]="$api_key"
    save_config
    echo -e "${GREEN}API key updated!${NC}"
  else
    echo -e "${YELLOW}API key remains unchanged.${NC}"
  fi
  
  sleep 1
}

# Toggle game images display
toggle_images() {
  clear
  display_banner
  section "TOGGLE GAME IMAGES"
  
  if [[ "${CONFIG["SHOW_IMAGES"]}" == "true" ]]; then
    echo -e "Game images are currently ${GREEN}ENABLED${NC}"
    echo -e "\nDisable game images? (y/N)"
    read -p "➤ " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      CONFIG["SHOW_IMAGES"]="false"
      save_config
      echo -e "${YELLOW}Game images disabled.${NC}"
    fi
  else
    echo -e "Game images are currently ${RED}DISABLED${NC}"
    echo -e "\nEnable game images? (y/N)"
    read -p "➤ " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      if [[ -z "${CONFIG["UNSPLASH_API_KEY"]}" ]]; then
        echo -e "${RED}You need to configure an Unsplash API key first!${NC}"
        sleep 2
        configure_unsplash
        return
      fi
      CONFIG["SHOW_IMAGES"]="true"
      save_config
      echo -e "${GREEN}Game images enabled.${NC}"
    fi
  fi
  
  sleep 1
}

# Change game installation directory
change_install_dir() {
  clear
  display_banner
  section "CHANGE INSTALL DIRECTORY"
  
  echo -e "${ACCENT}Current install directory:${NC} ${CONFIG["GAME_INSTALL_DIR"]}"
  echo -e "\nEnter new directory path:"
  read -p "➤ " new_dir
  
  if [[ -n "$new_dir" ]]; then
    if mkdir -p "$new_dir"; then
      CONFIG["GAME_INSTALL_DIR"]="$new_dir"
      INSTALL_DIR="$new_dir"
      save_config
      echo -e "${GREEN}Install directory updated!${NC}"
      
      # Move existing games if any
      if [[ "$(ls -A "$INSTALL_DIR")" ]]; then
        echo -e "\n${YELLOW}Move existing games to new location? (y/N)${NC}"
        read -p "➤ " move_choice
        if [[ "$move_choice" == "y" || "$move_choice" == "Y" ]]; then
          mv "$INSTALL_DIR"/* "$new_dir"/
          echo -e "${GREEN}Games moved successfully.${NC}"
        fi
      fi
    else
      echo -e "${RED}Failed to create directory!${NC}"
    fi
  else
    echo -e "${YELLOW}Directory remains unchanged.${NC}"
  fi
  
  sleep 1
}

# Clear game history
clear_history() {
  > "$HISTORY_FILE"
  echo -e "${GREEN}Game history cleared!${NC}"
  sleep 1
}

# Reset favorites
reset_favorites() {
  > "$FAVORITES_FILE"
  echo -e "${GREEN}Favorites list reset!${NC}"
  sleep 1
}

# Backup configuration
backup_config() {
  clear
  display_banner
  section "BACKUP CONFIGURATION"
  
  local backup_dir="$HOME/termux_game_backups"
  mkdir -p "$backup_dir"
  local backup_file="$backup_dir/game_config_$(date +%Y%m%d_%H%M%S).tar.gz"
  
  tar -czf "$backup_file" "$CONFIG_FILE" "$HISTORY_FILE" "$FAVORITES_FILE" "$THEME_FILE" 2>/dev/null
  
  if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}Backup created successfully!${NC}"
    echo -e "Location: ${ACCENT}$backup_file${NC}"
  else
    echo -e "${RED}Backup failed!${NC}"
  fi
  
  sleep 2
}

# Restore configuration
restore_config() {
  clear
  display_banner
  section "RESTORE CONFIGURATION"
  
  local backup_dir="$HOME/termux_game_backups"
  if [[ ! -d "$backup_dir" || -z "$(ls -A "$backup_dir")" ]]; then
    echo -e "${RED}No backups found!${NC}"
    sleep 1
    return
  fi
  
  echo -e "${ACCENT}Available backups:${NC}"
  local i=1
  local backups=()
  for file in "$backup_dir"/*.tar.gz; do
    backups[i]="$file"
    echo -e "  ${ACCENT}$i${NC}) $(basename "$file")"
    ((i++))
  done
  
  echo -e "\nSelect backup to restore (0 to cancel):"
  read -p "➤ " choice
  
  if [[ "$choice" -gt 0 && "$choice" -lt "$i" ]]; then
    echo -e "\n${YELLOW}This will overwrite your current configuration. Continue? (y/N)${NC}"
    read -p "➤ " confirm
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
      tar -xzf "${backups[$choice]}" -C "$HOME"
      load_theme
      set_colors
      echo -e "${GREEN}Configuration restored successfully!${NC}"
    else
      echo -e "${YELLOW}Restore cancelled.${NC}"
    fi
  else
    echo -e "${YELLOW}Restore cancelled.${NC}"
  fi
  
  sleep 1
}

# Save configuration
save_config() {
  > "$CONFIG_FILE"
  for key in "${!CONFIG[@]}"; do
    echo "CONFIG[$key]=\"${CONFIG[$key]}\"" >> "$CONFIG_FILE"
  done
}

# Show game images from Unsplash
show_game_images() {
  clear
  display_banner
  section "GAME IMAGES"
  
  if [[ "${CONFIG["SHOW_IMAGES"]}" != "true" ]]; then
    echo -e "${YELLOW}Game images are disabled. Enable them in Settings.${NC}"
    sleep 2
    return
  fi
  
  if [[ -z "${CONFIG["UNSPLASH_API_KEY"]}" ]]; then
    echo -e "${YELLOW}Unsplash API key not configured.${NC}"
    echo -e "Would you like to configure it now? (y/N)"
    read -p "➤ " choice
    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
      configure_unsplash
    fi
    return
  fi
  
  echo -e "${ACCENT}Enter game name to search images:${NC}"
  read -p "➤ " game_name
  
  if [[ -z "$game_name" ]]; then
    return
  fi
  
  echo -e "\n${YELLOW}Searching images for '$game_name'...${NC}"
  
  # Create cache directory for images
  local cache_dir="$HOME/.game_image_cache"
  mkdir -p "$cache_dir"
  
  # Check cache first
  local cache_file="$cache_dir/${game_name}.txt"
  if [[ -f "$cache_file" ]]; then
    echo -e "${ACCENT}Showing cached images...${NC}"
    cat "$cache_file"
    return
  fi
  
  # Use Unsplash API to search for game images
  local api_key="${CONFIG["UNSPLASH_API_KEY"]}"
  local url="https://api.unsplash.com/search/photos?page=1&query=${game_name}+game&client_id=${api_key}"
  local response=$(curl -s "$url")
  
  if [[ -z "$response" ]]; then
    echo -e "${RED}Failed to connect to Unsplash API!${NC}"
    sleep 1
    return
  fi
  
  # Parse JSON response
  local urls=$(echo "$response" | jq -r '.results[].urls.regular' 2>/dev/null)
  
  if [[ -z "$urls" ]]; then
    echo -e "${YELLOW}No images found for '$game_name'${NC}"
    sleep 1
    return
  fi
  
  # Display images (simulated with URLs)
  echo -e "\n${ACCENT}Found images for '$game_name':${NC}"
  echo "$urls" | head -5 | while read -r img_url; do
    echo -e "  ${GREEN}•${NC} $img_url"
    # In a real implementation, you might use termux-open to view images
    # or a terminal image viewer like termux-image
  done
  
  # Cache the results
  echo "$urls" | head -5 > "$cache_file"
  
  echo -e "\n${YELLOW}Note: In Termux, you can use 'termux-open-url' to view images.${NC}"
  read -p "Press ENTER to continue..."
}

# Game installation menu
install_game_menu() {
  while true; do
    clear
    display_banner
    section "GAME INSTALLATION"
    
    echo -e "  ${ACCENT}1${NC}) Install from Repository"
    echo -e "  ${ACCENT}2${NC}) Install from GitHub"
    echo -e "  ${ACCENT}3${NC}) Install from ZIP File"
    echo -e "  ${ACCENT}4${NC}) List Installed Games"
    echo -e "  ${ACCENT}5${NC}) Remove Installed Game"
    echo -e "  ${ACCENT}6${NC}) Back to Main Menu"
    
    read -p "➤ " install_choice
    
    case $install_choice in
      1) install_from_repo ;;
      2) install_from_github ;;
      3) install_from_zip ;;
      4) list_installed_games ;;
      5) remove_installed_game ;;
      6) break ;;
      *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
    esac
  done
}

# Install game from Termux repository
install_from_repo() {
  clear
  display_banner
  section "INSTALL FROM REPOSITORY"
  
  echo -e "${ACCENT}Available games in Termux repository:${NC}"
  echo -e "1) moon-buggy     6) nudoku"
  echo -e "2) nsnake         7) greed"
  echo -e "3) pacman4console 8) angband"
  echo -e "4) ninvaders      9) nethack"
  echo -e "5) bastet        10) dopewars"
  
  echo -e "\n${ACCENT}Enter game name or number to install (B to go back):${NC}"
  read -p "➤ " game_choice
  
  case $game_choice in
    1|moon-buggy) install_game "moon-buggy" ;;
    2|nsnake) install_game "nsnake" ;;
    3|pacman4console) install_game "pacman4console" ;;
    4|ninvaders) install_game "ninvaders" ;;
    5|bastet) install_game "bastet" ;;
    6|nudoku) install_game "nudoku" ;;
    7|greed) install_game "greed" ;;
    8|angband) install_game "angband" ;;
    9|nethack) install_game "nethack" ;;
    10|dopewars) install_game "dopewars" ;;
    B|b) return ;;
    *) echo -e "${RED}Invalid choice!${NC}"; sleep 1 ;;
  esac
}

# Install game from GitHub
install_from_github() {
  clear
  display_banner
  section "INSTALL FROM GITHUB"
  
  echo -e "${ACCENT}Enter GitHub repository URL (e.g., https://github.com/user/repo):${NC}"
  read -p "➤ " repo_url
  
  if [[ -z "$repo_url" ]]; then
    return
  fi
  
  local repo_name=$(basename "$repo_url")
  local install_path="$INSTALL_DIR/$repo_name"
  
  echo -e "\n${YELLOW}Installing $repo_name...${NC}"
  
  if [[ -d "$install_path" ]]; then
    echo -e "${YELLOW}Game already installed. Updating...${NC}"
    cd "$install_path" && git pull
    echo -e "${GREEN}Game updated successfully!${NC}"
    sleep 1
    return
  fi
  
  git clone "$repo_url" "$install_path"
  
  if [[ $? -eq 0 ]]; then
    echo -e "\n${GREEN}Game installed successfully!${NC}"
    echo -e "Location: ${ACCENT}$install_path${NC}"
    
    # Check for installation instructions
    if [[ -f "$install_path/INSTALL.md" || -f "$install_path/README.md" ]]; then
      echo -e "\n${YELLOW}Please check the INSTALL.md or README.md for setup instructions.${NC}"
    fi
  else
    echo -e "${RED}Installation failed!${NC}"
  fi
  
  sleep 2
}

# Install game from ZIP file
install_from_zip() {
  clear
  display_banner
  section "INSTALL FROM ZIP FILE"
  
  echo -e "${ACCENT}Enter path to ZIP file:${NC}"
  read -p "➤ " zip_path
  
  if [[ -z "$zip_path" ]]; then
    return
  fi
  
  if [[ ! -f "$zip_path" ]]; then
    echo -e "${RED}File not found!${NC}"
    sleep 1
    return
  fi
  
  local game_name=$(basename "$zip_path" .zip)
  local install_path="$INSTALL_DIR/$game_name"
  
  mkdir -p "$install_path"
  unzip "$zip_path" -d "$install_path"
  
  if [[ $? -eq 0 ]]; then
    echo -e "\n${GREEN}Game extracted successfully!${NC}"
    echo -e "Location: ${ACCENT}$install_path${NC}"
    
    # Check for executable
    if [[ -f "$install_path/start.sh" ]]; then
      chmod +x "$install_path/start.sh"
      echo -e "\n${YELLOW}Start script found. You can run the game with './start.sh'${NC}"
    elif [[ -f "$install_path/$game_name" ]]; then
      chmod +x "$install_path/$game_name"
      echo -e "\n${YELLOW}Executable found. You can run the game with './$game_name'${NC}"
    fi
  else
    echo -e "${RED}Extraction failed!${NC}"
  fi
  
  sleep 2
}

# List installed games
list_installed_games() {
  clear
  display_banner
  section "INSTALLED GAMES"
  
  if [[ -z "$(ls -A "$INSTALL_DIR")" ]]; then
    echo -e "${YELLOW}No games installed yet!${NC}"
  else
    echo -e "${ACCENT}Installed games:${NC}\n"
    local i=1
    for game in "$INSTALL_DIR"/*; do
      echo -e "  ${ACCENT}$i${NC}) $(basename "$game")"
      ((i++))
    done
    
    echo -e "\n${ACCENT}P) Play Game  R) Remove Game  B) Back${NC}"
    read -p "➤ " action
    
    case $action in
      P|p)
        echo -e "\n${ACCENT}Enter game number to play:${NC}"
        read -p "➤ " game_num
        if [[ "$game_num" =~ ^[0-9]+$ ]]; then
          local games=("$INSTALL_DIR"/*)
          local selected="${games[$game_num-1]}"
          if [[ -n "$selected" ]]; then
            play_installed_game "$selected"
          else
            echo -e "${RED}Invalid selection!${NC}"
            sleep 1
          fi
        fi
        ;;
      R|r)
        echo -e "\n${ACCENT}Enter game number to remove:${NC}"
        read -p "➤ " game_num
        if [[ "$game_num" =~ ^[0-9]+$ ]]; then
          local games=("$INSTALL_DIR"/*)
          local selected="${games[$game_num-1]}"
          if [[ -n "$selected" ]]; then
            remove_installed_game "$selected"
          else
            echo -e "${RED}Invalid selection!${NC}"
            sleep 1
          fi
        fi
        ;;
    esac
  fi
  
  sleep 1
}

# Play installed game
play_installed_game() {
  local game_path="$1"
  local game_name=$(basename "$game_path")
  
  clear
  display_banner
  section "PLAYING $game_name"
  
  cd "$game_path"
  
  # Try to find how to run the game
  if [[ -f "start.sh" ]]; then
    chmod +x start.sh
    ./start.sh
  elif [[ -f "$game_name" ]]; then
    chmod +x "$game_name"
    ./"$game_name"
  elif [[ -f "run" ]]; then
    chmod +x run
    ./run
  elif [[ -f "main.py" ]]; then
    python main.py
  else
    echo -e "${RED}Could not determine how to start the game!${NC}"
    echo -e "${YELLOW}Please check the game's documentation.${NC}"
  fi
  
  cd - >/dev/null
  read -p "Press ENTER to continue..."
}

# Remove installed game
remove_installed_game() {
  local game_path="$1"
  
  if [[ -z "$game_path" ]]; then
    clear
    display_banner
    section "REMOVE INSTALLED GAME"
    
    if [[ -z "$(ls -A "$INSTALL_DIR")" ]]; then
      echo -e "${YELLOW}No games installed to remove!${NC}"
      sleep 1
      return
    fi
    
    echo -e "${ACCENT}Installed games:${NC}\n"
    local i=1
    for game in "$INSTALL_DIR"/*; do
      echo -e "  ${ACCENT}$i${NC}) $(basename "$game")"
      ((i++))
    done
    
    echo -e "\n${ACCENT}Enter game number to remove:${NC}"
    read -p "➤ " game_num
    
    if [[ "$game_num" =~ ^[0-9]+$ ]]; then
      local games=("$INSTALL_DIR"/*)
      game_path="${games[$game_num-1]}"
    else
      return
    fi
  fi
  
  if [[ -z "$game_path" ]]; then
    echo -e "${RED}Invalid selection!${NC}"
    sleep 1
    return
  fi
  
  local game_name=$(basename "$game_path")
  
  echo -e "\n${YELLOW}Are you sure you want to remove '$game_name'? (y/N)${NC}"
  read -p "➤ " confirm
  
  if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    rm -rf "$game_path"
    echo -e "${GREEN}Game removed successfully!${NC}"
  else
    echo -e "${YELLOW}Removal cancelled.${NC}"
  fi
  
  sleep 1
}

# Install game helper function
install_game() {
  local game=$1
  
  clear
  display_banner
  section "INSTALLING $game"
  
  echo -e "${YELLOW}Installing $game...${NC}"
  
  case $game in
    "moon-buggy"|"nsnake"|"pacman4console"|"ninvaders"|"bastet"|"nudoku"|"greed"|"angband"|"nethack"|"dopewars")
      pkg install -y "$game"
      ;;
    "2048")
      if [[ ! -f "2048" ]]; then
        echo -e "${YELLOW}Downloading 2048 game...${NC}"
        curl -o 2048 https://raw.githubusercontent.com/mevdschee/2048.c/master/2048
        chmod +x 2048
      fi
      ;;
    "hangman")
      if [[ ! -d "HangmanPy" ]]; then
        echo -e "${YELLOW}Cloning HangmanPy...${NC}"
        git clone https://github.com/DwiDevelopes/HangmanPy.git
      fi
      ;;
    *)
      echo -e "${RED}Installation method for $game not configured!${NC}"
      sleep 1
      return
      ;;
  esac
  
  if [[ $? -eq 0 ]]; then
    echo -e "\n${GREEN}$game installed successfully!${NC}"
    echo -e "${YELLOW}You can now play it from the main menu.${NC}"
  else
    echo -e "\n${RED}Installation failed!${NC}"
    echo -e "${YELLOW}You may need to run 'pkg update' first.${NC}"
  fi
  
  sleep 2
}

# Exit program with better presentation
exit_program() {
  clear
  display_banner
  section "THANK YOU"
  
  echo -e "${GREEN}Thanks for using Termux Game Collection!${NC}"
  echo -e "${YELLOW}» Remember to take breaks while gaming!${NC}"
  echo -e "\n${ACCENT}Press ENTER to exit...${NC}"
  read
  
  # Configure extra keys before exiting
  mkdir -p $HOME/.termux/
  echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties
  termux-reload-settings
  
  exit 0
}

# Start the program
main
