#! /bin/bash
sudo rm -rf /etc/calamares/branding/default
git clone https://github.com/SantiagoCalligari/aa
cd aa
sudo mv branding/default /etc/calamares/branding/default
sudo rm -rf /etc/skel/a.sh /etc/skel/.config/autostart
sudo rm -rf ~/a.sh ~/.config/autostart
