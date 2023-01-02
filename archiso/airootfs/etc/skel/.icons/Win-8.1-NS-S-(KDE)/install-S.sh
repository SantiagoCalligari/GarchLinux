#!/bin/bash
clear
printf '=%.0s' {1..70}
echo
echo Give root access to proceed.
printf '=%.0s' {1..70}
echo
echo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
clear
echo 
echo
while true;
do
function pause(){
read -s -n 1 -p "Press any key to continue.."
echo
}
clear
printf '=%.0s' {1..70}
echo
echo "'Win-8.1-S' X11 Cursor theme || Installer script created by xxmmtrtxx."
printf '=%.0s' {1..70}
echo
echo
echo "|Select Options|"
echo
printf '>%.0s' {1..35}
echo
echo "1) Check selected cursor"
echo "2) Check available cursor themes"
echo "3) Install Win-8.1-S cursor theme"
echo "4) Select cursor theme"
echo "5) Remove Win-8.1-S Cursor theme"
echo "6) Exit"
printf '<%.0s' {1..35}
echo
echo
echo "|Input Number|"
echo
read INPUT_NUMBER
case $INPUT_NUMBER in

1)
clear
printf '=%.0s' {1..70}
echo
echo "Currently selected X11 cursor theme"
printf '=%.0s' {1..70}
echo
echo
cp /usr/share/icons/default/index.theme "$(dirname ${BASH_SOURCE[0]})"
cat index.theme
rm index.theme
echo
pause “Press any key to continue…”
;;

2)
clear
printf '=%.0s' {1..70}
echo
echo "The following X11 cursor themes are installed"
printf '=%.0s' {1..70}
echo
echo
sudo update-alternatives --display x-cursor-theme
echo
echo
pause “Press any key to continue…”
;;

3)
clear
DIR="/usr/share/icons/Win-8.1-S"
  
if [ -d "$DIR" ]
then
clear
printf '=%.0s' {1..70}
echo
echo "Win-8.1-S X11 cursor theme is already installed"
printf '=%.0s' {1..70}
echo
echo
else
printf '=%.0s' {1..70}
echo
echo "Installing Win-8.1-S cursor theme"
printf '=%.0s' {1..70}
echo
sudo cp -rf Win-8.1-S/ /usr/share/icons/Win-8.1-S && sudo update-alternatives --install /usr/share/icons/default/index.theme x-cursor-theme /usr/share/icons/Win-8.1-S/cursor.theme 90
echo
echo "|Installed|"
echo
fi
pause “Press any key to continue…”
;;

4)
clear
echo "Select X11 cursor theme Number and from KDE Settings -> Workspace Theme
then click on Cursor Theme -> Win-8.1-S then click apply."
printf '=%.0s' {1..72}
echo
echo
sudo  update-alternatives --config x-cursor-theme
echo
echo
clear
printf '=%.0s' {1..72}
echo
echo "Note: First logout then run KDE Settings
goto Startup and Shutdown select the cursor theme
from Login Screen SDDM -> Advance and then again 
logout to fully use the cursor theme."
printf '=%.0s' {1..72}
echo
echo
echo "|Enjoy the theme|"
echo
pause “Press any key to continue…”
;;

5)
clear
DIR="/usr/share/icons/Win-8.1-S"
 if [ -d "$DIR" ]
then
clear
printf '=%.0s' {1..70}
echo
echo "Removing Win-8.1-S X11 cursor theme"
printf '=%.0s' {1..70}
echo
echo
sudo  rm -rf /usr/share/icons/Win-8.1-S
echo "|Removed|"
echo
else
printf '=%.0s' {1..70}
echo
echo "Win-8.1-S X11 cursor theme is not installed"
printf '=%.0s' {1..70}
echo
echo
fi
pause “Press any key to continue…”
;;

6)
clear
echo
echo Have a Good Day.
echo
sleep 1
break
;;

esac
done 
