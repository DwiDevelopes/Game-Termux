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
    echo "-----------[Version: 3.0 - 120 Games]------------" | lolcat -as 50
}

# Function to display menu
display_menu() {
    echo
    echo "╔════════════════════════════════════════════════════════════════════════════╗" | lolcat
    echo "║                        TERMINAL GAMES COLLECTION v3.0                      ║" | lolcat
    echo "╠════════════════════════════════════════════════════════════════════════════╣" | lolcat
    echo "║  [1] Moon-buggy       [2] Tetris        [3] Pacman       [4] Space Invaders║" | lolcat
    echo "║  [5] Snake Game       [6] Greed         [7] Nethack      [8] Hangman       ║" | lolcat
    echo "║  [9] 2048            [10] Sudoku       [11] CMatrix     [12] Dwarf Fortress║" | lolcat
    echo "║ [13] Chess           [14] Backgammon   [15] Adventure   [16] Sokoban       ║" | lolcat
    echo "║ [17] Zork            [18] Angband      [19] Tron        [20] Worm          ║" | lolcat
    echo "║ [21] Battleship      [22] Solitaire    [23] Minesweeper [24] Simon         ║" | lolcat
    echo "║ [25] Wordle          [26] Quiz Game    [27] ASCII Racing[28] Tower Defense ║" | lolcat
    echo "║ [29] RPG Game        [30] Blackjack    [31] Poker       [32] Yahtzee       ║" | lolcat
    echo "║ [33] Checkers        [34] Connect Four [35] Reversi     [36] Go            ║" | lolcat
    echo "║ [37] Dungeon Crawl   [38] Rogue        [39] Moria       [40] Larn          ║" | lolcat
    echo "║ [41] Omega           [42] Empire       [43] Wargames    [44] Hunt the Wumpus║" | lolcat
    echo "║ [45] Robot Finds Kitten [46] BSD Games [47] Text Golf   [48] Text Football  ║" | lolcat
    echo "║ [49] Tic-Tac-Toe     [50] Bounce       [51] Flappy Bird [52] Pong          ║" | lolcat
    echo "║ [53] Breakout        [54] Frogger      [55] Asteroids   [56] Space War     ║" | lolcat
    echo "║ [57] Star Trek       [58] Text Tennis  [59] Text Boxing [60] Text Basketball║" | lolcat
    echo "║ [61] Air Traffic     [62] Atari Breakout[63] Boulderdash[64] Cave Explorer ║" | lolcat
    echo "║ [65] Cookie Clicker  [66] Curse of War [67] Dope Wars   [68] Duel          ║" | lolcat
    echo "║ [69] Fallout         [70] Frozen Bubble[71] Galaga      [72] Game of Life  ║" | lolcat
    echo "║ [73] Gradius         [74] Jetpack      [75] Jumpman     [76] Labyrinth     ║" | lolcat
    echo "║ [77] Lunar Lander    [78] M.U.L.E.     [79] Missile Command [80] Monkey   ║" | lolcat
    echo "║ [81] Outpost         [82] Pipe Mania   [83] Planetarium [84] Police Quest  ║" | lolcat
    echo "║ [85] Q*bert          [86] Rogue Legacy [87] Scorched Earth [88] Space Taxi║" | lolcat
    echo "║ [89] Star Control    [90] Super Mario  [91] Tempest     [92] Teris         ║" | lolcat
    echo "║ [93] The Oregon Trail[94] Thrust       [95] Time Pilot  [96] Tower of Hanoi║" | lolcat
    echo "║ [97] Ultima          [98] Vanguard     [99] Wolfenstein [100] X-Com        ║" | lolcat
    echo "║ [101] Yars' Revenge  [102] Zork II     [103] Zork III   [104] ZZT          ║" | lolcat
    echo "║ [105] Arkanoid       [106] Boulder Dash[107] BurgerTime [108] Centipede    ║" | lolcat
    echo "║ [109] Crystal Caves  [110] Defender    [111] Donkey Kong[112] Double Dragon║" | lolcat
    echo "║ [113] Dragon's Lair  [114] Elevator    [115] Gauntlet   [116] Ghostbusters ║" | lolcat
    echo "║ [117] Joust          [118] Karateka    [119] Lemmings   [120] Prince of Persia║" | lolcat
    echo "║                                                                           ║" | lolcat
    echo "║  [0] Enable Arrow Keys  [a] About me    [i] Install Games  [u] Update      ║" | lolcat
    echo "║  [s] Search Game       [e] EXIT        [c] Check Installed [m] Multiplayer ║" | lolcat
    echo "║  [h] High Scores       [t] Themes      [g] Game Stats     [r] Random Game ║" | lolcat
    echo "╚════════════════════════════════════════════════════════════════════════════╝" | lolcat
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

# Function to install games
install_games() {
    echo "Select installation option:" | lolcat
    echo "1) Install all games (120 games)"
    echo "2) Install specific game"
    echo "3) Install category (e.g., puzzle, arcade)"
    echo "4) Install essential dependencies"
    echo "5) Back to main menu"
    read -p "Enter your choice: " install_choice

    case $install_choice in
        1)
            echo "Installing all games (this may take a while)..." | lolcat
            pkg update -y && pkg upgrade -y
            pkg install -y moon-buggy bastet pacman4console ninvaders nsnake greed nethack nudoku cmatrix \
                dwarf-fortress gnugo bsd-games angband frotz moria larn omega empire hunt-the-wumpus \
                robotfindskitten bsdgames text-golf text-football text-tennis text-boxing text-basketball \
                tron worm battleship solitaire minesweeper simon wordle quiz-game asciiquarium towdef \
                blackjack poker yahtzee checkers connect-four reversi go dungeon-crawl rogue \
                boulderdash curseofwar dopewars duel frozen-bubble gradius jetpack jumpman \
                lunar-lander mule missile-command monkey outpost pipe-mania planetarium police-quest \
                qbert rogue-legacy scorched-earth space-taxi star-control super-mario tempest \
                thrust time-pilot tower-of-hanoi ultima vanguard wolfenstein x-com zzt \
                arkanoid burger-time centipede crystal-caves defender donkey-kong double-dragon \
                dragons-lair elevator gauntlet ghostbusters joust karateka lemmings prince-of-persia
            
            pip install hangman-py terminal-wordle flappy-bird-cli cookie-clicker fallout-cli \
                galaga-terminal game-of-life-terminal jetpack-cli lunar-lander-terminal \
                monkey-terminal outpost-terminal pipe-mania-terminal planetarium-terminal \
                qbert-terminal scorched-earth-terminal space-taxi-terminal star-control-terminal \
                super-mario-terminal tempest-terminal thrust-terminal time-pilot-terminal \
                tower-of-hanoi-terminal ultima-terminal vanguard-terminal wolfenstein-terminal \
                x-com-terminal yars-revenge-terminal zzt-terminal
            
            echo "All games installed successfully!" | lolcat
            ;;
        2)
            read -p "Enter game name to install: " game_name
            echo "Installing $game_name..." | lolcat
            pkg install -y $game_name || pip install $game_name || echo "Game not found in repositories" | lolcat
            ;;
        3)
            echo "Select category:"
            echo "1) Puzzle (sudoku, 2048, wordle)"
            echo "2) Arcade (pacman, space invaders)"
            echo "3) Board games (chess, backgammon)"
            echo "4) RPG (nethack, angband)"
            echo "5) Text sports (golf, football)"
            echo "6) Classic Arcade (arkanoid, centipede)"
            echo "7) Adventure (zork, prince of persia)"
            read -p "Enter category number: " cat_choice
            
            case $cat_choice in
                1) pkg install -y nudoku 2048-cli wordle tower-of-hanoi ;;
                2) pkg install -y pacman4console ninvaders moon-buggy arkanoid centipede ;;
                3) pkg install -y gnugo backgammon chess checkers connect-four ;;
                4) pkg install -y nethack angband rogue dungeon-crawl ultima ;;
                5) pkg install -y text-golf text-football text-tennis text-boxing ;;
                6) pkg install -y arkanoid burger-time centipede defender donkey-kong ;;
                7) pkg install -y frotz prince-of-persia zork1 zork2 zork3 ;;
                *) echo "Invalid category" | lolcat ;;
            esac
            ;;
        4)
            echo "Installing essential dependencies..." | lolcat
            pkg install -y python git wget curl ncurses-utils make cmake
            pip install --upgrade pip
            echo "Dependencies installed!" | lolcat
            ;;
        5) return ;;
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to check installed games
check_installed() {
    echo "Installed games:" | lolcat
    echo "----------------"
    games=(
        "moon-buggy" "bastet" "pacman4console" "ninvaders" "nsnake" "greed" "nethack" 
        "nudoku" "cmatrix" "dwarf-fortress" "gnugo" "angband" "frotz" "moria" "larn" 
        "omega" "empire" "hunt-the-wumpus" "robotfindskitten" "bsdgames" "text-golf" 
        "text-football" "text-tennis" "text-boxing" "text-basketball" "tron" "worm" 
        "battleship" "solitaire" "minesweeper" "simon" "wordle" "quiz-game" "asciiquarium" 
        "towdef" "blackjack" "poker" "yahtzee" "checkers" "connect-four" "reversi" "go" 
        "dungeon-crawl" "rogue" "boulderdash" "curseofwar" "dopewars" "duel" 
        "frozen-bubble" "gradius" "jetpack" "jumpman" "lunar-lander" "mule" 
        "missile-command" "monkey" "outpost" "pipe-mania" "planetarium" "police-quest" 
        "qbert" "rogue-legacy" "scorched-earth" "space-taxi" "star-control" "super-mario" 
        "tempest" "thrust" "time-pilot" "tower-of-hanoi" "ultima" "vanguard" 
        "wolfenstein" "x-com" "zzt" "arkanoid" "burger-time" "centipede" "crystal-caves" 
        "defender" "donkey-kong" "double-dragon" "dragons-lair" "elevator" "gauntlet" 
        "ghostbusters" "joust" "karateka" "lemmings" "prince-of-persia"
    )
    
    installed_count=0
    for game in "${games[@]}"; do
        if command -v $game &>/dev/null || pip list | grep -q $game; then
            echo -e "\e[32m✓ $game\e[0m"
            ((installed_count++))
        else
            echo -e "\e[31m✗ $game\e[0m"
        fi
    done
    
    echo "----------------"
    echo "Installed: $installed_count/${#games[@]}" | lolcat
    read -p "Press [ENTER] to continue: "
}

