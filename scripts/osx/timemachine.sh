#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Time Machine Settings"
###############################################################################

running "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true;ok

running "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal;ok
