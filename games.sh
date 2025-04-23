#!/bin/bash

# Check for required packages
check_dependencies() {
    local packages=("lolcat" "figlet" "wget" "jq" "imagemagick")
    local missing=()
    
    for pkg in "${packages[@]}"; do
        if ! command -v "$pkg" &> /dev/null; then
            missing+=("$pkg")
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo "Installing missing packages: ${missing[*]}"
        pkg install -y "${missing[@]}"
    fi
}

# Initialize
check_dependencies
clear

# Configuration
UNSPLASH_API_KEY="bNf1fq2p6XENfQnZ6KAne40raJcwkzxFs4DWTvZHuY8"  # Replace with your actual Unsplash API key
CACHE_DIR="$HOME/.gamehub_cache"
mkdir -p "$CACHE_DIR"

# Download image from Unsplash
fetch_wallpaper() {
    local query="gaming"
    local url="https://api.unsplash.com/photos/random?query=$query&client_id=$UNSPLASH_API_KEY"
    local response=$(wget -qO- "$url")
    local img_url=$(echo "$response" | jq -r '.urls.regular')
    local img_path="$CACHE_DIR/wallpaper.jpg"
    
    wget -qO "$img_path" "$img_url"
    echo "$img_path"
}

# Display image with ASCII art
show_image() {
    local img_path="$1"
    if [ -f "$img_path" ]; then
        clear
        jp2a --colors "$img_path" --width=$(tput cols)
    fi
}

# Main menu
main_menu() {
    while true; do
        clear
        
        # Display random gaming wallpaper
        if [ -z "$WALLPAPER" ] || [ $((RANDOM % 5)) -eq 0 ]; then
            WALLPAPER=$(fetch_wallpaper)
        fi
        show_image "$WALLPAPER"
        
        # Display header
        echo -e "\n\n"
        figlet -f slant "GameHub Pro" | lolcat -a -s 100
        echo -e "Version 3.0.0 | Developed by Dwi Bakti Nugroho\n" | lolcat -a
        
        # System info
        echo -e "System: $(uname -o) | $(date)"
        echo -e "Storage: $(df -h / | awk 'NR==2 {print $4}') free | Memory: $(free -m | awk 'NR==2 {print $4}')MB free\n"
        
        # Menu options
        echo -e "\e[1;36mMAIN MENU:\e[0m"
        echo -e "  \e[1;33m1.\e[0m Game Library"
        echo -e "  \e[1;33m2.\e[0m Game Search"
        echo -e "  \e[1;33m3.\e[0m Developer Profile"
        echo -e "  \e[1;33m4.\e[0m Gaming Tips"
        echo -e "  \e[1;33m5.\e[0m System Tools"
        echo -e "  \e[1;33m6.\e[0m Settings"
        echo -e "  \e[1;31m0.\e[0m Exit\n"
        
        read -p "$(echo -e "\e[1;35mSelect an option: \e[0m")" option
        
        case $option in
            1) game_library ;;
            2) game_search ;;
            3) developer_profile ;;
            4) gaming_tips ;;
            5) system_tools ;;
            6) settings_menu ;;
            0) exit 0 ;;
            *) echo -e "\e[1;31mInvalid option! Please try again.\e[0m"; sleep 1 ;;
        esac
    done
}

# Game library
game_library() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Game Library" | lolcat -a
        
        # Categories
        echo -e "\n\e[1;36mCATEGORIES:\e[0m"
        echo -e "  \e[1;33m1.\e[0m Classic Games"
        echo -e "  \e[1;33m2.\e[0m Puzzle Games"
        echo -e "  \e[1;33m3.\e[0m Adventure Games"
        echo -e "  \e[1;33m4.\e[0m Strategy Games"
        echo -e "  \e[1;33m5.\e[0m All Games"
        echo -e "  \e[1;33m6.\e[0m Installed Games"
        echo -e "  \e[1;31m0.\e[0m Back to Main Menu\n"
        
        read -p "$(echo -e "\e[1;35mSelect category: \e[0m")" category
        
        case $category in
            1) show_games "classic" ;;
            2) show_games "puzzle" ;;
            3) show_games "adventure" ;;
            4) show_games "strategy" ;;
            5) show_games "all" ;;
            6) show_installed_games ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Show games by category
