#!/bin/bash -e
user=$(whoami)

fl=$(find /proc -maxdepth 2 -user "$user" -name environ -print -quit)
for i in {1..5}
do
  fl=$(find /proc -maxdepth 2 -user "$user" -name environ -newer "$fl" -print -quit)
done

export DBUS_SESSION_BUS_ADDRESS
DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS "$fl" | cut -d= -f2-)

IMG="file://$1"
if [ "$(gsettings get org.gnome.desktop.background picture-uri)" != "$FILE" ]; then
    # dconf write "/org/gnome/desktop/background/picture-uri" "'file://${IMG}'"
    gsettings set org.gnome.desktop.background picture-uri "'$IMG'"
fi

# set crontab as:
# */<interval> <hours-of-day> * * * * /path/to/change-wallpaper.sh 'path/to/wallpaper.png'
