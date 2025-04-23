#!/bin/bash

clear

# Function to display centered text with lolcat
center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ={1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding" | lolcat
}

# Function to display section headers
section() {
  echo ""
  center "$1"
  echo ""
}

# Main menu loop
while true; do
  clear

  # Display header with animation
  echo ""
  center "🎮 GAME TERMUX V2.2.1 🎮"
  center "By Dwi Bakti Nugroho"
  echo ""
  
  # Display decorative separator
  echo "═══════════════════════════════════════════════════════════════════════" | lolcat
  
  # Game categories
  section "🎯 CLASSIC GAMES"
  echo "  [1]  Moon-buggy          [2]  Tetris         [3]  Pacman"
  echo "  [4]  Space Invaders      [5]  Snake Game     [6]  Greed"
  echo "  [7]  Nethack             [8]  Hangman        [9]  2048"
  echo " [10]  Sudoku             [11]  Overkill      [12]  2048 (Alt)"
  
  section "🧩 STRATEGY & PUZZLE"
  echo " [13]  Brogue             [14]  Phear         [15]  Curse of War"
  echo " [16]  CSOL               [17]  Dope Wars      [18]  Gnugo"
  
  section "🕹️ RETRO & ADVENTURE"
  echo " [19]  Gnuski             [20]  Moria         [21]  Npush"
  echo " [22]  Robot Finds Kitten [23]  TTY Solitaire [24]  Myman"
  
  section "📚 INFORMATION"
  echo " [25]  About Developer    [26]  My Experience [27]  Game Benefits"
  echo " [28]  Game Risks         [29]  Community     [30]  Copyright Info"
  
  section "⚙️ SYSTEM"
  echo " [99]  EXIT"
  
  # Display decorative separator
  echo "═══════════════════════════════════════════════════════════════════════" | lolcat
  
  # Footer information
  echo ""
  center "🌐 Website: https://linkr.bio/BangRoy.go.id"
  center "📧 Contact: dwibaktidev@example.com"
  echo ""
  
  # Prompt for input
  echo -n "➤ Select an option (1-30, 99 to exit): " | lolcat -a
  read choice
  
  # Process selection
  case $choice in
    # Game options
    1) game="moon-buggy";;
    2) game="bastet";;
    3) game="pacman";;
    4) game="ninvaders";;
    5) game="nsnake";;
    6) game="greed";;
    7) game="nethack";;
    8) cd HangmanPy && python hangman.py; continue;;
    9) game="./2048";;
    10) game="nudoku";;
    11) game="0verkill";;
    12) game="2048";;
    13) game="brogue";;
    14) game="phear";;
    15) game="curseofwar";;
    16) game="csol";;
    17) game="dopewars";;
    18) game="gnugo";;
    19) game="gnuski";;
    20) game="moria";;
    21) game="npush";;
    22) game="robotfindskitten";;
    23) game="ttysolitaire";;
    24) game="myman";;
    
    # Information options
    25)
      clear
      section "👨‍💻 DEVELOPER PROFILE"
      echo "  Name: Dwi Bakti Nugroho"
      echo "  Role: Game Developer & Termux Enthusiast"
      echo "  Website: https://portofolio-dwi-bakti-n-dev-liard.vercel.app/"
      echo "  GitHub: https://github.com/DwiDevelopes"
      echo "  Contact: +62 896-5296-9323"
      echo ""
      section "🛠️ CURRENT PROJECT"
      echo "  Project: Termux Game Collection"
      echo "  Version: 2.2.1"
      echo "  Status: Actively Maintained"
      echo ""
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    26)
      clear
      section "📖 MY JOURNEY"
      echo "My experience in game development and the Termux community:"
      echo ""
      echo "  🧒 Childhood:"
      echo "  I've loved games since childhood, fascinated by how they work."
      echo "  This passion led me to programming and helping others."
      echo ""
      echo "  🧑 Adolescence:"
      echo "  I focused on helping others with databases and security."
      echo ""
      echo "  🤔 Reflection Period:"
      echo "  Learned the importance of ethical behavior in tech."
      echo ""
      echo "  🔄 Coming Soon: More chapters of my journey..."
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    27)
      clear
      section "👍 BENEFITS OF GAMING"
      echo "Positive impacts of gaming:"
      echo ""
      echo "  🧠 Cognitive Benefits:"
      echo "  - Improves problem-solving skills"
      echo "  - Enhances memory and concentration"
      echo ""
      echo "  😊 Emotional Benefits:"
      echo "  - Reduces stress and anxiety"
      echo "  - Provides sense of achievement"
      echo ""
      echo "  🤝 Social Benefits:"
      echo "  - Builds teamwork skills"
      echo "  - Creates communities"
      echo ""
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    28)
      clear
      section "⚠️ GAMING RISKS"
      echo "Potential negative effects:"
      echo ""
      echo "  🕒 Time Management:"
      echo "  - Can lead to excessive screen time"
      echo "  - May interfere with responsibilities"
      echo ""
      echo "  💪 Physical Health:"
      echo "  - Eye strain from prolonged play"
      echo "  - Sedentary lifestyle risks"
      echo ""
      echo "  ⚖️ Moderation is key!"
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    29)
      clear
      section "👥 TERMUX COMMUNITY"
      echo "Join our community:"
      echo ""
      echo "  📱 WhatsApp Channel:"
      echo "  https://whatsapp.com/channel/0029VajtSTTLikgJKxcDa01v"
      echo ""
      echo "  💡 Coming Soon:"
      echo "  - More community features"
      echo "  - Collaborative projects"
      echo ""
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    30)
      clear
      section "© COPYRIGHT NOTICE"
      echo "Legal protections:"
      echo ""
      echo "  This software is protected under:"
      echo "  - Indonesian Copyright Law"
      echo "  - International copyright treaties"
      echo ""
      echo "  Unauthorized distribution is prohibited."
      echo "  Penalties may include fines up to Rp300,000,000"
      echo "  or imprisonment up to 2 years."
      echo ""
      read -p "Press [ENTER] to continue..."
      continue
      ;;
      
    99)
      # Configure extra keys before exiting
      mkdir -p $HOME/.termux/
      echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties
      termux-reload-settings
      echo "Please restart Termux for key changes to take effect." | lolcat
      exit 0
      ;;
      
    *)
      echo "Invalid option! Please try again." | lolcat
      sleep 1
      continue
      ;;
  esac
  
  # Launch selected game
  if [ -n "$game" ]; then
    clear
    section "LOADING GAME"
    echo "Game: $game"
    echo "Controls:"
    echo "  - Press 'q' to quit most games"
    echo "  - CTRL+C works for many terminal games"
    echo ""
    read -p "Press [ENTER] to start playing..."
    $game
    read -p "Game ended. Press [ENTER] to return to menu..."
    unset game
  fi
done