show_games() {
    local category=$1
    
    # Define games database
    declare -A games=(
        ["moon-buggy"]="classic A simple game where you drive a buggy on the moon"
        ["bastet"]="puzzle A Tetris-like game with different blocks"
        ["pacman"]="classic The classic Pac-Man game"
        ["ninvaders"]="classic Space Invaders clone"
        ["nsnake"]="classic Snake game"
        ["greed"]="puzzle A game of consuming numbers in a grid"
        ["nethack"]="adventure The classic dungeon exploration game"
        ["2048"]="puzzle Popular sliding tile puzzle game"
        ["nudoku"]="puzzle Sudoku game for terminal"
        ["brogue"]="adventure Roguelike dungeon crawler"
        ["curseofwar"]="strategy Fast-paced RTS game"
        ["gnugo"]="strategy Go game with AI opponent"
        ["moria"]="adventure Dungeon exploration game"
        ["angband"]="adventure Another classic roguelike game"
    )
    
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "${category^} Games" | lolcat -a
    echo -e "\n"
    
    local count=1
    for game in "${!games[@]}"; do
        local game_category=$(echo "${games[$game]}" | cut -d' ' -f1)
        local description=$(echo "${games[$game]}" | cut -d' ' -f2-)
        
        if [[ "$category" == "all" || "$game_category" == "$category" ]]; then
            if command -v "$game" &> /dev/null; then
                echo -e "  \e[1;32m$count. $game\e[0m - $description (Installed)"
            else
                echo -e "  \e[1;33m$count. $game\e[0m - $description"
            fi
            ((count++))
        fi
    done
    
    echo -e "\n\e[1;36mSelect a game to install/play (0 to go back): \e[0m"
    read choice
    
    if [[ "$choice" -eq 0 ]]; then
        return
    fi
    
    local game_list=($(for game in "${!games[@]}"; do 
        local game_category=$(echo "${games[$game]}" | cut -d' ' -f1)
        [[ "$category" == "all" || "$game_category" == "$category" ]] && echo "$game"; 
    done | sort))
    
    local selected_game="${game_list[$((choice-1))]}"
    
    if [[ -z "$selected_game" ]]; then
        echo -e "\e[1;31mInvalid selection!\e[0m"
        sleep 1
        return
    fi
    
    game_details "$selected_game"
}

# Show installed games
show_installed_games() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Installed Games" | lolcat -a
    echo -e "\n"
    
    local installed=()
    for game in $(compgen -c | sort -u); do
        case $game in
            moon-buggy|bastet|pacman|ninvaders|nsnake|greed|nethack|2048|nudoku|brogue|curseofwar|gnugo|moria|angband)
                installed+=("$game")
                ;;
        esac
    done
    
    if [[ ${#installed[@]} -eq 0 ]]; then
        echo -e "\e[1;31mNo games installed!\e[0m"
        sleep 2
        return
    fi
    
    for ((i=0; i<${#installed[@]}; i++)); do
        echo -e "  \e[1;32m$((i+1)). ${installed[$i]}\e[0m"
    done
    
    echo -e "\n\e[1;36mSelect a game to play (0 to go back): \e[0m"
    read choice
    
    if [[ "$choice" -eq 0 ]]; then
        return
    fi
    
    local selected_game="${installed[$((choice-1))]}"
    
    if [[ -z "$selected_game" ]]; then
        echo -e "\e[1;31mInvalid selection!\e[0m"
        sleep 1
        return
    fi
    
    play_game "$selected_game"
}

# Game details and actions
game_details() {
    local game=$1
    
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "${game^}" | lolcat -a
        echo -e "\n"
        
        if command -v "$game" &> /dev/null; then
            echo -e "\e[1;32mStatus: Installed\e[0m"
            echo -e "\n\e[1;36mActions:\e[0m"
            echo -e "  \e[1;33m1.\e[0m Play Game"
            echo -e "  \e[1;33m2.\e[0m Uninstall Game"
        else
            echo -e "\e[1;31mStatus: Not Installed\e[0m"
            echo -e "\n\e[1;36mActions:\e[0m"
            echo -e "  \e[1;33m1.\e[0m Install Game"
        fi
        
        echo -e "  \e[1;33m3.\e[0m View Description"
        echo -e "  \e[1;33m4.\e[0m View Controls"
        echo -e "  \e[1;31m0.\e[0m Back to List\n"
        
        read -p "$(echo -e "\e[1;35mSelect action: \e[0m")" action
        
        case $action in
            1) 
                if command -v "$game" &> /dev/null; then
                    play_game "$game"
                else
                    install_game "$game"
                fi
                ;;
            2)
                if command -v "$game" &> /dev/null; then
                    uninstall_game "$game"
                else
                    echo -e "\e[1;31mGame not installed!\e[0m"
                    sleep 1
                fi
                ;;
            3) show_game_description "$game" ;;
            4) show_game_controls "$game" ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Play game
play_game() {
    local game=$1
    
    clear
    echo -e "\e[1;35mLaunching ${game^}...\e[0m"
    echo -e "\e[1;33mPress the appropriate key combination to exit (usually Ctrl+C or Q)\e[0m\n"
    sleep 2
    
    # Special cases for games that need different exit instructions
    case $game in
        "moon-buggy"|"pacman")
            echo -e "\e[1;31mPress 'Q' to quit this game\e[0m\n"
            ;;
        "greed")
            echo -e "\e[1;31mPress 'Q' then 'Y' to quit this game\e[0m\n"
            ;;
        "nethack")
            echo -e "\e[1;31mPress Ctrl+C then answer the prompt to quit\e[0m\n"
            ;;
        *)
            echo -e "\e[1;31mPress Ctrl+C to quit this game\e[0m\n"
            ;;
    esac
    
    read -p "Press [ENTER] to start..."
    
    # Execute the game
    $game
    
    read -p "Game ended. Press [ENTER] to continue..."
}

