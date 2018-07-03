#!/bin/bash

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

# Install python (comes with Setuptools and pip)
brew install python 

#install ruby
brew install ruby

# Install Homebrew-cask. A CLI workflow for the adminisration of Mac applications distributed as binaries http://caskroom.io
echo Tapping caskroom/cask...
brew install brew-cask-completion
