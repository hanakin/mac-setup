#!/usr/bin/env bash


source ./scripts/lib.sh

###############################################################################
bot "Configureing SSD Specific Settings"
###############################################################################

running "Disabling local Time Machine snapshots"
sudo tmutil disablelocal;ok

running "Disabling hibernation (speeds up entering sleep mode)"
sudo pmset -a hibernatemode 0;ok

running "Removing the sleep image file to save disk space"
sudo rm -rf /Private/var/vm/sleepimage;ok

running "Creating a zero-byte file instead…and make sure it can’t be rewritten"
sudo touch /Private/var/vm/sleepimage
sudo chflags uchg /Private/var/vm/sleepimage;ok

running "Disabling the sudden motion sensor as it’s not useful for SSDs"
sudo pmset -a sms 0;ok
