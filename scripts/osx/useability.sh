#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing Useability Settings"
###############################################################################

#running "Setting computer name (as done via System Preferences → Sharing)"
#sudo scutil --set ComputerName $netname
#sudo scutil --set HostName $netname
#sudo scutil --set LocalHostName $netname
#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $netname

running "Setting standby delay to 24 hours (default is 1 hour)"
sudo pmset -a standbydelay 86400;ok

# running "Disabling the sound effects on boot"
# sudo nvram SystemAudioVolume=" ";ok

running "Disabeling transparency in the menu bar and elsewhere"
defaults write com.apple.universalaccess reduceTransparency -bool true;ok

running "Hideing the Time Machine, Volume, User, Airport icons in the menubar"
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
        "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
        "/System/Library/CoreServices/Menu Extras/Volume.menu" \
        "/System/Library/CoreServices/Menu Extras/User.menu"
done;
defaults write com.apple.systemuiserver menuExtras -array \
    #"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu"
    #"/System/Library/CoreServices/Menu Extras/Battery.menu" \
    #"/System/Library/CoreServices/Menu Extras/Clock.menu"
ok

#running "Set highlight color to green"
#defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600";ok

running "Setting sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2;ok

running "Setting scrollbars to always be visible"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always";ok
# Possible values: `WhenScrolling`, `Automatic` and `Always`

running "Increaseing the window resize speed"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001;ok

running "Setting save panel to be expanded by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true;ok

running "Setting print panel to be expanded by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true;ok

running "Setting things to save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false;ok

running "Setting it up so that we automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true;ok

running "Disabling the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false;ok

running "Removeing duplicates in the “Open With” menu (also see 'lscleanup' alias)"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user;ok

running "Displaying ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true;ok

# running "Disabling automatic termination of inactive apps"
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true;ok
#
# running "Disabling the crash reporter"
# defaults write com.apple.CrashReporter DialogType -string "none";ok

running "Setting Help Viewer windows to non-floating mode"
defaults write com.apple.helpviewer DevMode -bool true;ok

running "Setting it to Reveal IP, hostname, OS, etc. when clicking clock in login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName;ok

running "Setting it to restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on;ok

running "Disabling sleep mode"
sudo systemsetup -setcomputersleep Off > /dev/null;ok

running "Changing it to Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1;ok

#running "Disable Notification Center and remove the menu bar icon"
#launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist > /dev/null 2>&1;ok

running "Disabling smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false;ok

running "Disabling smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false;ok