# Function to search for a game
search_game() {
    read -p "Enter game name to search: " search_term
    echo "Searching for '$search_term'..." | lolcat
    
    # List of all available games
    all_games=(
        "Moon-buggy" "Tetris" "Pacman" "Space Invaders" "Snake Game" "Greed" 
        "Nethack" "Hangman" "2048" "Sudoku" "CMatrix" "Dwarf Fortress" "Chess" 
        "Backgammon" "Adventure" "Sokoban" "Zork" "Angband" "Tron" "Worm" 
        "Battleship" "Solitaire" "Minesweeper" "Simon" "Wordle" "Quiz Game" 
        "ASCII Racing" "Tower Defense" "RPG Game" "Blackjack" "Poker" "Yahtzee" 
        "Checkers" "Connect Four" "Reversi" "Go" "Dungeon Crawl" "Rogue" "Moria" 
        "Larn" "Omega" "Empire" "Wargames" "Hunt the Wumpus" "Robot Finds Kitten" 
        "BSD Games" "Text Golf" "Text Football" "Tic-Tac-Toe" "Bounce" "Flappy Bird" 
        "Pong" "Breakout" "Frogger" "Asteroids" "Space War" "Star Trek" "Text Tennis" 
        "Text Boxing" "Text Basketball" "Air Traffic" "Atari Breakout" "Boulderdash" 
        "Cave Explorer" "Cookie Clicker" "Curse of War" "Dope Wars" "Duel" "Fallout" 
        "Frozen Bubble" "Galaga" "Game of Life" "Gradius" "Jetpack" "Jumpman" 
        "Labyrinth" "Lunar Lander" "M.U.L.E." "Missile Command" "Monkey" "Outpost" 
        "Pipe Mania" "Planetarium" "Police Quest" "Q*bert" "Rogue Legacy" 
        "Scorched Earth" "Space Taxi" "Star Control" "Super Mario" "Tempest" "Teris" 
        "The Oregon Trail" "Thrust" "Time Pilot" "Tower of Hanoi" "Ultima" "Vanguard" 
        "Wolfenstein" "X-Com" "Yars' Revenge" "Zork II" "Zork III" "ZZT" "Arkanoid" 
        "Boulder Dash" "BurgerTime" "Centipede" "Crystal Caves" "Defender" 
        "Donkey Kong" "Double Dragon" "Dragon's Lair" "Elevator" "Gauntlet" 
        "Ghostbusters" "Joust" "Karateka" "Lemmings" "Prince of Persia"
    )
    
    found=0
    for game in "${all_games[@]}"; do
        if [[ "$game" =~ "$search_term" ]]; then
            echo "Found: $game" | lolcat
            found=1
        fi
    done
    
    if [ $found -eq 0 ]; then
        echo "No games found matching '$search_term'" | lolcat
    fi
    
    read -p "Press [ENTER] to continue: "
}

