#!/usr/bin/env bash


source ./scripts/lib.sh

bot "First lets setup the downloads folder to sync with iCloud."

sudo rm -r ~/Downloads;ok
sudo ln -s

bot "Now lets change some settings in  OSX."

source ./scripts/osx/activitymonitor.sh
source ./scripts/osx/addressbook.sh
source ./scripts/osx/appstore.sh
source ./scripts/osx/bluetooth.sh
source ./scripts/osx/chrome.sh
source ./scripts/osx/dashboard.sh
source ./scripts/osx/diskutility.sh
source ./scripts/osx/dock.sh
source ./scripts/osx/finder.sh
source ./scripts/osx/ical.sh
source ./scripts/osx/input.sh
source ./scripts/osx/iterm.sh
source ./scripts/osx/itunes.sh
source ./scripts/osx/keyboard.sh
source ./scripts/osx/mail.sh
source ./scripts/osx/messages.sh
source ./scripts/osx/mouse.sh
source ./scripts/osx/photos.sh
source ./scripts/osx/safari.sh
source ./scripts/osx/screen.sh
source ./scripts/osx/sizeup.sh
source ./scripts/osx/spotlight.sh
source ./scripts/osx/ssd.sh
source ./scripts/osx/textedit.sh
source ./scripts/osx/timemachine.sh
source ./scripts/osx/trackpad.sh
source ./scripts/osx/transmission.sh
source ./scripts/osx/energy.sh
source ./scripts/osx/useability.sh

###############################################################################
# Clean Up
###############################################################################

bot "Ok just let me clean up and restart some processes."
bot "Some of these changes will require a logout/restart to take effect so do not be alarmed."

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Mail" \
	"Messages" \
	"Opera" \
	"Photos" \
	"Safari" \
	"SizeUp" \
	"Spectacle" \
	"SystemUIServer" \
	"Terminal" \
	"Transmission" \
	"Tweetbot" \
	"Twitter" \
	"iCal"; do
    killall "${app}" > /dev/null 2>&1
done
