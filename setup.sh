#!/bin/bash
# Download files for setup from github repo
SETUP_FILES_REMOTE='https://github.com/Masakore/macbook_setup.git' 
SETUP_FILES_LOCAL=~/dev
mkdir ~/dev

git clone $SETUP_FILES_REMOTE $SETUP_FILES_LOCAL 
chmod +x $SETUP_FILES_LOCAL/setup.sh
$SETUP_FILES_LOCAL/setup.sh

# Install Homebrew. ts required to install tools such as git and wget.
# Mac OS 10.9 will automatically prompt user to install XCode command line tools which is a pre-requisite.
which brew 
RETSTATUS=$?
if [ $RETSTATUS -ne 0 ]
then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#Homebrew will show warning message if already installed.  
# Install NVM (Node Version Manager)
brew install nvm

# Install Vim
brew install vim

# Install current related things here
# Install SDKMAN
curl -s get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install groovy
sdk install grails
sdk install gradle
brew cask install sequel-pro

# Install python (comes with Setuptools and pip)
brew install python 

#install ruby
brew install ruby

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
echo Tapping caskroom/cask...
brew tap caskroom/cask
brew install brew-cask 

chmod +x $SETUP_FILES_LOCAL/after_setup_done_install_apps.sh
$SETUP_FILES_LOCAL/after_setup_done_install_apps.sh
