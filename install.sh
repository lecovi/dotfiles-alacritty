#!/usr/bin/env fish

# TERMINAL COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'
set BOLD_YELLOW '\e[1;33m'
set BOLD_BLUE '\e[1;34m'

set -l _ALACRITTY_CONFIG_PATH ~/.config/alacritty
set -l _ALACRITTY_CONFIG_FILE ~/.config/alacritty/alacritty.yml
set -l _FONTS_PATH ~/.fonts

# Create ~/.alacritty folder
if not test -d $_ALACRITTY_CONFIG_PATH
    echo -e $BOLD_GREEN"Creating $_ALACRITTY_CONFIG_PATH folder..."$RESET
    mkdir -p $_ALACRITTY_CONFIG_PATH
else
    echo -e $BOLD_RED"$_ALACRITTY_CONFIG_PATH folder already exists."$RESET
end

# Link alacritty.yml to ~/.alacritty/alacritty.yml
if not test -f $_ALACRITTY_CONFIG_FILE
    echo -e $BOLD_GREEN"Linking _ALACRITTY_CONFIG_FILE..."$RESET
    ln -s (pwd)/config/alacritty.yml $_ALACRITTY_CONFIG_FILE
else
    echo -e $BOLD_RED"$_ALACRITTY_CONFIG_FILE already exists."$RESET
end

# Create ~/.fonts folder
if not test -d $_FONTS_PATH
    echo -e $BOLD_GREEN"Creating $_FONTS_PATH folder..."$RESET
    mkdir -p $_FONTS_PATH
else
    echo -e $BOLD_RED"$_FONTS_PATH folder already exists."$RESET
end

# Copy fonts to ~/.fonts
switch (uname)
    case Linux
        echo -e $BOLD_BLUE"Linux detected..."$RESET
        echo -e $BOLD_GREEN"Copying fonts to ~/.fonts..."$RESET
        cp -r fonts/* ~/.fonts/
    case Darwin
            echo -e $BOLD_BLUE"MacOS detected..."$RESET
            echo -e $BOLD_GREEN"Copying fonts to ~/.fonts..."$RESET
            cp -r fonts/* ~/Library/Fonts/
    case FreeBSD NetBSD DragonFly
            echo -e $BOLD_RED"FreeBSD, NetBSD and DragonFly not supported!"$RESET
    case '*'
            echo -e $BOLD_YELLOW"Unknown OS, please copy fonts manually."$RESET
end