#!/usr/bin/env bash

# Colors
ESC_SEQ="\x1b["
RESET=$ESC_SEQ"39;49;00m"
L_RED=$ESC_SEQ"31;01m"
L_GREEN=$ESC_SEQ"32;01m"
L_YELLOW=$ESC_SEQ"33;01m"
L_BLUE=$ESC_SEQ"34;01m"
L_MAGENTA=$ESC_SEQ"35;01m"
L_CYAN=$ESC_SEQ"36;01m"

function ask() {
    read -r -p "$(echo -e $L_MAGENTA  ⇒  $RESET$L_CYAN"$1 "$RESET)" $2
}

function ok() {
    echo -e "$L_GREEN[ok]$RESET "$1
}

function bot() {
    echo -e "\n$L_BLUE\[._.]/$RESET - "$1
}

function running() {
    echo -en "$L_CYAN  ⇒  $RESET"$1": "
}

function action() {
    echo -e "\n$L_MAGENTA[action]:$RESET\n $L_MAGENTA ⇒ $RESET $1..."
}

function warn() {
    echo -e "$L_YELLOW[warning]$RESET "$1
}

function error() {
    echo -e "$L_RED[error]$RESET "$1
}

function make_ssh {
    action "Making ssh... "
    if [[ ! -e ~/.ssh/id_rsa ]]; then
        action "Creating an ssh key for you. When promted where to save it just hit 'enter' for the defaults. Also when asked for a passphrase do not enter anything just hit 'enter' twice this time."
        ssh-keygen -t rsa -C $email
    else
        bot "Oh it appears you already have an ssh key, excelent that will speed things along."
        if [[ ! -e ~/.ssh/id_rsa ]]; then
            mkdir ~/.ssh
        fi
    fi
    ok
}

function symlinkifne {
    running "$1"

    if [[ -e ~/$1 ]]; then
        # file exists
        if [[ -L ~/$1 ]]; then
            # it's already a simlink (could have come from this project)
            rm ~/$1
        else
            # Backup original file
            mv ~/$1 ~/.dotfiles_backup/
        fi
    fi
    # create the link
    sudo ln -s ./.dots/$1
    echo -en 'linked ';ok
}

function require_brew() {
    running "brew $1 $2"
    brew list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        brew install $1 $2
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            exit -1
        fi
    fi
    ok
}

function require_asdf() {
    running "asdf $1 $2"
    if ! $2; then
        $2 == 'latest'
    fi
    asdf plugin-add $1
    asdf install $1 $2
    asdf global $1 $2
}

function require_cask() {
    running "brew cask $1"
    # brew cask ls $1 > /dev/null 2>&1 | true
    # if [[ ${PIPESTATUS[0]} != 0 ]]; then
        brew install --cask --appdir="/Applications" $1
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            # exit -1
        fi
    # fi
    ok
}

function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]];
        then
            gem install $1
    fi
    ok
}

function require_npm() {
    running "npm $1"
    echo $npmlist | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        npm install -g $1
    fi
    ok
}

function require_apm() {
    running "atom $1"
    echo $npmlist | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        apm install $1
    fi
}
