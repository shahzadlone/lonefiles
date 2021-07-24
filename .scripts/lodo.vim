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

" Start systelctl / daemons
teamviewer --daemon start
systemctl enable docker

" Fix colours on libreoffice (https://www.reddit.com/r/archlinux/comments/4vh8zg/how_do_i_make_libreoffice_look_better_on_kde_on/)
- Install libreoffice-breeze-icons from AUR
- Set it in LibreOffice > Tools > Options > View > Icon style > Breeze_dark.
- Install breeze-gtk from official repos.
- Set System Settings > Application Style > Gnome Application Style > Select a GTK3 Theme > Breeze-Dark.
- Set the environment variable SAL_USE_VCLPLUGIN=gtk3, for example, by putting it in ~/.pam_environment.

" Fix dolphin (call the command by):
XDG_CURRENT_DESKTOP=KDE KDE_SESSION_VERSION=5 QT_AUTO_SCREEN_SCALE_FACTOR=0 QT_QPA_PLATFORMTHEME="qt5ct" dolphin %u

" Remap keys:
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"   #this will make Esc to act as Caps Lock
xmodmap -e "keycode 66 = Escape NoSymbol Escape"        #this will make Caps Lock to act as Esc

" To get this change for every session, after you have run the ​​previous commands create a file called .xmodmap with the new keymaps, using the following command:
xmodmap -pke > ~/.xmodmap

" Then, create a file called .xinitrc in your home directory, containing the following line/command:
usermodmap=$HOME/.Xmodmap
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi
