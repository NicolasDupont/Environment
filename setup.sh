#!/bin/bash

source="$(pwd)"

SETUP_DIR=$source/setup
DOTFILES_DIR=$source/dotfiles
BASH_DIR=$source/bash
FONTS_DIR=$source/Fonts

function linkDotfiles() {
	for file in $(ls $DOTFILES_DIR); do
		ln -si "$DOTFILES_DIR/$file" $HOME/.$file && echo "Linked $DOTFILES_DIR/$file"
	done
}

function installFonts() {
	for font in $(ls $FONTS_DIR); do
		cp -n "$FONTS_DIR/$font" "/Library/Fonts/$font" && echo "$font installed"
	done
}

linkDotfiles
installFonts