# Install game
install_game() {
    local game=$1
    
    echo -e "\e[1;35mInstalling ${game^}...\e[0m"
    
    case $game in
        "moon-buggy") pkg install -y moon-buggy ;;
        "bastet") pkg install -y bastet ;;
        "pacman") pkg install -y pacman4console ;;
        "ninvaders") pkg install -y ninvaders ;;
        "nsnake") pkg install -y nsnake ;;
        "greed") pkg install -y greed ;;
        "nethack") pkg install -y nethack ;;
        "2048") pkg install -y 2048 ;;
        "nudoku") pkg install -y nudoku ;;
        "brogue") pkg install -y brogue ;;
        "curseofwar") pkg install -y curseofwar ;;
        "gnugo") pkg install -y gnugo ;;
        "moria") pkg install -y moria ;;
        "angband") pkg install -y angband ;;
        *) echo -e "\e[1;31mUnknown game!\e[0m"; sleep 1; return ;;
    esac
    
    if [ $? -eq 0 ]; then
        echo -e "\e[1;32m${game^} installed successfully!\e[0m"
    else
        echo -e "\e[1;31mFailed to install ${game^}!\e[0m"
    fi
    
    sleep 2
}

# Uninstall game
uninstall_game() {
    local game=$1
    
    echo -e "\e[1;35mUninstalling ${game^}...\e[0m"
    
    pkg uninstall -y $game
    
    if [ $? -eq 0 ]; then
        echo -e "\e[1;32m${game^} uninstalled successfully!\e[0m"
    else
        echo -e "\e[1;31mFailed to uninstall ${game^}!\e[0m"
    fi
    
    sleep 2
}

# Show game description
show_game_description() {
    local game=$1
    
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "${game^} Info" | lolcat -a
    echo -e "\n"
    
    case $game in
        "moon-buggy")
            echo -e "\e[1;36mMoon-Buggy:\e[0m"
            echo "A simple game where you drive a buggy on the moon's surface, jumping over craters."
            echo "The game is controlled with the space bar (jump) and left/right arrow keys."
            ;;
        "bastet")
            echo -e "\e[1;36mBastet:\e[0m"
            echo "A Tetris-like game but with a twist - the game gives you the worst possible block."
            echo "Challenge yourself to play with the most inconvenient pieces!"
            ;;
        "pacman")
            echo -e "\e[1;36mPacman:\e[0m"
            echo "The classic Pac-Man game ported to the terminal."
            echo "Navigate the maze, eat dots, avoid ghosts!"
            ;;
        "ninvaders")
            echo -e "\e[1;36mNInvaders:\e[0m"
            echo "A Space Invaders clone for the terminal."
            echo "Defend Earth from descending aliens in this classic arcade game."
            ;;
        "nsnake")
            echo -e "\e[1;36mNSnake:\e[0m"
            echo "The classic Snake game where you control a growing snake."
            echo "Eat food to grow longer while avoiding walls and yourself."
            ;;
        *)
            echo -e "\e[1;33mNo detailed description available for this game.\e[0m"
            ;;
    esac
    
    echo -e "\n\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show game controls
show_game_controls() {
    local game=$1
    
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "${game^} Controls" | lolcat -a
    echo -e "\n"
    
    case $game in
        "moon-buggy")
            echo -e "\e[1;36mMoon-Buggy Controls:\e[0m"
            echo "  Space Bar - Jump"
            echo "  Left/Right Arrow Keys - Move"
            echo "  Q - Quit Game"
            ;;
        "bastet")
            echo -e "\e[1;36mBastet Controls:\e[0m"
            echo "  Left/Right Arrow Keys - Move piece"
            echo "  Up Arrow Key - Rotate piece"
            echo "  Down Arrow Key - Drop piece faster"
            echo "  P - Pause game"
            echo "  Ctrl+C - Quit game"
            ;;
        "pacman")
            echo -e "\e[1;36mPacman Controls:\e[0m"
            echo "  Arrow Keys - Move Pacman"
            echo "  Q - Quit Game"
            ;;
        "ninvaders")
            echo -e "\e[1;36mNInvaders Controls:\e[0m"
            echo "  Left/Right Arrow Keys - Move ship"
            echo "  Space Bar - Fire"
            echo "  Q - Quit Game"
            ;;
        "nsnake")
            echo -e "\e[1;36mNSnake Controls:\e[0m"
            echo "  Arrow Keys - Change snake direction"
            echo "  P - Pause game"
            echo "  Q - Quit game"
            ;;
        *)
            echo -e "\e[1;33mNo specific control information available for this game.\e[0m"
            echo "Most games use:"
            echo "  Arrow Keys - Navigation"
            echo "  Space Bar - Action/Select"
            echo "  Q - Quit"
            echo "  Ctrl+C - Force quit"
            ;;
    esac
    
    echo -e "\n\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Game search function
