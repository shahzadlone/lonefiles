=============================================================
Pacman and yay (AUR) packages...

PACKAGE_DIR=$(printf "${HOME}/.script/packages");
PACMAN=$(printf "${PACKAGE_DIR}/pacman.txt");
AUR=$(printf "${PACKAGE_DIR}/yay.txt");

sudo pacman -S --noconfirm - < "${PACMAN}"
yay -S --no-confirm - < "${YAY}"


=============================================================
Install Grub Theme:
git clone https://github.com/Teraskull/bigsur-grub2-theme
cd bigsur-grub2-theme && ./install.sh


=============================================================
configure snaps:

Pi snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
snap install --devmode --beta anbox


=============================================================
NEOVIM/VIM PROVIDER SUPPORT:

" Add python support to neo-vim: (make sure python2 python3 and their pip's are installed)
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

" Node.js support,
sudo npm install -g neovim

" Ruby Gem support support:
gem install neovim
