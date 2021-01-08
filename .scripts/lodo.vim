configure snaps:

Pi snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
snap install --devmode --beta anbox

" Add python support to neo-vim: (make sure python2 python3 and their pip's are installed)
python2 -m pip install --user --upgrade pynvim
python3 -m pip install --user --upgrade pynvim

" Node.js support,
sudo npm install -g neovim
