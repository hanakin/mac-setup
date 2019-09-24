#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Photos Settings"
###############################################################################

running "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true;ok
