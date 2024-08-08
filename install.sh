#game termux playfrom saya
# Termux-Games
# Coded by: dwi bakti n dev



echo -e "\e[032m" "saya mohon jangan copy project saya ini kalau kalian mau copy bayar 25rb hehe"


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
echo ""
echo -e '\033[1mType ./game.sh to start the Termux-Games\033[0m' | lolcat -a
echo -e '\033[1mAfter Restaring game dan kalian pilih menu game termux tersebut \033[0m' | lolcat -a
