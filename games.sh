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
    echo "╔════════════════════════════════════════════════════════════════════════════╗" | lolcat
    echo "║                           TERMINAL GAMES COLLECTION                        ║" | lolcat
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
    echo "║                                                                           ║" | lolcat
    echo "║  [0] Enable Arrow Keys  [a] About me    [i] Install Games  [u] Update      ║" | lolcat
    echo "║  [s] Search Game       [e] EXIT        [c] Check Installed [m] Multiplayer ║" | lolcat
    echo "╚═══════════════════════════════════2.7═════════════════════════════════════════╝" | lolcat
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
    echo "1) Install all games (60 games)"
    echo "2) Install specific game"
    echo "3) Install category (e.g., puzzle, arcade)"
    echo "4) Back to main menu"
    read -p "Enter your choice: " install_choice

    case $install_choice in
        1)
            echo "Installing all games (this may take a while)..." | lolcat
            pkg update -y && pkg upgrade -y
            pkg install -y moon-buggy bastet pacman4console ninvaders nsnake greed nethack nudoku cmatrix \
                dwarf-fortress gnugo bsd-games angband frotz moria larn omega empire hunt-the-wumpus \
                robotfindskitten bsdgames text-golf text-football text-tennis text-boxing text-basketball \
                tron worm battleship solitaire minesweeper simon wordle quiz-game asciiquarium towdef \
                blackjack poker yahtzee checkers connect-four reversi go dungeon-crawl rogue
            pip install hangman-py terminal-wordle flappy-bird-cli
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
            read -p "Enter category number: " cat_choice
            
            case $cat_choice in
                1) pkg install -y nudoku 2048-cli wordle ;;
                2) pkg install -y pacman4console ninvaders moon-buggy ;;
                3) pkg install -y gnugo backgammon chess ;;
                4) pkg install -y nethack angband rogue ;;
                5) pkg install -y text-golf text-football ;;
                *) echo "Invalid category" | lolcat ;;
            esac
            ;;
        4) return ;;
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
}

# Function to check installed games
check_installed() {
    echo "Installed games:" | lolcat
    echo "----------------"
    games=("moon-buggy" "bastet" "pacman4console" "ninvaders" "nsnake" "greed" "nethack" 
           "nudoku" "cmatrix" "dwarf-fortress" "gnugo" "angband" "frotz" "moria" "larn" 
           "omega" "empire" "hunt-the-wumpus" "robotfindskitten" "bsdgames" "text-golf" 
           "text-football" "text-tennis" "text-boxing" "text-basketball" "tron" "worm" 
           "battleship" "solitaire" "minesweeper" "simon" "wordle" "quiz-game" "asciiquarium" 
           "towdef" "blackjack" "poker" "yahtzee" "checkers" "connect-four" "reversi" "go" 
           "dungeon-crawl" "rogue")
    
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
        "Text Boxing" "Text Basketball"
    )
    
    found=0
    for game in "${all_games[@]}"; do
        if [[ "$game" == *"$search_term"* ]]; then
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
    pip install --upgrade hangman-py terminal-wordle flappy-bird-cli
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
        *) echo "Invalid choice" | lolcat ;;
    esac
    
    read -p "Press [ENTER] to continue: "
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
        [1-9]|10|[1-5][0-9]|60)
            echo "Launching game $option..." | lolcat
            launch_game $option
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
        *)
            echo "Invalid choice! Please try again." | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
    esac
done