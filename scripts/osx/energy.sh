#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing the Energy Saving (Laptop)"
###############################################################################

running "Enabling lid wakeup"
sudo pmset -a lidwake 1;ok

running "Enabling Restart automatically on power loss"
sudo pmset -a autorestart 1;ok

running "Setting Sleep the display after 15 minutes"
sudo pmset -a displaysleep 15;ok

running "Disabling machine sleep while charging"
sudo pmset -c sleep 0;ok

running "Setting machine sleep to 5 minutes on battery"
sudo pmset -b sleep 5;ok
