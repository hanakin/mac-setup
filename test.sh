#!/bin/zsh
# include my library helpers for colorized echo and require_brew, etc
source ./scripts/lib.sh

###############################################################################
# Gather info
###############################################################################

bot "testing bot function should be blue"

ask "What is your first name? " firstname

bot "Hi $firstname, Its nice to meet you."

running "testing running function should be cyan"

ok "testing ok funciton should be green"

warn "testing warn funciton should be yellow"

error "testing error funciton should be red"
