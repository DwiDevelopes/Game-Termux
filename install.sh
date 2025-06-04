echo -e "\e[032m" "Please Don't copy the Code And Give credits If you are using this project"
clear

echo "Installing Games in Termux by dwi bakti n dev" | lolcat

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

echo -e "\n\e[34mInstalling CMatrix\e[0m" | lolcat
pkg install -y cmatrix

echo -e "\n\e[34mInstalling Dwarf Fortress\e[0m" | lolcat
pkg install -y dwarf-fortress

echo -e "\n\e[34mInstalling Chess (GNU Chess)\e[0m" | lolcat
pkg install -y gnchess

echo -e "\n\e[34mInstalling Backgammon\e[0m" | lolcat
pkg install -y gnubg

echo -e "\n\e[34mInstalling Adventure\e[0m" | lolcat
pkg install -y adventure

echo -e "\n\e[34mInstalling Sokoban\e[0m" | lolcat
pkg install -y xsok

echo -e "\n\e[34mInstalling Zork\e[0m" | lolcat
pkg install -y frotz
wget https://github.com/Dwidevelopes/zork1.zip
unzip zork1.zip

echo -e "\n\e[34mInstalling Angband\e[0m" | lolcat
pkg install -y angband

echo -e "\n\e[34mInstalling Tron\e[0m" | lolcat
pkg install -y xtron

echo -e "\n\e[34mInstalling Worm\e[0m" | lolcat
pkg install -y worm

echo -e "\n\e[34mInstalling Battleship\e[0m" | lolcat
pkg install -y bs

echo -e "\n\e[34mInstalling Solitaire\e[0m" | lolcat
pkg install -y ace-of-penguins

echo -e "\n\e[34mInstalling Minesweeper\e[0m" | lolcat
pkg install -y ace-of-penguins

echo -e "\n\e[34mInstalling Simon\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/simon.git

echo -e "\n\e[34mInstalling Wordle\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/wordle.git

echo -e "\n\e[34mInstalling Quiz Game\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/quiz-game.git

echo -e "\n\e[34mInstalling ASCII Racing\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/ascii-racing.git

echo -e "\n\e[34mInstalling Tower Defense\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/tower-defense.git

echo -e "\n\e[34mInstalling RPG Game\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/text-rpg.git

echo -e "\n\e[34mInstalling Blackjack\e[0m" | lolcat
pkg install -y blackjack

echo -e "\n\e[34mInstalling Poker\e[0m" | lolcat
pkg install -y poker

echo -e "\n\e[34mInstalling Yahtzee\e[0m" | lolcat
pkg install -y yahtzee

echo -e "\n\e[34mInstalling Checkers\e[0m" | lolcat
pkg install -y checkers

echo -e "\n\e[34mInstalling Connect Four\e[0m" | lolcat
pkg install -y connect4

echo -e "\n\e[34mInstalling Reversi\e[0m" | lolcat
pkg install -y reversi

echo -e "\n\e[34mInstalling Go\e[0m" | lolcat
pkg install -y gnugo

echo -e "\n\e[34mInstalling Dungeon Crawl\e[0m" | lolcat
pkg install -y crawl

echo -e "\n\e[34mInstalling Rogue\e[0m" | lolcat
pkg install -y rogue

echo -e "\n\e[34mInstalling Moria\e[0m" | lolcat
pkg install -y moria

echo -e "\n\e[34mInstalling Larn\e[0m" | lolcat
pkg install -y larn

echo -e "\n\e[34mInstalling Omega\e[0m" | lolcat
pkg install -y omega

echo -e "\n\e[34mInstalling Empire\e[0m" | lolcat
pkg install -y empire

echo -e "\n\e[34mInstalling Wargames\e[0m" | lolcat
pkg install -y wargames

echo -e "\n\e[34mInstalling Hunt the Wumpus\e[0m" | lolcat
pkg install -y wumpus

echo -e "\n\e[34mInstalling Robot Finds Kitten\e[0m" | lolcat
pkg install -y robotfindskitten

