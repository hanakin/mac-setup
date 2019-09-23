#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Transmission.app Settings"
###############################################################################

#running "Use `~/Documents/Torrents` to store incomplete downloads"
#defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
#defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

#running "Don’t prompt for confirmation before downloading"
#defaults write org.m0k.transmission DownloadAsk -bool false

running "Enabling Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true;ok

running "Hideing the donate message"
defaults write org.m0k.transmission WarningDonate -bool false;ok

running "Hideing the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false;ok
