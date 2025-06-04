#!/bin/bash

# Function to display header
display_header() {
    clear
    echo "======================================================" | lolcat -s 100000
    echo "               TERMUX GAME CENTER v3.0" | lolcat -s 100000
    echo "           Developed by Dwi Bakti Nugroho" | lolcat -s 100000
    echo "======================================================" | lolcat -s 100000
    echo "       🎮 Play | 💻 Code | 🛠️ Tools | ℹ️ Info" | lolcat -s 100000
    echo "======================================================" | lolcat -s 100000
}

# Function to display games menu
display_games_menu() {
    echo "=================== GAMES MENU ======================" | lolcat -s 100000
    echo "[1]  Moon-buggy        [17] Dopewars" | lolcat -s 1000
    echo "[2]  Tetris            [18] Gnugo" | lolcat -s 1000
    echo "[3]  Pacman            [19] Gnuski" | lolcat -s 1000
    echo "[4]  Space Invaders    [20] Moria" | lolcat -s 1000
    echo "[5]  Snake Game        [21] Npush" | lolcat -s 1000
    echo "[6]  Greed             [22] Robotfindskitten" | lolcat -s 1000
    echo "[7]  Nethack           [23] Ttysolitaire" | lolcat -s 1000
    echo "[8]  Hangman           [24] Myman" | lolcat -s 1000
    echo "[9]  2048              [25] Go" | lolcat -s 1000
    echo "[10] Sudoku            [26] Ski" | lolcat -s 1000
    echo "[11] Overkill          [27] Curse of War" | lolcat -s 1000
    echo "[12] 2048 (Alt)        [28] Nsnake" | lolcat -s 1000
    echo "[13] Brogue            [29] NINVADERS" | lolcat -s 1000
    echo "[14] Phear             [30] NetHack" | lolcat -s 1000
    echo "[15] Curseofwar        [31] Stickman" | lolcat -s 1000
    echo "[16] CSOL              [32] Sudoku" | lolcat -s 1000
    echo "======================================================" | lolcat -s 100000
}

# Function to display tools menu
display_tools_menu() {
    echo "=================== TOOLS MENU =======================" | lolcat -s 100000
    echo "[50] Python Editor     [53] File Browser" | lolcat -s 1000
    echo "[51] Code Runner       [54] System Info" | lolcat -s 1000
    echo "[52] Package Manager   [55] Network Tools" | lolcat -s 1000
    echo "======================================================" | lolcat -s 100000
}

# Function to display info menu
display_info_menu() {
    echo "=================== INFO MENU ========================" | lolcat -s 100000
    echo "[80] About Developer   [83] Copyright Info" | lolcat -s 1000
    echo "[81] Gaming Benefits   [84] Termux Community" | lolcat -s 1000
    echo "[82] Gaming Risks      [85] Developer Story" | lolcat -s 1000
    echo "======================================================" | lolcat -s 100000
    echo "[0] Exit" | lolcat -s 1000
    echo "======================================================" | lolcat -s 100000
}

# Function to run python code
python_editor() {
    clear
    echo "============= PYTHON EDITOR & RUNNER =============" | lolcat -s 100000
    echo "1. Create new Python file"
    echo "2. Edit existing Python file"
    echo "3. Run Python file"
    echo "4. Back to main menu"
    echo "==================================================" | lolcat -s 100000
    read -p "Select option: " py_option
    
    case $py_option in
        1)
            read -p "Enter filename (without .py extension): " pyfile
            nano $pyfile.py
            python_editor
            ;;
        2)
            ls *.py
            read -p "Enter filename to edit: " pyfile
            nano $pyfile
            python_editor
            ;;
        3)
            ls *.py
            read -p "Enter filename to run: " pyfile
            echo "Running $pyfile..." | lolcat -a
            python $pyfile
            read -p "Press [ENTER] to continue..."
            python_editor
            ;;
        4)
            main_menu
            ;;
        *)
            echo "Invalid option!" | lolcat
            sleep 1
            python_editor
            ;;
    esac
}