echo -e "\n\e[34mInstalling BSD Games\e[0m" | lolcat
pkg install -y bsd-games

echo -e "\n\e[34mInstalling Text Golf\e[0m" | lolcat
pkg install -y golf

echo -e "\n\e[34mInstalling Text Football\e[0m" | lolcat
pkg install -y football

echo -e "\n\e[34mInstalling Tic-Tac-Toe\e[0m" | lolcat
pkg install -y tictactoe

echo -e "\n\e[34mInstalling Bounce\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/bounce.git

echo -e "\n\e[34mInstalling Flappy Bird\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/flappy-bird.git

echo -e "\n\e[34mInstalling Pong\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/pong.git

echo -e "\n\e[34mInstalling Breakout\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/breakout.git

echo -e "\n\e[34mInstalling Frogger\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/frogger.git

echo -e "\n\e[34mInstalling Asteroids\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/asteroids.git

echo -e "\n\e[34mInstalling Space War\e[0m" | lolcat
pkg install -y spacewar

echo -e "\n\e[34mInstalling Star Trek\e[0m" | lolcat
pkg install -y startrek

echo -e "\n\e[34mInstalling Text Tennis\e[0m" | lolcat
pkg install -y tennis

echo -e "\n\e[34mInstalling Text Boxing\e[0m" | lolcat
pkg install -y boxing

echo -e "\n\e[34mInstalling Text Basketball\e[0m" | lolcat
pkg install -y basketball

echo -e "\n\e[34mInstalling Air Traffic\e[0m" | lolcat
pkg install -y airtraffic

echo -e "\n\e[34mInstalling Atari Breakout\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/atari-breakout.git

echo -e "\n\e[34mInstalling Boulderdash\e[0m" | lolcat
pkg install -y boulderdash

echo -e "\n\e[34mInstalling Cave Explorer\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/cave-explorer.git

echo -e "\n\e[34mInstalling Cookie Clicker\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/cookie-clicker.git

echo -e "\n\e[34mInstalling Curse of War\e[0m" | lolcat
pkg install -y curseofwar

echo -e "\n\e[34mInstalling Dope Wars\e[0m" | lolcat
pkg install -y dopewars

echo -e "\n\e[34mInstalling Duel\e[0m" | lolcat
pkg install -y duel

echo -e "\n\e[34mInstalling Fallout\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/fallout-terminal.git

echo -e "\n\e[34mInstalling Frozen Bubble\e[0m" | lolcat
pkg install -y frozen-bubble

echo -e "\n\e[34mInstalling Galaga\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/galaga.git

echo -e "\n\e[34mInstalling Game of Life\e[0m" | lolcat
pkg install -y life

echo -e "\n\e[34mInstalling Gradius\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/gradius.git

echo -e "\n\e[34mInstalling Jetpack\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/jetpack.git

echo -e "\n\e[34mInstalling Jumpman\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/jumpman.git

echo -e "\n\e[34mInstalling Labyrinth\e[0m" | lolcat
pkg install -y labyrinth

echo -e "\n\e[34mInstalling Lunar Lander\e[0m" | lolcat
pkg install -y lunarlander

echo -e "\n\e[34mInstalling M.U.L.E.\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/mule.git

echo -e "\n\e[34mInstalling Missile Command\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/missile-command.git

echo -e "\n\e[34mInstalling Monkey\e[0m" | lolcat
pkg install -y monkey

echo -e "\n\e[34mInstalling Outpost\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/outpost.git

echo -e "\n\e[34mInstalling Pipe Mania\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/pipe-mania.git

echo -e "\n\e[34mInstalling Planetarium\e[0m" | lolcat
pkg install -y planetarium

echo -e "\n\e[34mInstalling Police Quest\e[0m" | lolcat
pkg install -y policequest

echo -e "\n\e[34mInstalling Q*bert\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/qbert.git

echo -e "\n\e[34mInstalling Rogue Legacy\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/rogue-legacy.git