# Function to update games
update_games() {
    echo "Updating system and games..." | lolcat
    pkg update -y && pkg upgrade -y
    pip install --upgrade hangman-py terminal-wordle flappy-bird-cli cookie-clicker \
        fallout-cli galaga-terminal game-of-life-terminal jetpack-cli \
        lunar-lander-terminal monkey-terminal outpost-terminal pipe-mania-terminal \
        planetarium-terminal qbert-terminal scorched-earth-terminal space-taxi-terminal \
        star-control-terminal super-mario-terminal tempest-terminal thrust-terminal \
        time-pilot-terminal tower-of-hanoi-terminal ultima-terminal vanguard-terminal \
        wolfenstein-terminal x-com-terminal yars-revenge-terminal zzt-terminal
    echo "Update complete!" | lolcat
    read -p "Press [ENTER] to continue: "
}

# Function to show multiplayer games
multiplayer_games() {
    echo "Multiplayer Games Available:" | lolcat
    echo "1) Chess (gnugo)"
    echo "2) Backgammon"
    echo "3) Tic-Tac-Toe"
    echo "4) Connect Four"
    echo "5) Reversi"
    echo "6) Text Tennis"
    echo "7) Text Boxing"
    echo "8) Battleship"
    echo "9) Dope Wars"
    echo "10) Curse of War"
    echo "11) Scorched Earth"
    echo "12) Wargames"
    
    read -p "Select game to play: " mp_game
    case $mp_game in
        1) gnugo --mode gtp ;;
        2) backgammon ;;
        3) tic-tac-toe ;;
        4) connect-four ;;
        5) reversi ;;
        6) text-tennis ;;
        7) text-boxing ;;
        8) battleship ;;
        9) dopewars ;;
        10) curseofwar ;;
        11) scorched-earth ;;
        12) wargames ;;
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to show high scores
high_scores() {
    echo "High Scores System" | lolcat
    echo "-----------------"
    
    if [ ! -f "$HOME/.termux_games/highscores.txt" ]; then
        mkdir -p "$HOME/.termux_games"
        touch "$HOME/.termux_games/highscores.txt"
    fi
    
    echo "1) View high scores"
    echo "2) Reset high scores"
    echo "3) Back to menu"
    read -p "Select option: " hs_choice
    
    case $hs_choice in
        1)
            echo "Current High Scores:" | lolcat
            cat "$HOME/.termux_games/highscores.txt" || echo "No high scores recorded yet"
            ;;
        2)
            echo "Resetting high scores..." | lolcat
            > "$HOME/.termux_games/highscores.txt"
            echo "High scores cleared"
            ;;
        3) return ;;
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to change terminal theme
change_theme() {
    echo "Select Terminal Theme:" | lolcat
    echo "1) Default"
    echo "2) Dark"
    echo "3) Light"
    echo "4) Matrix"
    echo "5) Retro"
    echo "6) Game Boy"
    echo "7) Cyberpunk"
    read -p "Enter theme number: " theme_choice
    
    case $theme_choice in
        1) 
            termux-reload-settings
            echo "Default theme applied" | lolcat
            ;;
        2)
            termux-color-scheme dark
            echo "Dark theme applied" | lolcat
            ;;
        3)
            termux-color-scheme light
            echo "Light theme applied" | lolcat
            ;;
        4)
            termux-color-scheme matrix
            echo "Matrix theme applied" | lolcat
            ;;
        5)
            termux-color-scheme retro
            echo "Retro theme applied" | lolcat
            ;;
        6)
            termux-color-scheme green
            echo "Game Boy theme applied" | lolcat
            ;;
        7)
            termux-color-scheme neon
            echo "Cyberpunk theme applied" | lolcat
            ;;
        *)
            echo "Invalid choice" | lolcat
            ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to show game statistics
