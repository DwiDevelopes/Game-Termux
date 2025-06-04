

echo -e "\e[032m" "Please Don't copy the Code And Give credits If you are using this project"
clear

echo "Installing Games in Termux by LearnTermux.tech" | lolcat

echo -e "\e[032m"
pkg update -y && pkg upgrade -y
pkg install -y ruby figlet wget clang python git
gem install lolcat

# Install all games
figlet "Installing Games" | lolcat
echo "This may take a while depending on your internet speed..." | lolcat

echo -e "\n\e[34mInstalling Bastet (Tetris)\e[0m" | lolcat
pkg install -y bastet

echo -e "\n\e[34mInstalling Pacman\e[0m" | lolcat
pkg install -y pacman4console

echo -e "\n\e[34mInstalling Moon-buggy\e[0m" | lolcat
pkg install -y moon-buggy

echo -e "\n\e[34mInstalling NInvaders (Space Invaders)\e[0m" | lolcat
pkg install -y ninvaders

echo -e "\n\e[34mInstalling NSnake (Snake Game)\e[0m" | lolcat
pkg install -y nsnake

echo -e "\n\e[34mInstalling Greed\e[0m" | lolcat
pkg install -y greed

echo -e "\n\e[34mInstalling Nethack\e[0m" | lolcat
pkg install -y nethack

echo -e "\n\e[34mInstalling Nudoku (Sudoku)\e[0m" | lolcat
pkg install -y nudoku

echo -e "\n\e[34mInstalling Hangman\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/HangmanPy.git

echo -e "\n\e[34mInstalling 2048\e[0m" | lolcat
wget https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c
gcc -o 2048 2048.c

echo -e "\n\e[34mInstalling Additional Games\e[0m" | lolcat
pkg install -y cmatrix dwarf-fortress gnugo bsd-games angband

echo -e "\n\e[34mSetting up Alias\e[0m" | lolcat
cd
echo "alias games='cd ~/Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc

echo -e "\n\e[32mInstallation Complete!\e[0m" | lolcat
echo "Visit www.LearnTermux.tech To learn Basic To Advance About Termux" | lolcat
echo ""
echo -e '\033[1mType ./games.sh to start the Termux-Games\033[0m' | lolcat
echo -e '\033[1mAfter restarting Termux, you can type "games" to directly start the Games Menu.\033[0m' | lolcat
echo -e '\033[1mYou can also run specific games by their commands (e.g., "moon-buggy", "bastet", etc.)\033[0m' | lolcat