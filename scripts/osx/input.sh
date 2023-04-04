#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Input Settings"
###############################################################################

running "Setting language and text formats (english/US)"
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_US@currency=USD"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Inches"
defaults write NSGlobalDomain AppleMetricUnits -bool false;ok

running "Setting the timezone; see 'sudo systemsetup -listtimezones' for other values"
sudo systemsetup -settimezone "Eastern" > /dev/null;ok

running "Show language menu in the top right corner of the boot screen"
sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true;ok