# Function for package management
package_manager() {
    clear
    echo "============= PACKAGE MANAGEMENT =============" | lolcat -s 100000
    echo "1. Install a package"
    echo "2. Remove a package"
    echo "3. Update packages"
    echo "4. Search for package"
    echo "5. Back to main menu"
    echo "==============================================" | lolcat -s 100000
    read -p "Select option: " pkg_option
    
    case $pkg_option in
        1)
            read -p "Enter package name to install: " pkg
            pkg install $pkg -y
            read -p "Press [ENTER] to continue..."
            package_manager
            ;;
        2)
            read -p "Enter package name to remove: " pkg
            pkg uninstall $pkg -y
            read -p "Press [ENTER] to continue..."
            package_manager
            ;;
        3)
            pkg update -y && pkg upgrade -y
            read -p "Press [ENTER] to continue..."
            package_manager
            ;;
        4)
            read -p "Enter package name to search: " pkg
            pkg search $pkg
            read -p "Press [ENTER] to continue..."
            package_manager
            ;;
        5)
            main_menu
            ;;
        *)
            echo "Invalid option!" | lolcat
            sleep 1
            package_manager
            ;;
    esac
}

# Function for system information
system_info() {
    clear
    echo "============= SYSTEM INFORMATION =============" | lolcat -s 100000
    echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)" | lolcat -a
    echo "Memory: $(free -h | grep 'Mem:' | awk '{print $3"/"$2}')" | lolcat -a
    echo "Storage: $(df -h / | tail -1 | awk '{print $3"/"$2}') used" | lolcat -a
    echo "Termux version: $(termux-info | head -1)" | lolcat -a
    echo "==============================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function for network tools
network_tools() {
    clear
    echo "============= NETWORK TOOLS =============" | lolcat -s 100000
    echo "1. Ping host"
    echo "2. Check IP address"
    echo "3. Traceroute"
    echo "4. DNS lookup"
    echo "5. Back to main menu"
    echo "=========================================" | lolcat -s 100000
    read -p "Select option: " net_option
    
    case $net_option in
        1)
            read -p "Enter host to ping: " host
            ping -c 4 $host
            read -p "Press [ENTER] to continue..."
            network_tools
            ;;
        2)
            echo "Public IP: $(curl -s ifconfig.me)" | lolcat -a
            echo "Local IP: $(ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}')" | lolcat -a
            read -p "Press [ENTER] to continue..."
            network_tools
            ;;
        3)
            read -p "Enter host for traceroute: " host
            traceroute $host
            read -p "Press [ENTER] to continue..."
            network_tools
            ;;
        4)
            read -p "Enter domain for DNS lookup: " domain
            nslookup $domain
            read -p "Press [ENTER] to continue..."
            network_tools
            ;;
        5)
            main_menu
            ;;
        *)
            echo "Invalid option!" | lolcat
            sleep 1
            network_tools
            ;;
    esac
}

# Function for file browser
file_browser() {
    clear
    echo "============= FILE BROWSER =============" | lolcat -s 100000
    echo "Current directory: $(pwd)" | lolcat -a
    echo "========================================" | lolcat -s 100000
    ls -l --color=auto
    echo "========================================" | lolcat -s 100000
    echo "1. Change directory"
    echo "2. Create file"
    echo "3. Create directory"
    echo "4. Delete file/directory"
    echo "5. Back to main menu"
    echo "========================================" | lolcat -s 100000
    read -p "Select option: " file_option
    
    case $file_option in
        1)
            read -p "Enter directory path: " dir
            cd $dir
            file_browser
            ;;
        2)
            read -p "Enter filename: " file
            touch $file
            file_browser
            ;;
        3)
            read -p "Enter directory name: " dir
            mkdir $dir
            file_browser
            ;;
        4)
            read -p "Enter file/directory to delete: " target
            rm -rf $target
            file_browser
            ;;
        5)
            main_menu
            ;;
        *)
            echo "Invalid option!" | lolcat
            sleep 1
            file_browser
            ;;
    esac
}