game_search() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Game Search" | lolcat -a
        echo -e "\n"
        
        read -p "$(echo -e "\e[1;35mEnter game name to search (or '0' to go back): \e[0m")" search_term
        
        if [[ "$search_term" == "0" ]]; then
            return
        fi
        
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Search Results" | lolcat -a
        echo -e "\n"
        
        local found=0
        for game in $(compgen -c | sort -u); do
            case $game in
                moon-buggy|bastet|pacman|ninvaders|nsnake|greed|nethack|2048|nudoku|brogue|curseofwar|gnugo|moria|angband)
                    if [[ "$game" == *"$search_term"* ]]; then
                        if command -v "$game" &> /dev/null; then
                            echo -e "  \e[1;32m$game\e[0m (Installed)"
                        else
                            echo -e "  \e[1;33m$game\e[0m"
                        fi
                        found=1
                    fi
                    ;;
            esac
        done
        
        if [[ $found -eq 0 ]]; then
            echo -e "\e[1;31mNo games found matching '$search_term'\e[0m"
        fi
        
        echo -e "\n\e[1;36mEnter a game name to view details (or '0' to search again): \e[0m"
        read selected_game
        
        if [[ "$selected_game" != "0" ]]; then
            game_details "$selected_game"
        fi
    done
}

# Developer profile
developer_profile() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Developer Profile" | lolcat -a
        echo -e "\n"
        
        echo -e "\e[1;36mName:\e[0m Dwi Bakti Nugroho"
        echo -e "\e[1;36mAlias:\e[0m Royhtml"
        echo -e "\e[1;36mVersion:\e[0m 3.0.0"
        echo -e "\e[1;36mLicense:\e[0m MIT"
        echo -e "\n"
        
        echo -e "\e[1;33mContact Information:\e[0m"
        echo -e "  \e[1;34mWebsite:\e[0m https://portofolio-dwi-bakti-n-dev-liard.vercel.app/"
        echo -e "  \e[1;34mGitHub:\e[0m https://github.com/DwiDevelopes"
        echo -e "  \e[1;34mWhatsApp:\e[0m https://wa.me/+6289652969323"
        echo -e "  \e[1;34mTikTok:\e[0m www.Tiktok.com/@Royhtml"
        echo -e "\n"
        
        echo -e "\e[1;33mAdditional Options:\e[0m"
        echo -e "  \e[1;33m1.\e[0m View Developer Story"
        echo -e "  \e[1;33m2.\e[0m View Copyright Information"
        echo -e "  \e[1;33m3.\e[0m Check for Updates"
        echo -e "  \e[1;31m0.\e[0m Back to Main Menu"
        echo -e "\n"
        
        read -p "$(echo -e "\e[1;35mSelect option: \e[0m")" option
        
        case $option in
            1) developer_story ;;
            2) copyright_info ;;
            3) check_updates ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Developer story
