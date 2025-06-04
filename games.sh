# Initialize variables
n=1
GAMES_DIR="$HOME/termux-games"
mkdir -p "$GAMES_DIR"

# Function to display centered text
center_text() {
    local text="$1"
    local cols=$(tput cols)
    printf "%*s\n" $(( (${#text} + cols) / 2 )) "$text"
}

# Function to display header
display_header() {
    clear
    echo -e "\e[1;32m"
    center_text "😭😖😲🫠🙃😜😫     PLAY NOW      😲🫠🙃😜😫😯😣" | lolcat -s 100000 
    echo "______________________________________________________" | lolcat -s 100000 
    center_text "Game Termux V2.2.1" | lolcat -s 100000 
    echo "                                                      " 
    center_text " ______   ____   ____    __    ___          |   /     " 
    center_text "   |      |      |   |   |   \/  |   |    | | /       " 
    center_text "   |      |___   __  |   |       |   |    | |         " 
    center_text "   |      |      |   \   |       |   |    | | \       " 
    center_text "   |      |___   |    \  |       |   | ___| |  \      " 
    echo "                                                      " 
    center_text "  _____      😎    __    ___    ____                  " 
    center_text " |          / \    |   \/  |    |                     " 
    center_text " |  _ _   /  _  \  |       |    |                     " 
    center_text " |    |  /       \ |       |    |___                  " 
    center_text " |____|            |       |    |                     " 
    center_text "                                |___                  " 
    echo "______________________________________________________" | lolcat -s 100000 
    center_text "🩻🩻🩻🩻🩻     Dwi Bakti Nugroho  🩻🩻🩻🩻🩻🩻🩻" | lolcat -s 100000 
    center_text "----------------------Royhtml-------------------------" | lolcat
    center_text "-----{ Website: https://linkr.bio/BangRoy.go.id }-----" | lolcat -as 50
    center_text "---Game Tersebut Dilindungi Oleh dwi bakti n dev------" | lolcat -as 50
    center_text "------Game dilindungi hak cipta dwi bakti n dev-------" | lolcat -as 50
    center_text "---------------------💕💕----------------------------" | lolcat 
    echo
}

# Main menu loop
while ((n < 3)); do
    display_header
    
    # Display game options
    games=(
        "Moon-buggy" "Tetris" "Pacman" "Space-Invaders" "Snake-Game" 
        "Greed" "Nethack" "Hangman" "2048" "nudoku" "Overkill" "2048 ke 2"
        "brogue" "phear" "curseofwar" "csol" "dopewars" "gnugo" "gnuski"
        "moria" "npush" "robotfindskitten" "ttysolitaire" "myman" "go"
        "ski" "curse of war" "Nsnake" "NINVADERS" "NetHack" "Stickman" "Sudoku"
    )
    
    # Display games in two columns
    for ((i=0; i<${#games[@]}; i++)); do
        printf "[%2d] %-20s" "$((i+1))" "${games[$i]}"
        if (( (i+1) % 2 == 0 )); then
            echo
        fi
    done | lolcat -as 1000
    
    # Additional menu options
    echo
    echo "[33] Pengalaman dwi bakti" | lolcat -as 1000
    echo "[34] Cek si pembuat" | lolcat -as 1000
    echo "[35] Dampak Positif Bermain Games" | lolcat -as 1000
    echo "[36] Dampak Negatif Bermain Games" | lolcat -as 1000
    echo "[37] Termux Comunity Source" | lolcat -as 1000
    echo "[38] Hak Cipta" | lolcat -as 1000
    echo "[39] KELUAR" | lolcat -as 1000
    echo
    
    # Get user input
    read -p "Enter your choice (1-39): " option
    
    case $option in
        1)  # Moon-buggy
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Moon-buggy: "
            moon-buggy
            ;;
        2)  # Tetris
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Tetris: "
            bastet || echo "Tetris game not found! Try installing 'bastet' package." | lolcat
            ;;
        3)  # Pacman
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Pacman: "
            pacman4console || echo "Pacman game not found! Try installing 'pacman4console' package." | lolcat
            ;;
        4)  # Space-Invaders
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Space Invaders: "
            ninvaders || nInvaders || echo "Space Invaders not found! Try installing 'ninvaders' package." | lolcat
            ;;
        5)  # Snake-Game
            echo "Press q to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Snake Game: "
            nsnake || echo "Snake game not found! Try installing 'nsnake' package." | lolcat
            ;;
        6)  # Greed
            echo "Press q then y to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Greed: "
            greed || echo "Greed game not found! Try installing 'greed' package." | lolcat
            ;;
        7)  # Nethack
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Nethack: "
            nethack || echo "Nethack not found! Try installing 'nethack' package." | lolcat
            ;;
        8)  # Hangman
            echo "After game ends, you'll return to menu" | lolcat -a
            read -p "Press [ENTER] to start Hangman: "
            if [ -d "$GAMES_DIR/HangmanPy" ]; then
                cd "$GAMES_DIR/HangmanPy" && python hangman.py
                cd -
            else
                echo "Hangman not found! Try installing it first." | lolcat
            fi
            ;;
        9)  # 2048
            echo "Press q then y to exit the game" | lolcat -a
            read -p "Press [ENTER] to start 2048: "
            if [ -f "$GAMES_DIR/2048" ]; then
                "$GAMES_DIR/2048"
            else
                play2048 || echo "2048 game not found!" | lolcat
            fi
            ;;
        10) # nudoku
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Sudoku: "
            nudoku || echo "Sudoku game not found! Try installing 'nudoku' package." | lolcat
            ;;
        11) # Overkill
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Overkill: "
            0verkill || overkill || echo "Overkill not found! Try installing 'overkill' package." | lolcat
            ;;
        12) # 2048 ke 2
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start 2048 (alternative): "
            play2048 || 2048 || echo "2048 game not found!" | lolcat
            ;;
        13) # brogue
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Brogue: "
            brogue || echo "Brogue not found! Try installing 'brogue' package." | lolcat
            ;;
        14) # phear
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Phear: "
            phear || echo "Phear not found! Try installing 'phear' package." | lolcat
            ;;
        15) # curseofwar
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Curse of War: "
            curseofwar || echo "Curse of War not found! Try installing 'curseofwar' package." | lolcat
            ;;
        16) # csol
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start CSOL: "
            csol || echo "CSOL not found! Try installing 'csol' package." | lolcat
            ;;
        17) # dopewars
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Dope Wars: "
            dopewars || echo "Dope Wars not found! Try installing 'dopewars' package." | lolcat
            ;;
        18) # gnugo
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start GNU Go: "
            gnugo || echo "GNU Go not found! Try installing 'gnugo' package." | lolcat
            ;;
        19) # gnuski
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start GNU Ski: "
            gnuski || echo "GNU Ski not found! Try installing 'gnuski' package." | lolcat
            ;;
        20) # moria
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Moria: "
            moria || echo "Moria not found! Try installing 'moria' package." | lolcat
            ;;
        21) # npush
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start NPush: "
            npush || echo "NPush not found! Try installing 'npush' package." | lolcat
            ;;
        22) # robotfindskitten
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Robot Finds Kitten: "
            robotfindskitten || echo "Robot finds kitten not found! Try installing 'robotfindskitten' package." | lolcat
            ;;
        23) # ttysolitaire
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start TTY Solitaire: "
            ttysolitaire || echo "TTY Solitaire not found! Try installing 'ttysolitaire' package." | lolcat
            ;;
        24) # myman
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start MyMan: "
            myman || echo "MyMan not found! Try installing 'myman' package." | lolcat
            ;;
        25) # go
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Go: "
            go-game || go || echo "Go game not found! Try installing 'go' package." | lolcat
            ;;
        26) # ski
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Ski: "
            ski || echo "Ski game not found! Try installing 'bsdgames' package." | lolcat
            ;;
        27) # curse of war
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Curse of War: "
            curseofwar || echo "Curse of War not found! Try installing 'curseofwar' package." | lolcat
            ;;
        28) # Nsnake
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Snake: "
            nsnake || echo "Snake game not found! Try installing 'nsnake' package." | lolcat
            ;;
        29) # NINVADERS
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Space Invaders: "
            ninvaders || nInvaders || echo "Space Invaders not found! Try installing 'ninvaders' package." | lolcat
            ;;
        30) # NetHack
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start NetHack: "
            nethack || echo "NetHack not found! Try installing 'nethack' package." | lolcat
            ;;
        31) # Stickman
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Stickman: "
            stickman || echo "Stickman not found! Try installing 'stickman' package." | lolcat
            ;;
        32) # Sudoku
            echo "Press CTRL+c to exit the game" | lolcat -a
            read -p "Press [ENTER] to start Sudoku: "
            nudoku || sudoku || echo "Sudoku not found! Try installing 'nudoku' package." | lolcat
            ;;
        33) # Pengalaman dwi bakti
            clear
            echo "Pengalaman Cerita Fiksi dan rekayasa hampir nyata sedikit banyak perbedaan" | lolcat -s 10000
            echo "Masa Kecil: " | lolcat
            echo "masa kecil saya sangat menyukai game mulai cara melihat cara pembuatanya hingga sampai pemograman nya dan saya sangat senang dalam pemograman tersebut dan ingin membantu semuah orang" | lolcat -as 100
            echo "Masa Remaja : " | lolcat
            echo "saya akan berusaha membantu orang lain di saat muda mulai dari database hingga membantu orang lain dengan hack dikala itu saya sangat susah mendapatkan uang" | lolcat -as 100
            echo "Masa Berfikir : " | lolcat
            echo "saya mulai berfikir banyak hal tentang mencari uang dengan sangat keji hingga sampai pernah hack data dan menjual ke dark web dikala itu sangat sulit mendapatkan uang" | lolcat -as 100
            echo "Masa mulai mengerti : " | lolcat
            echo "masa itu banyak teman saya yang kena tangkap dan di bunuh itu membuat saya sangat sedih dan saya sadar lebih baik kita menjadi baik dari pada menjadi penjahat tanpa sebab" | lolcat -as 100
            echo "Mengingat masa lalu kelam : " | lolcat
            echo "dan di masa kelam saya banyak yang tidak menyukai saya dan banyak sekali konflik pada kejadian tersebut yang membuat saya pusing dan ingin bunuh diri yang sangat menyesal atas banyak korban tersebut" | lolcat -as 100
            echo "Mengingat Cerita : " | lolcat
            echo "masalah banyak sekali hampir membuat ku merasa muak dan gw pun memulai untuk melampiaskan ketakutan gw ini dengan belajar banyak hal dalam ilmu pengetahuan yang gw dapat selama ini dan membuka lembaran baru" | lolcat -as 100
            echo " Bersambung update patch berikutnya " | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
        34) # Cek si pembuat
            clear
            echo "𝐀𝐛𝐨𝐮𝐭 𝐦𝐞: " | lolcat
            echo "  ___  " | lolcat -as 100
            echo " |[_]| " | lolcat -as 100
            echo " |+ :|  Hello " | lolcat -as 100
            echo " '---' " | lolcat | lolcat -as 100
            echo " 😏😣😯😫😜🙃🫠😲😖😭 " | lolcat | lolcat -as 100
            echo " Game Ini Dilindungi Oleh Hak Cipta Tidak Boleh Untuk Di Ambil " | lolcat | lolcat -as 100
            echo "[-----------------------------------------------------]" | lolcat -as 100
            echo " [ɴᴀᴍᴇ] = [Dwi Bakti N dev] " | lolcat -as 50
            echo ""
            echo " [ᴡᴇʙsɪᴛᴇ] = [https://portofolio-dwi-bakti-n-dev-liard.vercel.app/] " | lolcat -as 50
            echo ""
            echo " [ɢɪᴛʜᴜʙ] = [https://github.com/DwiDevelopes] " | lolcat -as 50
            echo ""
            echo " [Whatsapp] = [https://wa.me/+6289652969323] " | lolcat -as 50
            echo ""
            echo "[Tiktok] = [www.Tiktok.com/@Royhtml] " | lolcat -as 50
            echo "[----------------Versi 2.2.1-------------------] " | lolcat -as 50
            echo "[-----------------------------------------------------]" | lolcat -as 100
            read -p "Press [ENTER] to continue: "
            ;;
        35) # Dampak positif
            clear
            echo "Dampak Positif Dalam Bermain Games" | lolcat -s 10000
            echo "Bermain game bisa memiliki dampak positif, seperti : " | lolcat -s 9987
            echo "Meningkatkan kemampuan kognitif : Bermain game dapat meningkatkan kemampuan problem solving dan logika. " | lolcat -as 100
            echo "Meningkatkan kreativitas: Bermain game dapat melatih pemain untuk menyusun strategi dan berpikir kreatif. " | lolcat -as 100
            echo "Menurunkan stres : Bermain game dapat membantu mengurangi stres dan pemulihan trauma." | lolcat -as 100
            echo "Meningkatkan rasa sportifitas : Bermain game dapat mengajarkan pemain untuk saling menghargai lawan, baik menang maupun kalah. " | lolcat -as 100
            echo "Meningkatkan kapasitas memori : Bermain game dapat meningkatkan kapasitas memori. " | lolcat -as 100
            echo "Meningkatkan suasana hati : Bermain game sederhana seperti menyusun balok, membangun kota, atau berkebun dapat memperbaiki suasana hati dan membuat pemain lebih relaks.  " | lolcat -as 100
            echo "Membantu meningkatkan kemampuan baca: Bermain game dapat membantu meningkatkan kemampuan baca.  " | lolcat -as 100
            echo "Membantu belajar bahasa asing: Bermain game online dapat membantu anak belajar bahasa asing. " | lolcat -as 100
            echo "Membantu membuat banyak teman: Bermain game online dapat membantu anak membuat banyak teman.  " | lolcat -as 100
            echo "Isilah Waktu Kalian Dengan Bermain Games Untuk Menghilangkan Stress Dan Banyak Masalah Dalam Hidup Kalian Intinya Mimin Kaish Tau Kalu Banyak Masalah Carilah Kehidupan Yang Mebuat Kita Merasa Nayaman 🤗🤗  " | lolcat -as 100
            read -p "Press [ENTER] to continue: "
            ;;
        36) # Dampak negatif
            clear
            echo "Dampak Negative Dalam Bermain Games" | lolcat -s 10000
            echo "Bermain game secara berlebihan dapat menimbulkan dampak negatif, seperti : " | lolcat -s 9987
            echo "Kecanduan : Game online dirancang untuk menarik perhatian dan mempertahankan pemain, sehingga dapat menyebabkan kecanduan yang serius. Kecanduan game dapat mengganggu kehidupan sehari-hari, termasuk hubungan sosial dan kesehatan fisik.  " | lolcat -as 100
            echo "Gangguan Kesehatan : Kecanduan game dapat menyebabkan gangguan tidur, kaku leher dan otot, hingga Karpal Turner Syndrome." | lolcat -as 100
            echo "Menurunkan Prestasi Akademi : Kecanduan game dapat membuat anak kurang fokus di sekolah kampus dan pekerjaan. " | lolcat -as 100
            echo "Menarik Diri Dari Kehidupan Sosial : Anak yang kecanduan game cenderung menghabiskan banyak waktu bermain, mengabaikan interaksi sosial nyata." | lolcat -as 100
            echo "Berperilaku Agresif : Konten kekerasan dalam video game dapat membuat anak menjadi tidak sabar dan agresif.  " | lolcat -as 100
            echo "Masalah Otot Dan Persendian : Terlalu lama duduk apalagi dengan posisi kepala menunduk rentan menimbulkan otot kaku, nyeri sendi, serta gangguan kesehatan lainnya.   " | lolcat -as 100
            echo "Penurunan Penglihatan : Paparan cahaya biru dari layar gadget dapat menyebabkan penurunan penglihatan yang signifikan.   " | lolcat -as 100
            echo "Kebiasaan menghabiskan waktu bermain game bisa membuat Si Kecil mengalami kecanduan yang ditandai dengan merasa gelisah dan mudah marah apabila tidak diijinkan bermain, susah berhenti main game, tidak peduli dengan orang sekitar, hingga muncul gejala penyakit, seperti migraine atau mata lelah. " | lolcat -as 100
            echo "Saran Dari Saya Selaku Development Jangan Terlalu Sering Main Game Terlalu Malem Bisa Menghambat Kalian Di saat Beraktivitas Main Boleh Asal Di Waktu Ya Guys 😊😊  " | lolcat -as 100
            read -p "Press [ENTER] to continue: "
            ;;
        37) # Termux Comunity Source
            echo "Termux Comunity Source" | lolcat -s 10000
            echo "https://whatsapp.com/channel/0029VajtSTTLikgJKxcDa01v" | lolcat
            echo "cerita ini masih menunggu update terbaru yang akan siap di buat oleh saya" | lolcat -as 100
            echo "Ongoing" | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
        38) # Hak Cipta
            clear
            echo "Hak Cipta Si Pembuat Dwi Bakti N Dev" | lolcat -s 10000
            echo "Beberapa pasal yang mengatur tentang pelanggaran hak cipta di Indonesia, yaitu : " | lolcat -s 9987
            echo "Pasal 72 ayat (1) UU Hak Cipta, mengatur tentang pidana penjara minimal satu bulan dan/atau denda minimal Rp1.000.000 bagi pelaku yang tanpa hak mengumumkan atau memperbanyak suatu ciptaan " | lolcat -as 100
            echo "Pasal 112 UU Hak Cipta, mengatur tentang hukuman penjara maksimal dua tahun dan/atau denda maksimal Rp300.000.000 bagi pelaku yang tanpa hak melakukan perbuatan seperti yang dijelaskan dalam pasal 7 ayat 3 dan pasal 52 untuk penggunaan komersial " | lolcat -as 100
            echo "Pasal 114 UU Hak Cipta, mengatur tentang denda maksimal Rp100.000.000 bagi pelaku yang sengaja mengetahui dan membiarkan penjualan dan/atau penggandaan barang hasil pelanggaran hak cipta di tempat perdagangan yang dikelolanya " | lolcat -as 100
            echo " Dilindungi Hak Cipta Jika kalian melanggar terima sendiri akibatnya 🤠🤠" | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
        39) # Exit
            mkdir -p $HOME/.termux/
            echo "extra-keys = [['ESC','/','-','HOME','UP','END'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT']]" >> $HOME/.termux/termux.properties 
            termux-reload-settings
            echo "Please restart Termux for keyboard changes to take effect" | lolcat
            echo "Goodbye!" | lolcat
            exit 0
            ;;
        *)
            echo "Invalid Choice!" | lolcat
            read -p "Press [ENTER] to continue: "
            ;;
    esac
done