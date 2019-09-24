#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing SSD Specific Settings"
###############################################################################

running "Disabling local Time Machine snapshots"
sudo tmutil disablelocal;ok

running "Disabling hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0;ok

running "Removing the sleep image file to save disk space."
sudo rm /private/var/vm/sleepimage

running "Creating a zero-byte file instead…"
sudo touch /private/var/vm/sleepimage

running "Lets it can’t be rewritte."
sudo chflags uchg /private/var/vm/sleepimage;ok

running "Disabling the sudden motion sensor as it’s not useful for SSDs"
sudo pmset -a sms 0;ok
