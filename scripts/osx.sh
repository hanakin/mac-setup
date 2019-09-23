#!/usr/bin/env bash


source ./scripts/lib.sh

bot "First lets setup the downloads folder to sync with iCloud."

sudo rm -r ~/Downloads;ok
sudo ln -s

bot "Now lets change some settings in  OSX."

./scripts/osx/activitymonitor.sh
./scripts/osx/addressbook.sh
./scripts/osx/appstore.sh
./scripts/osx/bluetooth.sh
./scripts/osx/chrome.sh
./scripts/osx/dashboard.sh
./scripts/osx/diskutility.sh
./scripts/osx/dock.sh
./scripts/osx/finder.sh
./scripts/osx/ical.sh
./scripts/osx/input.sh
./scripts/osx/iterm.sh
./scripts/osx/itunes.sh
./scripts/osx/keyboard.sh
./scripts/osx/mail.sh
./scripts/osx/messages.sh
./scripts/osx/mouse.sh
./scripts/osx/safari.sh
./scripts/osx/screen.sh
./scripts/osx/sizeup.sh
./scripts/osx/spotlight.sh
./scripts/osx/ssd.sh
./scripts/osx/textedit.sh
./scripts/osx/timemachine.sh
./scripts/osx/trackpad.sh
./scripts/osx/transmission.sh
./scripts/osx/useability.sh

###############################################################################
# Clean Up
###############################################################################

bot "Ok just let me clean up and restart some processes."
bot "Some of these changes will require a logout/restart to take effect so do not be alarmed."

for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
    "Dock" "Finder" "Mail" "Messages" "Safari" "SizeUp" "SystemUIServer" \
    "iCal" "Terminal"; do
    killall "${app}" > /dev/null 2>&1
done
