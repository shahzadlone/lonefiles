configure snaps:

Pi snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
snap install --devmode --beta anbox