# Function to display about developer
about_developer() {
    clear
    echo "============= ABOUT DEVELOPER =============" | lolcat -s 100000
    echo "Name: Dwi Bakti Nugroho" | lolcat -a
    echo "Role: Termux Developer" | lolcat -a
    echo "Specialty: Game Development" | lolcat -a
    echo "===========================================" | lolcat -s 100000
    echo "Contact Information:" | lolcat -a
    echo "Website: https://linkr.bio/BangRoy.go.id" | lolcat -a
    echo "GitHub: https://github.com/DwiDevelopes" | lolcat -a
    echo "WhatsApp: https://wa.me/+6289652969323" | lolcat -a
    echo "TikTok: www.Tiktok.com/@Royhtml" | lolcat -a
    echo "===========================================" | lolcat -s 100000
    echo "This application is protected by copyright." | lolcat -a
    echo "Unauthorized distribution is prohibited." | lolcat -a
    echo "===========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to display developer story
developer_story() {
    clear
    echo "============= DEVELOPER STORY =============" | lolcat -s 100000
    echo "Childhood:" | lolcat -a
    echo "Since childhood, I've been fascinated by games - how they're made and how they work. This curiosity led me to programming." | lolcat -a
    echo "" | lolcat -a
    echo "Teen Years:" | lolcat -a
    echo "As a teen, I wanted to help others with technology, from databases to security. Money was tight, but passion kept me going." | lolcat -a
    echo "" | lolcat -a
    echo "Dark Period:" | lolcat -a
    echo "I once considered unethical paths like data theft, but seeing friends face consequences made me realize the value of ethical work." | lolcat -a
    echo "" | lolcat -a
    echo "Turning Point:" | lolcat -a
    echo "Now I focus on creating positive tools and games to help others learn and enjoy technology responsibly." | lolcat -a
    echo "===========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to display gaming benefits
gaming_benefits() {
    clear
    echo "============= GAMING BENEFITS =============" | lolcat -s 100000
    echo "1. Cognitive Improvement: Enhances problem-solving and logic skills." | lolcat -a
    echo "2. Creativity Boost: Encourages strategic and creative thinking." | lolcat -a
    echo "3. Stress Relief: Helps reduce stress and recover from trauma." | lolcat -a
    echo "4. Sportsmanship: Teaches respect for opponents." | lolcat -a
    echo "5. Memory Enhancement: Improves memory capacity." | lolcat -a
    echo "6. Mood Improvement: Simple games can boost mood." | lolcat -a
    echo "7. Reading Skills: Can help improve reading ability." | lolcat -a
    echo "8. Language Learning: Online games help with foreign languages." | lolcat -a
    echo "9. Social Connections: Online games help make friends." | lolcat -a
    echo "===========================================" | lolcat -s 100000
    echo "Play games to relieve stress, but remember balance is key!" | lolcat -a
    echo "===========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to display gaming risks
gaming_risks() {
    clear
    echo "============= GAMING RISKS =============" | lolcat -s 100000
    echo "1. Addiction: Games are designed to be engaging and habit-forming." | lolcat -a
    echo "2. Health Issues: Can cause sleep disorders and muscle problems." | lolcat -a
    echo "3. Academic Impact: May reduce focus on studies/work." | lolcat -a
    echo "4. Social Withdrawal: May lead to neglecting real social interactions." | lolcat -a
    echo "5. Aggressive Behavior: Violent content may increase aggression." | lolcat -a
    echo "6. Physical Strain: Prolonged sitting causes muscle/joint issues." | lolcat -a
    echo "7. Vision Problems: Blue light from screens harms eyesight." | lolcat -a
    echo "========================================" | lolcat -s 100000
    echo "Advice: Game in moderation, especially at night!" | lolcat -a
    echo "========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to display copyright info
copyright_info() {
    clear
    echo "============= COPYRIGHT INFO =============" | lolcat -s 100000
    echo "Indonesian Copyright Law Provisions:" | lolcat -a
    echo "1. Article 72(1): Minimum 1 month jail and/or Rp1,000,000 fine for unauthorized publication." | lolcat -a
    echo "2. Article 112: Maximum 2 years jail and/or Rp300,000,000 fine for commercial copyright violation." | lolcat -a
    echo "3. Article 114: Maximum Rp100,000,000 fine for allowing sale of infringing goods." | lolcat -a
    echo "=========================================" | lolcat -s 100000
    echo "This software is protected by copyright law." | lolcat -a
    echo "Unauthorized distribution is prohibited." | lolcat -a
    echo "=========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to display termux community info
termux_community() {
    clear
    echo "============= TERMUX COMMUNITY =============" | lolcat -s 100000
    echo "Join our community for support and updates:" | lolcat -a
    echo "WhatsApp Channel: https://whatsapp.com/channel/0029VajtSTTLikgJKxcDa01v" | lolcat -a
    echo "===========================================" | lolcat -s 100000
    echo "More community links coming soon..." | lolcat -a
    echo "===========================================" | lolcat -s 100000
    read -p "Press [ENTER] to continue..."
}

# Function to run selected game
run_game() {
    case $1 in
        1) game="moon-buggy"; cmd="moon-buggy"; inst="Press q to exit";;
        2) game="Tetris"; cmd="bastet"; inst="Press CTRL+c to exit";;
        3) game="Pacman"; cmd="pacman"; inst="Press q to exit";;
        4) game="Space Invaders"; cmd="ninvaders || nInvaders"; inst="Press q to exit";;
        5) game="Snake Game"; cmd="nsnake"; inst="Press q to exit";;
        6) game="Greed"; cmd="greed"; inst="Press q then y to exit";;
        7) game="Nethack"; cmd="nethack"; inst="Press CTRL+c then answer question to quit";;
        8) game="Hangman"; cmd="cd HangmanPy && python hangman.py"; inst="Game will ask to quit when finished";;
        9) game="2048"; cmd="./2048"; inst="Press q then y to exit";;
        10) game="Sudoku"; cmd="nudoku"; inst="Press CTRL+c to exit";;
        11) game="Overkill"; cmd="0verkill"; inst="Press CTRL+c to exit";;
        12) game="2048 (Alt)"; cmd="2048"; inst="Press CTRL+c to exit";;
        13) game="Brogue"; cmd="brogue"; inst="Press CTRL+c to exit";;
        14) game="Phear"; cmd="phear"; inst="Press CTRL+c to exit";;
        15) game="Curseofwar"; cmd="curseofwar"; inst="Press CTRL+c to exit";;
        16) game="CSOL"; cmd="csol"; inst="Press CTRL+c to exit";;
        17) game="Dopewars"; cmd="dopewars"; inst="Press CTRL+c to exit";;
        18) game="Gnugo"; cmd="gnugo"; inst="Press CTRL+c to exit";;
        19) game="Gnuski"; cmd="gnuski"; inst="Press CTRL+c to exit";;
        20) game="Moria"; cmd="moria"; inst="Press CTRL+c to exit";;
        21) game="Npush"; cmd="npush"; inst="Press CTRL+c to exit";;
        22) game="Robotfindskitten"; cmd="robotfindskitten"; inst="Press CTRL+c to exit";;
        23) game="Ttysolitaire"; cmd="ttysolitaire"; inst="Press CTRL+c to exit";;
        24) game="Myman"; cmd="myman"; inst="Press CTRL+c to exit";;
        25) game="Go"; cmd="go"; inst="Press CTRL+c to exit";;
        26) game="Ski"; cmd="ski"; inst="Press CTRL+c to exit";;
        27) game="Curse of War"; cmd="curse of war"; inst="Press CTRL+c to exit";;
        28) game="Nsnake"; cmd="Nsnake"; inst="Press CTRL+c to exit";;
        29) game="NINVADERS"; cmd="NINVADERS"; inst="Press CTRL+c to exit";;
        30) game="NetHack"; cmd="NetHack"; inst="Press CTRL+c to exit";;
        31) game="Stickman"; cmd="Stickman"; inst="Press CTRL+c to exit";;
        32) game="Sudoku"; cmd="Sudoku"; inst="Press CTRL+c to exit";;
        *) echo "Invalid game selection!" | lolcat; return;;
    esac
    
    clear
    echo "Starting $game..." | lolcat -a
    echo "Instructions: $inst" | lolcat -a
    echo "=====================================" | lolcat -s 100000
    read -p "Press [ENTER] to start the game..."
    eval $cmd
    read -p "Press [ENTER] to return to menu..."
}