echo -e "\n\e[34mInstalling Scorched Earth\e[0m" | lolcat
pkg install -y scorched3d

echo -e "\n\e[34mInstalling Space Taxi\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/space-taxi.git

echo -e "\n\e[34mInstalling Star Control\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/star-control.git

echo -e "\n\e[34mInstalling Super Mario\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/super-mario.git

echo -e "\n\e[34mInstalling Tempest\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/tempest.git

echo -e "\n\e[34mInstalling Teris\e[0m" | lolcat
pkg install -y bastet

echo -e "\n\e[34mInstalling The Oregon Trail\e[0m" | lolcat
pkg install -y oregon-trail

echo -e "\n\e[34mInstalling Thrust\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/thrust.git

echo -e "\n\e[34mInstalling Time Pilot\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/time-pilot.git

echo -e "\n\e[34mInstalling Tower of Hanoi\e[0m" | lolcat
pkg install -y hanoi

echo -e "\n\e[34mInstalling Ultima\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/ultima.git

echo -e "\n\e[34mInstalling Vanguard\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/vanguard.git

echo -e "\n\e[34mInstalling Wolfenstein\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/wolfenstein.git

echo -e "\n\e[34mInstalling X-Com\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/xcom.git

echo -e "\n\e[34mInstalling Yars' Revenge\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/yars-revenge.git

echo -e "\n\e[34mInstalling Zork II\e[0m" | lolcat
wget https://github.com/Dwidevelopes/zork/raw/master/zork2.zip
unzip zork2.zip

echo -e "\n\e[34mInstalling Zork III\e[0m" | lolcat
wget https://github.com/Dwidevelopes/zork/raw/master/zork3.zip
unzip zork3.zip

echo -e "\n\e[34mInstalling ZZT\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/zzt.git

echo -e "\n\e[34mInstalling Arkanoid\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/arkanoid.git

echo -e "\n\e[34mInstalling Boulder Dash\e[0m" | lolcat
pkg install -y boulderdash

echo -e "\n\e[34mInstalling BurgerTime\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/burgertime.git

echo -e "\n\e[34mInstalling Centipede\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/centipede.git

echo -e "\n\e[34mInstalling Crystal Caves\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/crystal-caves.git

echo -e "\n\e[34mInstalling Defender\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/defender.git

echo -e "\n\e[34mInstalling Donkey Kong\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/donkey-kong.git

echo -e "\n\e[34mInstalling Double Dragon\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/double-dragon.git

echo -e "\n\e[34mInstalling Dragon's Lair\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/dragons-lair.git

echo -e "\n\e[34mInstalling Elevator\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/elevator.git

echo -e "\n\e[34mInstalling Gauntlet\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/gauntlet.git

echo -e "\n\e[34mInstalling Ghostbusters\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/ghostbusters.git

echo -e "\n\e[34mInstalling Joust\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/joust.git

echo -e "\n\e[34mInstalling Karateka\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/karateka.git

echo -e "\n\e[34mInstalling Lemmings\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/lemmings.git

echo -e "\n\e[34mInstalling Prince of Persia\e[0m" | lolcat
git clone https://github.com/Dwidevelopes/prince-of-persia.git

echo -e "\n\e[34mSetting up Alias\e[0m" | lolcat
cd
echo "alias games='cd ~/Termux-Games && bash games.sh'" >> /data/data/com.termux/files/usr/etc/bash.bashrc

echo -e "\n\e[32mInstallation Complete!\e[0m" | lolcat
echo "Visit www.LearnTermux.tech To learn Basic To Advance About Termux" | lolcat
echo ""
echo -e '\033[1mType ./games.sh to start the Termux-Games\033[0m' | lolcat
echo -e '\033[1mAfter restarting Termux, you can type "games" to directly start the Games Menu.\033[0m' | lolcat
echo -e '\033[1mYou can also run specific games by their commands (e.g., "moon-buggy", "bastet", etc.)\033[0m' | lolcat