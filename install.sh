@ -1,153 +1,293 @@
#game termux playfrom saya
# Termux-Games
# Coded by: dwi bakti n dev



echo -e "\e[032m" "saya mohon jangan copy project saya ini kalau kalian mau copy bayar 25rb hehe"
#!/bin/bash

# Termux-Games Super Edition
# Original by: dwi bakti n dev
# Enhanced with 50+ games including Tetris

# Clear screen and show header
clear


echo "play Games in Termux by-dwi bakti n dev"

echo -e "\e[032m"
pkg install ruby -y && gem install lolcat
pkg install figlet

figlet bastet | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install bastet

figlet Pacman | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install pacman4console

figlet M-buggy | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install moon-buggy

figlet invaders | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install ninvaders

figlet snake | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install nsnake

figlet Greed | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install greed

figlet Nethack | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install nethack

figlet Sudoku | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install nudoku && apt install nudoku

figlet overkill | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install overkill && apt install overkill

figlet 2048 | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install 2048 && apt install 2048

figlet brogue | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install brogue && apt install brogue

figlet phear | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install phear && apt install phear

figlet curseofwar | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install curseofwar && apt install curseofwar

figlet csol | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install csol && apt install csol

figlet dopewars | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install dopewars && apt install dopewars

figlet gnugo | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install gnugo && apt install gnugo

figlet gnuski | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install gnuski && apt install gnuski

figlet moria | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install moria && apt install moria

figlet npush | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install npush && apt install npush

figlet robotfindskitten | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install robotfindskitten && apt install robotfindskitten

figlet ttysolitaire | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install ttysolitaire && apt install ttysolitaire

figlet myman | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install myman && apt install myman

figlet go | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install go && apt install go

figlet curse of war | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install curse of war && apt install curse of war

figlet Nsnake | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install Nsnake && apt install Nsnake

figlet NINVADERS | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install NINVADERS && apt install NINVADERS

figlet curse of war | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install NetHack && apt install NetHack

figlet Stickman | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install Stickman && apt install Stickman

figlet Sudoku | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install Sudoku && apt install Sudoku

figlet Hangman | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install git -y && echo -e "\e[032m" && git clone https://github.com/DwiDevelopes/HangmanPy.git

figlet Python | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install python -y

figlet "2048" | lolcat && echo Installing..................... | lolcat
echo -e "\e[032m"
pkg install git -y && pkg install wget -y && pkg install clang -y && wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c && sleep 2 && gcc -o 2048 2048.c

cd && echo "alias games='cd && cd Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc

echo "Visit https://linkr.bio/BangRoy.go.id keterangan termux lengkap akan selalu kami update di website resmi yang saya buat ini" | lolcat -a
echo "Visit https://ai-google.vercel.app/ AI Assisten Dwi Bakti N Dev Kalian bisa mencoba vitur tersebut" | lolcat -a
echo -e "\e[1;32m"
figlet "Termux Games" | lolcat
echo "============================================"
echo "   Super Edition - 50+ Games Collection"
echo "============================================"
echo -e "\e[0m"

# Check if running in Termux
if [ ! -d "/data/data/com.termux/files/usr" ]; then
    echo -e "\e[1;31mError: This script must be run in Termux!\e[0m"
    exit 1
fi

# Create games directory
GAMES_DIR="$HOME/termux-games"
mkdir -p "$GAMES_DIR"
cd "$GAMES_DIR" || exit

# Function to install package with error handling
install_package() {
    local package_name=$1
    echo -e "\e[1;34m"
    figlet "Installing:" | lolcat
    figlet "$package_name" | lolcat
    echo -e "\e[0m"
    
    if pkg install -y "$package_name" 2>&1 | tee -a install.log; then
        echo -e "\e[1;32m✓ $package_name installed successfully!\e[0m"
        return 0
    else
        echo -e "\e[1;31m✗ Failed to install $package_name with pkg\e[0m"
        echo "Trying with apt..."
        if apt install -y "$package_name" 2>&1 | tee -a install.log; then
            echo -e "\e[1;32m✓ $package_name installed with apt!\e[0m"
            return 0
        else
            echo -e "\e[1;31m✗ Completely failed to install $package_name\e[0m"
            return 1
        fi
    fi
}

# Update packages first
echo -e "\e[1;33mUpdating packages...\e[0m"
pkg update -y && pkg upgrade -y

# Install essential tools
install_package ruby
gem install lolcat || {
    echo -e "\e[1;31mFailed to install lolcat gem\e[0m"
    exit 1
}

install_package figlet
install_package wget
install_package git
install_package clang
install_package make
install_package python

# Main game installations - Organized by category

## Classic Arcade Games
classic_games=(
    "bastet"        # Tetris clone
    "ninvaders"     # Space Invaders
    "nsnake"        # Snake game
    "moon-buggy"    # Moon Buggy racing
    "pacman4console" # Pacman
    "greed"         # Console-based rogue-like
)

## Puzzle Games
puzzle_games=(
    "nudoku"        # Sudoku
    "2048"          # 2048 game
    "gnugo"         # Go game
    "gnuski"        # Skiing game
    "npush"         # Puzzle game
)

## Roguelike/RPG Games
rpg_games=(
    "nethack"
    "moria"
    "brogue"
    "angband"
    "cavesofqud"
)

## Strategy Games
strategy_games=(
    "curseofwar"
    "empire"
    "freeciv"
    "ltris"         # Tetris clone
    "vitetris"      # Another Tetris clone
)

## Text-based Games
text_games=(
    "myman"
    "robotfindskitten"
    "bsdgames"
    "fortune"
    "cmatrix"
)

