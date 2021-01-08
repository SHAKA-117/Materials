#!/bin/bash
user=$(whoami)
echo $user
xfce4-terminal -e /home/$user/gcompris-qt-1.0-Linux/bin/./gcompris-qt.sh
