#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Bluetooth Settings"
###############################################################################
running "Increasng sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40;ok