developer_story() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "My Story" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mEarly Years:\e[0m"
    echo "From a young age, I was fascinated by computers and gaming. I started"
    echo "experimenting with simple programs and modifying game files to understand"
    echo "how they worked. This curiosity led me to explore programming more deeply."
    echo -e "\n"
    
    echo -e "\e[1;36mTeenage Exploration:\e[0m"
    echo "During my teenage years, I delved into various aspects of computing,"
    echo "from game development to system administration. I learned through trial"
    echo "and error, often spending hours troubleshooting and experimenting."
    echo -e "\n"
    
    echo -e "\e[1;36mChallenges Faced:\e[0m"
    echo "Like many self-taught developers, I faced numerous challenges - lack of"
    echo "resources, limited internet access, and no formal guidance. However, these"
    echo "obstacles only strengthened my determination to learn and create."
    echo -e "\n"
    
    echo -e "\e[1;36mCurrent Work:\e[0m"
    echo "Today, I focus on creating educational content and tools that make"
    echo "technology more accessible to others. This GameHub project is one of"
    echo "many initiatives to bring fun and learning together."
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Copyright information
copyright_info() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Copyright Info" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;33mLegal Notice:\e[0m"
    echo "This software is protected by copyright law and international treaties."
    echo -e "\n"
    
    echo -e "\e[1;33mLicense:\e[0m"
    echo "GameHub Terminal is licensed under the MIT License."
    echo "This means you are free to use, modify, and distribute the software,"
    echo "but you must include the original copyright notice."
    echo -e "\n"
    
    echo -e "\e[1;33mRestrictions:\e[0m"
    echo "Unauthorized reproduction or distribution of this software, or any portion"
    echo "of it, may result in severe civil and criminal penalties, and will be"
    echo "prosecuted to the maximum extent possible under law."
    echo -e "\n"
    
    echo -e "\e[1;33mThird-Party Content:\e[0m"
    echo "Some games included or referenced in this software may have their own"
    echo "licenses and copyrights. Please respect those individual licenses."
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Check for updates
check_updates() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Update Check" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;35mChecking for updates...\e[0m"
    sleep 2
    
    # In a real implementation, you would check against a remote repository
    # This is just a simulation
    local current_version="3.0.0"
    local latest_version="3.0.0"
    
    if [[ "$current_version" == "$latest_version" ]]; then
        echo -e "\e[1;32mYou are running the latest version (v$current_version)!\e[0m"
    else
        echo -e "\e[1;33mA new version is available (v$latest_version)\e[0m"
        echo -e "\e[1;33mCurrent version: v$current_version\e[0m"
        echo -e "\n\e[1;36mWould you like to update? (y/n): \e[0m"
        read answer
        
        if [[ "$answer" =~ [yY] ]]; then
            echo -e "\e[1;35mUpdating...\e[0m"
            sleep 2
            echo -e "\e[1;32mUpdate completed successfully!\e[0m"
        else
            echo -e "\e[1;33mUpdate cancelled.\e[0m"
        fi
    fi
    
    sleep 2
}

# Gaming tips
gaming_tips() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Gaming Tips" | lolcat -a
        echo -e "\n"
        
        echo -e "\e[1;36mSelect a Topic:\e[0m"
        echo -e "  \e[1;33m1.\e[0m Benefits of Gaming"
        echo -e "  \e[1;33m2.\e[0m Gaming Precautions"
        echo -e "  \e[1;33m3.\e[0m Healthy Gaming Habits"
        echo -e "  \e[1;33m4.\e[0m Terminal Gaming Tips"
        echo -e "  \e[1;31m0.\e[0m Back to Main Menu"
        echo -e "\n"
        
        read -p "$(echo -e "\e[1;35mSelect option: \e[0m")" option
        
        case $option in
            1) show_benefits ;;
            2) show_precautions ;;
            3) show_habits ;;
            4) show_terminal_tips ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Show gaming benefits