game_stats() {
    echo "Game Statistics" | lolcat
    echo "---------------"
    
    if [ ! -f "$HOME/.termux_games/stats.txt" ]; then
        mkdir -p "$HOME/.termux_games"
        touch "$HOME/.termux_games/stats.txt"
        echo "No statistics recorded yet"
        return
    fi
    
    echo "1) View game play counts"
    echo "2) View most played games"
    echo "3) Reset statistics"
    echo "4) Back to menu"
    read -p "Select option: " stats_choice
    
    case $stats_choice in
        1)
            echo "Game Play Counts:" | lolcat
            cat "$HOME/.termux_games/stats.txt" || echo "No statistics recorded yet"
            ;;
        2)
            echo "Most Played Games:" | lolcat
            sort -nr -k2 "$HOME/.termux_games/stats.txt" | head -5
            ;;
        3)
            echo "Resetting statistics..." | lolcat
            > "$HOME/.termux_games/stats.txt"
            echo "Statistics cleared"
            ;;
        4) return ;;
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to launch a random game
random_game() {
    games=(
        "moon-buggy" "bastet" "pacman4console" "ninvaders" "nsnake" "greed" "nethack" 
        "nudoku" "cmatrix" "dwarf-fortress" "gnugo" "angband" "frotz" "moria" "larn" 
        "omega" "empire" "hunt-the-wumpus" "robotfindskitten" "bsdgames" "text-golf" 
        "text-football" "text-tennis" "text-boxing" "text-basketball" "tron" "worm" 
        "battleship" "solitaire" "minesweeper" "simon" "wordle" "quiz-game" "asciiquarium" 
        "towdef" "blackjack" "poker" "yahtzee" "checkers" "connect-four" "reversi" "go" 
        "dungeon-crawl" "rogue" "boulderdash" "curseofwar" "dopewars" "duel" 
        "frozen-bubble" "gradius" "jetpack" "jumpman" "lunar-lander" "mule" 
        "missile-command" "monkey" "outpost" "pipe-mania" "planetarium" "police-quest" 
        "qbert" "rogue-legacy" "scorched-earth" "space-taxi" "star-control" "super-mario" 
        "tempest" "thrust" "time-pilot" "tower-of-hanoi" "ultima" "vanguard" 
        "wolfenstein" "x-com" "zzt" "arkanoid" "burger-time" "centipede" "crystal-caves" 
        "defender" "donkey-kong" "double-dragon" "dragons-lair" "elevator" "gauntlet" 
        "ghostbusters" "joust" "karateka" "lemmings" "prince-of-persia"
    )
    
    # Filter only installed games
    installed_games=()
    for game in "${games[@]}"; do
        if command -v $game &>/dev/null || pip list | grep -q $game; then
            installed_games+=("$game")
        fi
    done
    
    if [ ${#installed_games[@]} -eq 0 ]; then
        echo "No games installed yet! Please install some games first." | lolcat
        read -p "Press [ENTER] to continue: "
        return
    fi
    
    random_index=$((RANDOM % ${#installed_games[@]}))
    random_game_name="${installed_games[$random_index]}"
    
    echo "Launching random game: $random_game_name" | lolcat
    $random_game_name
}

# Function to record game play in statistics
record_game_play() {
    local game_name=$1
    mkdir -p "$HOME/.termux_games"
    
    # Check if the game already exists in stats
    if grep -q "^$game_name " "$HOME/.termux_games/stats.txt"; then
        # Increment play count
        awk -v game="$game_name" '$1 == game {$2++; found=1} {print} END{if(!found) print game " 1"}' \
            "$HOME/.termux_games/stats.txt" > "$HOME/.termux_games/tmp.txt" && \
            mv "$HOME/.termux_games/tmp.txt" "$HOME/.termux_games/stats.txt"
    else
        # Add new entry
        echo "$game_name 1" >> "$HOME/.termux_games/stats.txt"
    fi
}

# Main game launcher function
launch_game() {
    case $1 in
        "1") moon-buggy ;;
        "2") bastet ;;
        "3") pacman4console ;;
        "4") ninvaders ;;
        "5") nsnake ;;
        "6") greed ;;
        "7") nethack ;;
        "8") 
            if command -v hangman &>/dev/null; then
                hangman
            else
                pip install hangman-py && hangman
            fi
            ;;
        "9") 
            if command -v 2048 &>/dev/null; then
                2048
            else
                echo "Install 2048 with: pkg install 2048-cli" | lolcat
            fi
            ;;
        "10") nudoku ;;
        "11") cmatrix ;;
        "12") dwarf-fortress ;;
        "13") gnugo --mode gtp ;;
        "14") backgammon ;;
        "15") adventure ;;
        "16") 
            if command -v xsok >/dev/null; then
                xsok
            else
                echo "Install with: pkg install xsok" | lolcat
            fi
            ;;
        "17") 
            if command -v frotz >/dev/null; then
                frotz /data/data/com.termux/files/usr/share/zork1/DATA/ZORK1.DAT
            else
                echo "Install with: pkg install frotz" | lolcat
            fi
            ;;
        "18") angband ;;
        "19") tron ;;
        "20") worm ;;
        "21") battleship ;;
        "22") solitaire ;;
        "23") minesweeper ;;
        "24") simon ;;
        "25") 
            if command -v wordle &>/dev/null; then
                wordle
            else
                pip install terminal-wordle && wordle
            fi
            ;;
        "26") quiz-game ;;
        "27") asciiquarium ;;
        "28") towdef ;;
        "29") dungeon-crawl ;;
        "30") blackjack ;;
        "31") poker ;;
        "32") yahtzee ;;
        "33") checkers ;;
        "34") connect-four ;;
        "35") reversi ;;
        "36") go ;;
        "37") dungeon-crawl ;;
        "38") rogue ;;
        "39") moria ;;
        "40") larn ;;
        "41") omega ;;
        "42") empire ;;
        "43") wargames ;;
        "44") hunt-the-wumpus ;;
        "45") robotfindskitten ;;
        "46") bsdgames ;;
        "47") text-golf ;;
        "48") text-football ;;
        "49") tic-tac-toe ;;
        "50") bounce ;;
        "51") 
            if command -v flappy-bird &>/dev/null; then
                flappy-bird
            else
                pip install flappy-bird-cli && flappy-bird
            fi
            ;;
        "52") pong ;;
        "53") breakout ;;
        "54") frogger ;;
        "55") asteroids ;;
        "56") spacewar ;;
        "57") startrek ;;
        "58") text-tennis ;;
        "59") text-boxing ;;
        "60") text-basketball ;;
        "61") air-traffic ;;
        "62") atari-breakout ;;
        "63") boulderdash ;;
        "64") cave-explorer ;;
        "65") cookie-clicker ;;
        "66") curseofwar ;;
        "67") dopewars ;;
        "68") duel ;;
        "69") fallout ;;
        "70") frozen-bubble ;;
        "71") galaga ;;
        "72") game-of-life ;;
        "73") gradius ;;
        "74") jetpack ;;
        "75") jumpman ;;
        "76") labyrinth ;;
        "77") lunar-lander ;;
        "78") mule ;;
        "79") missile-command ;;
        "80") monkey ;;
        "81") outpost ;;
        "82") pipe-mania ;;
        "83") planetarium ;;
        "84") police-quest ;;
        "85") qbert ;;
        "86") rogue-legacy ;;
        "87") scorched-earth ;;
        "88") space-taxi ;;
        "89") star-control ;;
        "90") super-mario ;;
        "91") tempest ;;
        "92") tetris ;;
        "93") oregon-trail ;;
        "94") thrust ;;
        "95") time-pilot ;;
        "96") tower-of-hanoi ;;
        "97") ultima ;;
        "98") vanguard ;;
        "99") wolfenstein ;;
        "100") x-com ;;
        "101") yars-revenge ;;
        "102") zork2 ;;
        "103") zork3 ;;
        "104") zzt ;;
        "105") arkanoid ;;
        "106") boulder-dash ;;
        "107") burger-time ;;
        "108") centipede ;;
        "109") crystal-caves ;;
        "110") defender ;;
        "111") donkey-kong ;;
        "112") double-dragon ;;
        "113") dragons-lair ;;
        "114") elevator ;;
        "115") gauntlet ;;
        "116") ghostbusters ;;
        "117") joust ;;
        "118") karateka ;;
        "119") lemmings ;;
        "120") prince-of-persia ;;
        *) echo "Invalid game selection" | lolcat ;;
    esac
}

# Main loop
while true; do
    display_header
    display_menu
    
    echo -e "Enter your choice: \c" | lolcat
    read option

    case $option in
        [1-9]|[1-9][0-9]|1[01][0-9]|120)
            echo "Launching game $option..." | lolcat
            launch_game $option
            # Record game play in statistics
            game_name=$(grep -E "\[$option\]" $0 | sed -E 's/.*\[[0-9]+\] ([^ ]+).*/\1/')
            record_game_play "$game_name"
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
        "u") update_games ;;
        "c") check_installed ;;
        "s") search_game ;;
        "m") multiplayer_games ;;
        "h") high_scores ;;
        "t") change_theme ;;
        "g") game_stats ;;
        "r") random_game ;;
        *)
            echo "Invalid choice! Please try again." | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
    esac
done