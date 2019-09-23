#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing SizeUp.app Settings"
###############################################################################

running "Enabling Starting SizeUp at login"
defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true;ok

running "Disabling showing of preferences window on next start"
defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false;ok