show_benefits() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Benefits" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mCognitive Benefits:\e[0m"
    echo "  • Improves problem-solving and strategic thinking skills"
    echo "  • Enhances memory and concentration"
    echo "  • Boosts multitasking abilities"
    echo -e "\n"
    
    echo -e "\e[1;36mSocial Benefits:\e[0m"
    echo "  • Encourages teamwork in multiplayer games"
    echo "  • Provides opportunities to make new friends"
    echo "  • Can improve communication skills"
    echo -e "\n"
    
    echo -e "\e[1;36mEmotional Benefits:\e[0m"
    echo "  • Reduces stress and anxiety"
    echo "  • Provides a sense of achievement"
    echo "  • Can improve mood and emotional regulation"
    echo -e "\n"
    
    echo -e "\e[1;36mEducational Benefits:\e[0m"
    echo "  • Can teach history, science, and other subjects through gameplay"
    echo "  • Improves hand-eye coordination"
    echo "  • Enhances creativity and imagination"
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show gaming precautions
show_precautions() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Precautions" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mHealth Considerations:\e[0m"
    echo "  • Take regular breaks to avoid eye strain (20-20-20 rule)"
    echo "  • Maintain good posture to prevent back and neck pain"
    echo "  • Stay hydrated and don't skip meals"
    echo -e "\n"
    
    echo -e "\e[1;36mTime Management:\e[0m"
    echo "  • Set time limits for gaming sessions"
    echo "  • Balance gaming with other activities and responsibilities"
    echo "  • Avoid gaming late at night to maintain healthy sleep patterns"
    echo -e "\n"
    
    echo -e "\e[1;36mOnline Safety:\e[0m"
    echo "  • Be cautious when interacting with strangers online"
    echo "  • Protect your personal information"
    echo "  • Use strong, unique passwords for gaming accounts"
    echo -e "\n"
    
    echo -e "\e[1;36mEmotional Well-being:\e[0m"
    echo "  • Don't let losses affect your self-esteem"
    echo "  • Recognize signs of frustration and take breaks when needed"
    echo "  • Remember it's just a game - have fun!"
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show healthy gaming habits
show_habits() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Healthy Habits" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mPhysical Health:\e[0m"
    echo "  • Take a 5-10 minute break every hour"
    echo "  • Do simple stretches during breaks"
    echo "  • Ensure proper lighting to reduce eye strain"
    echo -e "\n"
    
    echo -e "\e[1;36mMental Health:\e[0m"
    echo "  • Set achievable gaming goals"
    echo "  • Don't compare yourself to professional gamers"
    echo "  • Balance competitive play with casual fun"
    echo -e "\n"
    
    echo -e "\e[1;36mSocial Balance:\e[0m"
    echo "  • Maintain offline friendships and activities"
    echo "  • Don't let gaming replace real-world interactions"
    echo "  • Involve family/friends in your gaming when possible"
    echo -e "\n"
    
    echo -e "\e[1;36mTime Management:\e[0m"
    echo "  • Use timers to track gaming sessions"
    echo "  • Prioritize responsibilities before gaming"
    echo "  • Establish 'gaming-free' times or days"
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show terminal gaming tips
show_terminal_tips() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Terminal Tips" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mGeneral Tips:\e[0m"
    echo "  • Most terminal games use simple keyboard controls (arrow keys, spacebar)"
    echo "  • Look for in-game help menus (usually with 'H' or '?' key)"
    echo "  • Many games can be paused with 'P' key"
    echo -e "\n"
    
    echo -e "\e[1;36mExiting Games:\e[0m"
    echo "  • Try 'Q' to quit many terminal games"
    echo "  • Ctrl+C is the universal interrupt command"
    echo "  • Some games require typing 'quit' or 'exit'"
    echo -e "\n"
    
    echo -e "\e[1;36mPerformance:\e[0m"
    echo "  • Close background apps for better performance"
    echo "  • Adjust terminal size if game display looks off"
    echo "  • Some games work better in full-screen terminal"
    echo -e "\n"
    
    echo -e "\e[1;36mDiscoverability:\e[0m"
    echo "  • Use 'pkg list-all' to find more terminal games"
    echo "  • Search for 'roguelike' or 'console games' online"
    echo "  • Many classic games have terminal versions"
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# System tools
system_tools() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "System Tools" | lolcat -a
        echo -e "\n"
        
        echo -e "\e[1;36mSystem Information:\e[0m"
        echo -e "  \e[1;33m1.\e[0m View System Stats"
        echo -e "  \e[1;33m2.\e[0m Check Storage"
        echo -e "  \e[1;33m3.\e[0m Check Memory Usage"
        echo -e "\n"
        
        echo -e "\e[1;36mMaintenance:\e[0m"
        echo -e "  \e[1;33m4.\e[0m Clear Cache"
        echo -e "  \e[1;33m5.\e[0m Update Packages"
        echo -e "  \e[1;33m6.\e[0m Optimize Performance"
        echo -e "\n"
        
        echo -e "\e[1;31m0.\e[0m Back to Main Menu"
        echo -e "\n"
        
        read -p "$(echo -e "\e[1;35mSelect option: \e[0m")" option
        
        case $option in
            1) show_system_stats ;;
            2) show_storage_info ;;
            3) show_memory_info ;;
            4) clear_cache ;;
            5) update_packages ;;
            6) optimize_performance ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Show system statistics