# Main menu function
main_menu() {
    while true; do
        display_header
        display_games_menu
        display_tools_menu
        display_info_menu
        
        read -p "Select an option (0-99): " choice
        
        case $choice in
            [1-9]|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32)
                run_game $choice
                ;;
            50)
                python_editor
                ;;
            51)
                clear
                ls *.py
                read -p "Enter Python file to run: " pyfile
                python $pyfile
                read -p "Press [ENTER] to continue..."
                ;;
            52)
                package_manager
                ;;
            53)
                file_browser
                ;;
            54)
                system_info
                ;;
            55)
                network_tools
                ;;
            80)
                about_developer
                ;;
            81)
                gaming_benefits
                ;;
            82)
                gaming_risks
                ;;
            83)
                copyright_info
                ;;
            84)
                termux_community
                ;;
            85)
                developer_story
                ;;
            0)
                echo "Exiting Termux Game Center..." | lolcat -a
                mkdir -p $HOME/.termux/
                echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties
                termux-reload-settings
                echo "Keyboard settings adjusted. Please restart Termux for full changes." | lolcat -a
                exit 0
                ;;
            *)
                echo "Invalid option! Please try again." | lolcat
                sleep 1
                ;;
        esac
    done
}

# Check requirements and install if needed
check_requirements() {
    if ! command -v lolcat &> /dev/null; then
        echo "Installing lolcat for colored output..." | lolcat -a
        pkg install ruby -y
        gem install lolcat
    fi
    
    if ! command -v bastet &> /dev/null; then
        echo "Installing some games that might be missing..." | lolcat -a
        pkg install game-repo -y
        pkg install bastet moon-buggy nudoku nsnake ninvaders greed nethack -y
    fi
    
    # Create simple 2048 game if not exists
    if [ ! -f 2048 ]; then
        echo "Creating simple 2048 game..." | lolcat -a
        cat > 2048 << 'EOL'
#!/bin/bash
# Simple 2048 implementation in bash

# Initialize the game board
declare -A board
for ((i=0; i<4; i++)); do
    for ((j=0; j<4; j++)); do
        board[$i,$j]=0
    done
done

# Function to print the board
print_board() {
    clear
    echo "2048 - Use WASD to move, q to quit"
    echo "-------------------------"
    for ((i=0; i<4; i++)); do
        for ((j=0; j<4; j++)); do
            printf "| %4d " ${board[$i,$j]}
        done
        echo "|"
        echo "-------------------------"
    done
}

# Function to add a new tile (2 or 4)
add_tile() {
    while true; do
        local row=$((RANDOM % 4))
        local col=$((RANDOM % 4))
        if [[ ${board[$row,$col]} -eq 0 ]]; then
            board[$row,$col]=$(( (RANDOM % 2 + 1) * 2 ))
            break
        fi
    done
}

# Initialize game
add_tile
add_tile
print_board

# Main game loop
while true; do
    read -n1 -s key
    case $key in
        w|W) echo "Up";;
        a|A) echo "Left";;
        s|S) echo "Down";;
        d|D) echo "Right";;
        q|Q) break;;
        *) continue;;
    esac
    add_tile
    print_board
done
EOL
        chmod +x 2048
    fi
}

# Initial setup
check_requirements
main_menu
