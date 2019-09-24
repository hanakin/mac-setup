#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Transmission.app Settings"
###############################################################################

#running "Use `~/Documents/Torrents` to store incomplete downloads"
#defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
#defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

#running "Use `~/Downloads` to store completed downloads"
# defaults write org.m0k.transmission DownloadLocationConstant -bool true;ok

#running "Disabling prompt for confirmation before downloading"
# defaults write org.m0k.transmission DownloadAsk -bool false
# defaults write org.m0k.transmission MagnetOpenAsk -bool false;ok

#running "Don’t prompt for confirmation before downloading"
#defaults write org.m0k.transmission DownloadAsk -bool false

running "Enabling Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true;ok

running "Hideing the donate message"
defaults write org.m0k.transmission WarningDonate -bool false;ok

running "Hideing the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false;ok

# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
running "Setup IP block list."
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true;ok

running "Randomize port on launch"
defaults write org.m0k.transmission RandomPort -bool true;ok
