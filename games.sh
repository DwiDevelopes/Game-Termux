#!/bin/bash

# Termux Games Menu - Professional Edition
# Original by: dwi bakti n dev
# Enhanced with professional UI, history tracking, clock, and favorites

# Initialize variables
GAMES_DIR="$HOME/termux-games"
HISTORY_FILE="$GAMES_DIR/game_history.log"
FAVORITES_FILE="$GAMES_DIR/favorites.list"
mkdir -p "$GAMES_DIR"
touch "$HISTORY_FILE"
touch "$FAVORITES_FILE"

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Function to log game play
log_game() {
    local game_name="$1"
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] Played: $game_name" >> "$HISTORY_FILE"
}

# Function to add to favorites
add_to_favorites() {
    local game_name="$1"
    if ! grep -q "^$game_name$" "$FAVORITES_FILE"; then
        echo "$game_name" >> "$FAVORITES_FILE"
        echo -e "${GREEN}Added to favorites!${NC}"
    else
        echo -e "${YELLOW}Already in favorites!${NC}"
    fi
}

# Function to remove from favorites
remove_from_favorites() {
    local game_name="$1"
    if grep -q "^$game_name$" "$FAVORITES_FILE"; then
        sed -i "/^$game_name$/d" "$FAVORITES_FILE"
        echo -e "${RED}Removed from favorites!${NC}"
    else
        echo -e "${YELLOW}Not in favorites!${NC}"
    fi
}

# Function to check if game is favorite
is_favorite() {
    local game_name="$1"
    grep -q "^$game_name$" "$FAVORITES_FILE"
    return $?
}

# Function to display centered text with color
center_text() {
    local text="$1"
    local color="$2"
    local cols=$(tput cols)
    printf "${color}%*s${NC}\n" $(( (${#text} + cols) / 2 )) "$text"
}

# Function to display header with clock
display_header() {
    clear
    # Top border
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════════════════════╗${NC}"
    
    # Title with clock
    local title="TERMUX GAMES MENU v2.2.1"
    local clock=$(date +"%H:%M:%S")
    local header_line=$(printf "║ %-50s %15s ║" "$title" "$clock")
    echo -e "${BLUE}${header_line}${NC}"
    
    # Subtitle
    center_text "PROFESSIONAL EDITION" "${PURPLE}"
    echo -e "${BLUE}╠════════════════════════════════════════════════════════════════════════════╣${NC}"
    
    # Author info
    center_text "Developed by: Dwi Bakti Nugroho" "${CYAN}"
    center_text "Website: https://linkr.bio/BangRoy.go.id" "${YELLOW}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo
}

# Function to display game history
show_history() {
    clear
    echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                     GAME PLAY HISTORY                      ║${NC}"
    echo -e "${PURPLE}╠════════════════════════════════════════════════════════════╣${NC}"
    
    if [ -s "$HISTORY_FILE" ]; then
        # Show last 10 entries
        tail -n 10 "$HISTORY_FILE" | while read -r line; do
            echo -e "${BLUE}║ ${CYAN}$line${BLUE} ║${NC}"
        done
    else
        echo -e "${BLUE}║ ${YELLOW}No game history yet. Play some games!${BLUE}               ║${NC}"
    fi
    
    echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press [ENTER] to continue: "
}

# Function to display favorites
show_favorites() {
    clear
    echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${PURPLE}║                      FAVORITE GAMES                       ║${NC}"
    echo -e "${PURPLE}╠════════════════════════════════════════════════════════════╣${NC}"
    
    if [ -s "$FAVORITES_FILE" ]; then
        local count=1
        while read -r game; do
            echo -e "${BLUE}║ ${GREEN}[$count] ${YELLOW}$game${BLUE} ║${NC}"
            ((count++))
        done < "$FAVORITES_FILE"
    else
        echo -e "${BLUE}║ ${YELLOW}No favorites yet. Add some games!${BLUE}                  ║${NC}"
    fi
    
    echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${GREEN}Options:${NC}"
    echo -e " [1-9] Play favorite game"
    echo -e " [C] Clear favorites"
    echo -e " [B] Back to main menu"
    
    read -p "Enter your choice: " choice
    
    case $choice in
        [1-9])
            local line=$(sed "${choice}q;d" "$FAVORITES_FILE" 2>/dev/null)
            if [ -n "$line" ]; then
                play_game_by_name "$line"
            else
                echo -e "${RED}Invalid selection!${NC}"
                sleep 1
            fi
            ;;
        c|C)
            > "$FAVORITES_FILE"
            echo -e "${GREEN}Favorites cleared!${NC}"
            sleep 1
            ;;
        b|B)
            return
            ;;
        *)
            echo -e "${RED}Invalid choice!${NC}"
            sleep 1
            ;;
    esac
}