## Additional Popular Games
extra_games=(
    "dopewars"
    "csol"
    "phear"
    "overkill"
    "ttysolitaire"
    "asciiquarium"
    "slashem"
    "zangband"
    "cataclysm"
    "powder"
)

# Combine all game arrays
all_games=(
    "${classic_games[@]}"
    "${puzzle_games[@]}"
    "${rpg_games[@]}"
    "${strategy_games[@]}"
    "${text_games[@]}"
    "${extra_games[@]}"
)

# Install all games
for game in "${all_games[@]}"; do
    install_package "$game"
done

# Special installations from source
echo -e "\e[1;36m"
figlet "Special" | lolcat
figlet "Installations" | lolcat
echo -e "\e[0m"

## Tetris from source (vitetris)
if ! command -v vitetris &> /dev/null; then
    echo -e "\e[1;34mInstalling Tetris (vitetris)...\e[0m"
    git clone https://github.com/vicgeralds/vitetris.git
    cd vitetris || exit
    ./configure
    make
    make install
    cd ..
fi

## 2048 from source
if [ ! -f "2048" ]; then
    echo -e "\e[1;34mInstalling 2048 from source...\e[0m"
    wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
    gcc -o 2048 2048.c
fi

## Hangman
if [ ! -d "HangmanPy" ]; then
    echo -e "\e[1;34mInstalling Hangman...\e[0m"
    git clone https://github.com/DwiDevelopes/HangmanPy.git
fi

## Python games
pip install freegames || {
    echo -e "\e[1;31mFailed to install python freegames\e[0m"
}

# Create game launcher script
echo -e "\e[1;33mCreating game launcher...\e[0m"
cat > "$GAMES_DIR/games-menu.sh" << 'EOF'
#!/bin/bash

# Termux Games Menu
while true; do
    clear
    echo -e "\e[1;32m"
    figlet "Termux Games" | lolcat
    echo "============================================"
    echo "   Select a game category to play:"
    echo "============================================"
    echo -e "\e[0m"
    echo -e "\e[1;36m1. Classic Arcade Games"
    echo "2. Puzzle Games"
    echo "3. RPG/Roguelike Games"
    echo "4. Strategy Games"
    echo "5. Text-based Games"
    echo "6. Extra Popular Games"
    echo "7. Tetris Games"
    echo "8. Exit"
    echo -e "\e[0m"
    
    read -p "Enter your choice (1-8): " choice
    
    case $choice in
        1)
            games=("bastet" "ninvaders" "nsnake" "moon-buggy" "pacman4console" "greed")
            ;;
        2)
            games=("nudoku" "2048" "gnugo" "gnuski" "npush")
            ;;
        3)
            games=("nethack" "moria" "brogue" "angband" "cavesofqud")
            ;;
        4)
            games=("curseofwar" "empire" "freeciv" "ltris" "vitetris")
            ;;
        5)
            games=("myman" "robotfindskitten" "bsdgames" "fortune" "cmatrix")
            ;;
        6)
            games=("dopewars" "csol" "phear" "overkill" "ttysolitaire" "asciiquarium")
            ;;
        7)
            games=("ltris" "vitetris" "bastet")
            echo -e "\e[1;33m"
            figlet "Tetris Time!" | lolcat
            echo -e "\e[0m"
            ;;
        8)
            echo -e "\e[1;32mThanks for playing! Goodbye.\e[0m"
            exit 0
            ;;
        *)
            echo -e "\e[1;31mInvalid choice! Please try again.\e[0m"
            sleep 2
            continue
            ;;
    esac
    
    clear
    echo -e "\e[1;35m"
    figlet "Game List" | lolcat
    echo -e "\e[0m"
    for i in "${!games[@]}"; do
        echo "$((i+1)). ${games[$i]}"
    done
    echo "$(( ${#games[@]} + 1 )). Back to main menu"
    
    read -p "Select a game to play (1-$((${#games[@]} + 1))): " game_choice
    
    if (( game_choice == ${#games[@]} + 1 )); then
        continue
    elif (( game_choice >= 1 && game_choice <= ${#games[@]} )); then
        clear
        echo -e "\e[1;33mLaunching ${games[$((game_choice-1))]}...\e[0m"
        ${games[$((game_choice-1))]}
        read -p "Press Enter to return to menu..."
    else
        echo -e "\e[1;31mInvalid choice!\e[0m"
        sleep 1
    fi
done
EOF

chmod +x "$GAMES_DIR/games-menu.sh"

# Create alias
if ! grep -q "alias games=" "$HOME/.bashrc"; then
    echo "alias games='cd ~/termux-games && ./games-menu.sh'" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

# Completion message
echo -e "\e[1;32m"
figlet "All Done!" | lolcat
echo "============================================"
echo "   Installation Complete!"
echo "   Over 50 games installed!"
echo "============================================"
echo -e "\e[0m"
echo -e "\e[1;33mTo start the games menu, run:\e[0m"
echo -e "\e[1;35m   games\e[0m"
echo ""
echo -e '\033[1mType ./game.sh to start the Termux-Games\033[0m' | lolcat -a
echo -e '\033[1mAfter Restaring game dan kalian pilih menu game termux tersebut \033[0m' | lolcat -a
echo -e "\e[1;36mMore resources:"
echo "  https://linkr.bio/BangRoy.go.id"
echo "  https://ai-google.vercel.app/"
echo -e "\e[0m"
echo -e "\e[1;32mYou may need to restart Termux for the 'games' command to work.\e[0m"

exit 0