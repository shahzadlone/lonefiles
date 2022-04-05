=============================================================
Pacman and yay (AUR) packages...

PACKAGE_DIR=$(printf "${HOME}/.scripts/packages");
PACMAN=$(printf "${PACKAGE_DIR}/pacman.txt");
AUR=$(printf "${PACKAGE_DIR}/yay.txt");

sudo pacman -S --noconfirm - < "${PACMAN}"
yay -S --no-confirm - < "${YAY}"

=============================================================

ACCTUALLY IGNORE THIS BLOCK UNTIL FIGURE OUT WSL2 actually needs this or not.
// Add the wsl utilities repository to pacman config file.
// Follow here: https://wslutiliti.es/wslu/install.html

wget https://pkg.wslutiliti.es/public.key
pacman-key --add public.key
pacman-key --lsign-key A2861ABFD897DD37

// Add to `/etc/pacman.conf` file the following:
[wslutilities]
Server = https://pkg.wslutiliti.es/arch/

// Then do this:
pacman -Sy && pacman -S wslu


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
# NEOVIM/VIM PROVIDER SUPPORT:

Please be aware of python pip issues.
If you use sudo to install packages using pip you may get issues later on when installing packages using pacman.
The issue is pacman keeps track of installed files and if a conflict is detected you will get an error using pacman.
Manjaro installs a file ~/etc/pip.conf which instructs pip to install into the users local bin folder ~/.local/bin but this configuration does not work well with python virtual environments.
Which can be changed to false in case of problems using virtual environments - in case of virtual environments - activate the virtual environment and use standard pip install package
The default pip.conf file content, `cat /etc/pip.conf`:
```
[global]
user = true
```

### Install Python2 Pip
sudo apt-get install python-pip
sudo pacman -S python2-pip # Deprecated

### Install Python3 Pip
sudo apt-get install python3-pip
sudo pacman -S python-pip

" Add python support to neo-vim: (make sure python2 python3 and their pip's are installed)
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

" sometime later had to do this:
pip install --user neovim 
pip3 install neovim

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

" Mount my internal shared hard drive permanently:
" https://archived.forum.manjaro.org/t/wiki-howto-permanent-mount-for-partition/26187

" NOTE (lsblk -f):
"    `$ lsblk -f`
"    NAME        FSTYPE   FSVER LABEL   UUID              FSAVAIL FSUSE% MOUNTPOINTS
"    ....        ......   ..... .....   ....
"    ....        ......   ..... .....   ....
"    ....        ......   ..... .....   ....
"    sda
"    ├─sda1
"    └─sda2      ntfs           Shared  026E402F6E401E33  1.4T     21%  /run/media/bluesushi/Shared

" As `user` did this:
>>    sudo mkdir /media
>>    sudo chown ${USER} /media
>>    mkdir /media/Shared

" Then did this and got the following first error:
" >>    $ sudo mount /dev/sda2 /media/Shared/
" Mount is denied because the NTFS volume is already exclusively opened.
" The volume may be already mounted, or another software may use it which
" could be identified for example by the help of the 'fuser' command.

" Then to resolve it I tried to unmount and re-try like this:
" >>    $ sudo umount /dev/sda2
" >>    $ sudo mount /dev/sda2 /media/Shared/

" But now got another error that said that disk isn't clean:
" The disk contains an unclean file system (0, 0).
" Metadata kept in Windows cache, refused to mount.
" Falling back to read-only mount because the NTFS partition is in an unsafe state. Please resume and shutdown Windows fully (no hibernation

" Fix, So the solution I found was to do these steps:
"  1) unmount.
"  2) do an ntfs fix of the disk.
"  3) then mount to the created media point we created.
" So, these commands worked:
>>    sudo umount /dev/sda2
>>    sudo ntfsfix /dev/sda2
>>    sudo mount /dev/sda2 /media/Shared/

" We still need to add the entry to `/etc/fstab` to make it permanent.
>>    su -
>>    echo "UUID=$(lsblk -no UUID /dev/sda2) /media/Shared $(lsblk -no FSTYPE /dev/sda2) defaults,noatime 0 2" >> /etc/fstab