# Function to play game by name
play_game_by_name() {
    local game_name="$1"
    log_game "$game_name"
    
    case "$game_name" in
        "Moon-buggy")
            echo -e "${CYAN}Press q to exit the game${NC}"
            read -p "Press [ENTER] to start Moon-buggy: "
            moon-buggy
            ;;
        "Tetris")
            echo -e "${CYAN}Press CTRL+c to exit the game${NC}"
            read -p "Press [ENTER] to start Tetris: "
            bastet || echo -e "${RED}Tetris game not found! Try installing 'bastet' package.${NC}"
            ;;
        "Pacman")
            echo -e "${CYAN}Press q to exit the game${NC}"
            read -p "Press [ENTER] to start Pacman: "
            pacman4console || echo -e "${RED}Pacman game not found! Try installing 'pacman4console' package.${NC}"
            ;;
        # Add other games here following the same pattern
        *)
            echo -e "${RED}Game launcher not configured for: $game_name${NC}"
            sleep 2
            ;;
    esac
}

# Main menu
while true; do
    display_header
    
    # Current date and time
    echo -e "${GREEN}$(date +"%A, %B %d %Y")${NC}"
    echo
    
    # Main menu options
    echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║ ${GREEN}MAIN MENU ${BLUE}║${NC}"
    echo -e "${BLUE}╠════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${BLUE}║ ${YELLOW}[1] ${CYAN}All Games List                            ${BLUE}║${NC}"
    echo -e "${BLUE}║ ${YELLOW}[2] ${CYAN}Favorites                                 ${BLUE}║${NC}"
    echo -e "${BLUE}║ ${YELLOW}[3] ${CYAN}Game History                              ${BLUE}║${NC}"
    echo -e "${BLUE}║ ${YELLOW}[4] ${CYAN}About Developer                           ${BLUE}║${NC}"
    echo -e "${BLUE}║ ${YELLOW}[5] ${CYAN}Exit                                      ${BLUE}║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
    
    read -p "Enter your choice (1-5): " main_choice
    
    case $main_choice in
        1)  # All Games List
            while true; do
                display_header
                
                # Game categories
                echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
                echo -e "${PURPLE}║ ${GREEN}GAME CATEGORIES ${PURPLE}║${NC}"
                echo -e "${PURPLE}╠════════════════════════════════════════════════════════════╣${NC}"
                echo -e "${PURPLE}║ ${YELLOW}[1] ${CYAN}Classic Games                              ${PURPLE}║${NC}"
                echo -e "${PURPLE}║ ${YELLOW}[2] ${CYAN}Puzzle Games                               ${PURPLE}║${NC}"
                echo -e "${PURPLE}║ ${YELLOW}[3] ${CYAN}Strategy Games                             ${PURPLE}║${NC}"
                echo -e "${PURPLE}║ ${YELLOW}[4] ${CYAN}Back to Main Menu                          ${PURPLE}║${NC}"
                echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
                
                read -p "Select category (1-4): " category
                
                case $category in
                    1)  # Classic Games
                        while true; do
                            display_header
                            echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
                            echo -e "${BLUE}║ ${GREEN}CLASSIC GAMES ${BLUE}║${NC}"
                            echo -e "${BLUE}╠════════════════════════════════════════════════════════════╣${NC}"
                            echo -e "${BLUE}║ ${YELLOW}[1] ${CYAN}Moon-buggy       ${YELLOW}[6] ${CYAN}Greed          ${BLUE}║${NC}"
                            echo -e "${BLUE}║ ${YELLOW}[2] ${CYAN}Tetris           ${YELLOW}[7] ${CYAN}Nethack        ${BLUE}║${NC}"
                            echo -e "${BLUE}║ ${YELLOW}[3] ${CYAN}Pacman           ${YELLOW}[8] ${CYAN}Hangman        ${BLUE}║${NC}"
                            echo -e "${BLUE}║ ${YELLOW}[4] ${CYAN}Space-Invaders   ${YELLOW}[9] ${CYAN}2048           ${BLUE}║${NC}"
                            echo -e "${BLUE}║ ${YELLOW}[5] ${CYAN}Snake-Game       ${YELLOW}[0] ${CYAN}Back           ${BLUE}║${NC}"
                            echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
                            
                            read -p "Select game (1-9, 0 to back): " game_choice
                            
                            case $game_choice in
                                1) play_game_by_name "Moon-buggy" ;;
                                2) play_game_by_name "Tetris" ;;
                                3) play_game_by_name "Pacman" ;;
                                4) play_game_by_name "Space-Invaders" ;;
                                5) play_game_by_name "Snake-Game" ;;
                                6) play_game_by_name "Greed" ;;
                                7) play_game_by_name "Nethack" ;;
                                8) play_game_by_name "Hangman" ;;
                                9) play_game_by_name "2048" ;;
                                0) break ;;
                                *) echo -e "${RED}Invalid choice!${NC}"; sleep 1 ;;
                            esac
                            
                            # After game ends, show options
                            display_header
                            echo -e "${GREEN}Game finished!${NC}"
                            echo -e "Options:"
                            echo -e " [1] Play again"
                            echo -e " [2] Add to favorites"
                            echo -e " [3] Remove from favorites"
                            echo -e " [4] Back to menu"
                            
                            read -p "Choose option: " option
                            
                            case $option in
                                1) continue ;;
                                2) add_to_favorites "$game_name" ;;
                                3) remove_from_favorites "$game_name" ;;
                                4) break ;;
                                *) echo -e "${RED}Invalid option!${NC}"; sleep 1 ;;
                            esac
                        done
                        ;;
                    2)  # Puzzle Games
                        # Similar structure for puzzle games
                        echo -e "${YELLOW}Puzzle games coming soon!${NC}"
                        sleep 1
                        ;;
                    3)  # Strategy Games
                        # Similar structure for strategy games
                        echo -e "${YELLOW}Strategy games coming soon!${NC}"
                        sleep 1
                        ;;
                    4)  # Back to Main Menu
                        break
                        ;;
                    *)
                        echo -e "${RED}Invalid category!${NC}"
                        sleep 1
                        ;;
                esac
            done
            ;;
        2)  # Favorites
            show_favorites
            ;;
        3)  # Game History
            show_history
            ;;
        4)  # About Developer
            clear
            echo -e "${PURPLE}╔════════════════════════════════════════════════════════════╗${NC}"
            echo -e "${PURPLE}║ ${GREEN}DEVELOPER INFORMATION ${PURPLE}║${NC}"
            echo -e "${PURPLE}╠════════════════════════════════════════════════════════════╣${NC}"
            echo -e "${PURPLE}║ ${CYAN}Name: ${YELLOW}Dwi Bakti Nugroho                          ${PURPLE}║${NC}"
            echo -e "${PURPLE}║ ${CYAN}Website: ${YELLOW}https://linkr.bio/BangRoy.go.id         ${PURPLE}║${NC}"
            echo -e "${PURPLE}║ ${CYAN}GitHub: ${YELLOW}https://github.com/DwiDevelopes          ${PURPLE}║${NC}"
            echo -e "${PURPLE}║ ${CYAN}Contact: ${YELLOW}+62 896-5296-9323                       ${PURPLE}║${NC}"
            echo -e "${PURPLE}║ ${CYAN}Version: ${YELLOW}2.2.1 Professional Edition              ${PURPLE}║${NC}"
            echo -e "${PURPLE}╚════════════════════════════════════════════════════════════╝${NC}"
            echo -e "${GREEN}This menu system is protected by copyright.${NC}"
            read -p "Press [ENTER] to continue: "
            ;;
        5)  # Exit
            mkdir -p $HOME/.termux/
            echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties 
            termux-reload-settings
            echo -e "${GREEN}Please restart Termux for keyboard changes to take effect${NC}"
            echo -e "${YELLOW}Goodbye!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice!${NC}"
            sleep 1
            ;;
    esac
done
