#!/bin/bash

# Install homebrew
if ! which brew &> /dev/null
then
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

# Make sure we’re using the latest Homebrew
brew update

#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

brew doctor || exit 1

brew install git
brew install imagemagick
brew install chromedriver
brew install jsdoc-toolkit
brew install selenium-server-standalone
brew install node
brew install postgresql

# postgres
# create db
# initdb /usr/local/var/postgres -E utf8

# Prepare brew for multi-users setup
if ! sudo dscl . read /Groups/brew &> /dev/null
then
	echo "Now let's make brew useful for all users."
	echo "Create a 'brew' group"
	sudo dscl . create /Groups/brew
	sudo dscl . create /Groups/brew RealName "Homebrew group"
	sudo dscl . create /Groups/brew gid 400
	sudo dscl . create /Groups/brew GroupMembership `whoami`
fi

echo -n "Change the group of homebrew cache directory…"
sudo chgrp -R brew /Library/Caches/Homebrew
echo "done"

echo -n "Allow group members to write inside this directory…"
sudo chmod -R g+w /Library/Caches/Homebrew
echo "done"