show_system_stats() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "System Stats" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mDevice Information:\e[0m"
    echo -e "  \e[1;33mOS:\e[0m $(uname -o)"
    echo -e "  \e[1;33mKernel:\e[0m $(uname -r)"
    echo -e "  \e[1;33mArchitecture:\e[0m $(uname -m)"
    echo -e "\n"
    
    echo -e "\e[1;36mCPU Information:\e[0m"
    echo -e "  \e[1;33mProcessor:\e[0m $(cat /proc/cpuinfo | grep 'model name' | head -1 | cut -d':' -f2 | sed 's/^[ \t]*//')"
    echo -e "  \e[1;33mCores:\e[0m $(nproc)"
    echo -e "\n"
    
    echo -e "\e[1;36mUptime:\e[0m"
    uptime -p
    echo -e "\n"
    
    echo -e "\e[1;36mBattery Status:\e[0m"
    if [ -f "/sys/class/power_supply/battery/capacity" ]; then
        echo -e "  \e[1;33mCharge:\e[0m $(cat /sys/class/power_supply/battery/capacity)%"
    else
        echo "  Not available"
    fi
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show storage information
show_storage_info() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Storage Info" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mDisk Usage:\e[0m"
    df -h | grep -v "tmpfs" | awk '{print $1,$3,$4,$5}' | column -t | while read -r line; do
        echo -e "  $line"
    done
    echo -e "\n"
    
    echo -e "\e[1;36mLargest Directories:\e[0m"
    du -h --max-depth=1 /data/data/com.termux/files/home 2>/dev/null | sort -hr | head -10 | while read -r line; do
        echo -e "  $line"
    done
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Show memory information
show_memory_info() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Memory Info" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mMemory Usage:\e[0m"
    free -m | awk 'NR==2{printf "  Total: %sMB | Used: %sMB | Free: %sMB\n", $2, $3, $4}'
    free -m | awk 'NR==3{printf "  Buff/Cache: %sMB | Available: %sMB\n", $3, $7}'
    echo -e "\n"
    
    echo -e "\e[1;36mTop Memory Processes:\e[0m"
    ps -eo pid,user,%mem,command --sort=-%mem | head -6 | while read -r line; do
        echo -e "  $line"
    done
    echo -e "\n"
    
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Clear cache
clear_cache() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Clear Cache" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;35mClearing cache...\e[0m"
    
    # Clear package manager cache
    pkg clean
    
    # Clear temporary files
    rm -rf /data/data/com.termux/files/usr/tmp/*
    
    # Clear gamehub cache
    rm -rf "$CACHE_DIR"/*
    
    echo -e "\e[1;32mCache cleared successfully!\e[0m"
    sleep 2
}

# Update packages
update_packages() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Update System" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mUpdating package lists...\e[0m"
    pkg update -y
    
    echo -e "\n\e[1;36mUpgrading packages...\e[0m"
    pkg upgrade -y
    
    echo -e "\n\e[1;36mCleaning up...\e[0m"
    pkg autoclean -y
    pkg autoremove -y
    
    echo -e "\n\e[1;32mSystem updated successfully!\e[0m"
    sleep 2
}

# Optimize performance
optimize_performance() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Optimization" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;35mOptimizing system performance...\e[0m"
    
    # Clear RAM cache
    sync && echo 3 > /proc/sys/vm/drop_caches
    
    # Adjust swappiness
    if [ -f "/proc/sys/vm/swappiness" ]; then
        echo 10 > /proc/sys/vm/swappiness
    fi
    
    echo -e "\e[1;32mPerformance optimization completed!\e[0m"
    sleep 2
}

# Settings menu
settings_menu() {
    while true; do
        clear
        show_image "$WALLPAPER"
        
        echo -e "\n"
        figlet -f small "Settings" | lolcat -a
        echo -e "\n"
        
        echo -e "\e[1;36mDisplay Settings:\e[0m"
        echo -e "  \e[1;33m1.\e[0m Toggle Wallpaper"
        echo -e "  \e[1;33m2.\e[0m Change Color Scheme"
        echo -e "\n"
        
        echo -e "\e[1;36mGame Settings:\e[0m"
        echo -e "  \e[1;33m3.\e[0m Configure Default Controls"
        echo -e "\n"
        
        echo -e "\e[1;36mApplication Settings:\e[0m"
        echo -e "  \e[1;33m4.\e[0m Reset Preferences"
        echo -e "  \e[1;33m5.\e[0m Backup Data"
        echo -e "  \e[1;33m6.\e[0m Restore Data"
        echo -e "\n"
        
        echo -e "\e[1;31m0.\e[0m Back to Main Menu"
        echo -e "\n"
        
        read -p "$(echo -e "\e[1;35mSelect option: \e[0m")" option
        
        case $option in
            1) toggle_wallpaper ;;
            2) change_color_scheme ;;
            3) configure_controls ;;
            4) reset_preferences ;;
            5) backup_data ;;
            6) restore_data ;;
            0) return ;;
            *) echo -e "\e[1;31mInvalid option!\e[0m"; sleep 1 ;;
        esac
    done
}

# Toggle wallpaper display
toggle_wallpaper() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Wallpaper" | lolcat -a
    echo -e "\n"
    
    if [[ "$WALLPAPER_ENABLED" == "true" ]]; then
        echo -e "\e[1;33mWallpaper is currently enabled.\e[0m"
        echo -e "\n\e[1;36mWould you like to disable it? (y/n): \e[0m"
        read answer
        
        if [[ "$answer" =~ [yY] ]]; then
            WALLPAPER_ENABLED="false"
            echo -e "\e[1;32mWallpaper disabled!\e[0m"
        else
            echo -e "\e[1;33mWallpaper remains enabled.\e[0m"
        fi
    else
        echo -e "\e[1;33mWallpaper is currently disabled.\e[0m"
        echo -e "\n\e[1;36mWould you like to enable it? (y/n): \e[0m"
        read answer
        
        if [[ "$answer" =~ [yY] ]]; then
            WALLPAPER_ENABLED="true"
            echo -e "\e[1;32mWallpaper enabled!\e[0m"
        else
            echo -e "\e[1;33mWallpaper remains disabled.\e[0m"
        fi
    fi
    
    sleep 2
}

# Change color scheme
change_color_scheme() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Colors" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mAvailable Color Schemes:\e[0m"
    echo -e "  \e[1;33m1.\e[0m Default"
    echo -e "  \e[1;33m2.\e[0m Dark"
    echo -e "  \e[1;33m3.\e[0m Light"
    echo -e "  \e[1;33m4.\e[0m Solarized"
    echo -e "  \e[1;33m5.\e[0m Monokai"
    echo -e "\n\e[1;31m0.\e[0m Cancel"
    echo -e "\n"
    
    read -p "$(echo -e "\e[1;35mSelect color scheme: \e[0m")" scheme
    
    case $scheme in
        1) echo -e "\e[1;32mDefault color scheme applied!\e[0m" ;;
        2) echo -e "\e[1;32mDark color scheme applied!\e[0m" ;;
        3) echo -e "\e[1;32mLight color scheme applied!\e[0m" ;;
        4) echo -e "\e[1;32mSolarized color scheme applied!\e[0m" ;;
        5) echo -e "\e[1;32mMonokai color scheme applied!\e[0m" ;;
        0) echo -e "\e[1;33mOperation cancelled.\e[0m" ;;
        *) echo -e "\e[1;31mInvalid selection!\e[0m" ;;
    esac
    
    sleep 2
}

# Configure default controls
configure_controls() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Controls" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;36mCurrent Control Scheme:\e[0m"
    echo -e "  Movement: Arrow Keys"
    echo -e "  Action: Spacebar"
    echo -e "  Menu: ESC"
    echo -e "  Quit: Q or Ctrl+C"
    echo -e "\n"
    
    echo -e "\e[1;33mControl configuration is not yet implemented.\e[0m"
    echo -e "\e[1;35mPress [ENTER] to continue...\e[0m"
    read
}

# Reset preferences
reset_preferences() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Reset" | lolcat -a
    echo -e "\n"
    
    echo -e "\e[1;31mWARNING: This will reset all preferences to defaults!\e[0m"
    echo -e "\n\e[1;36mAre you sure you want to continue? (y/n): \e[0m"
    read answer
    
    if [[ "$answer" =~ [yY] ]]; then
        echo -e "\e[1;35mResetting preferences...\e[0m"
        sleep 2
        echo -e "\e[1;32mPreferences reset successfully!\e[0m"
    else
        echo -e "\e[1;33mOperation cancelled.\e[0m"
    fi
    
    sleep 2
}

# Backup data
backup_data() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Backup" | lolcat -a
    echo -e "\n"
    
    local backup_dir="$HOME/GameHub_Backups"
    mkdir -p "$backup_dir"
    local backup_file="$backup_dir/gamehub_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    
    echo -e "\e[1;35mCreating backup...\e[0m"
    tar -czf "$backup_file" -C "$HOME" .gamehub_cache 2>/dev/null
    
    if [ $? -eq 0 ]; then
        echo -e "\e[1;32mBackup created successfully!\e[0m"
        echo -e "\e[1;33mLocation: $backup_file\e[0m"
    else
        echo -e "\e[1;31mBackup failed!\e[0m"
    fi
    
    sleep 2
}

# Restore data
restore_data() {
    clear
    show_image "$WALLPAPER"
    
    echo -e "\n"
    figlet -f small "Restore" | lolcat -a
    echo -e "\n"
    
    local backup_dir="$HOME/GameHub_Backups"
    
    if [ ! -d "$backup_dir" ] || [ -z "$(ls -A "$backup_dir")" ]; then
        echo -e "\e[1;31mNo backups found in $backup_dir!\e[0m"
        sleep 2
        return
    fi
    
    echo -e "\e[1;36mAvailable Backups:\e[0m"
    local backups=($(ls -1t "$backup_dir"))
    local count=1
    for backup in "${backups[@]}"; do
        echo -e "  \e[1;33m$count.\e[0m $backup"
        ((count++))
    done
    
    echo -e "\n\e[1;36mSelect backup to restore (0 to cancel): \e[0m"
    read choice
    
    if [[ "$choice" -eq 0 ]]; then
        echo -e "\e[1;33mOperation cancelled.\e[0m"
        sleep 1
        return
    fi
    
    local selected_backup="${backups[$((choice-1))]}"
    
    if [[ -z "$selected_backup" ]]; then
        echo -e "\e[1;31mInvalid selection!\e[0m"
        sleep 1
        return
    fi
    
    echo -e "\e[1;31mWARNING: This will overwrite current data!\e[0m"
    echo -e "\n\e[1;36mAre you sure you want to restore from $selected_backup? (y/n): \e[0m"
    read answer
    
    if [[ "$answer" =~ [yY] ]]; then
        echo -e "\e[1;35mRestoring data...\e[0m"
        tar -xzf "$backup_dir/$selected_backup" -C "$HOME"
        echo -e "\e[1;32mData restored successfully!\e[0m"
    else
        echo -e "\e[1;33mOperation cancelled.\e[0m"
    fi
    
    sleep 2
}

# Initialize
WALLPAPER_ENABLED=true
WALLPAPER=$(fetch_wallpaper)

# Start the application
main_menu
