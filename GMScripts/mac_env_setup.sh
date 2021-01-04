#!/bin/bash

# open crome in postgress page to download postgressapp
CHROMEPATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -x "$CHROMEPATH" ]
then
  echo "\e[97m\e[44mChrome will open a page now.\e[49m\n\e[41mPlease go ahead and install the PostgressApp from that page.\e[39m\e[49m"
  sleep 3
  "$CHROMEPATH" "https://postgresapp.com/downloads.html"
else
  draw_line
  echo "Please install the Chrome web browser first and then run this script again."
  draw_line
  return
fi

# config
# add progress bar when curl-ing
echo progress-bar >> ~/.curlrc

# Install xcode
xcode-select —-install

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install rvm (sorry Don, couldn't figure the other one out :P)
brew install gpg
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash
source /Users/$USER/.rvm/scripts/rvm
rvm reload
# install latest Ruby
rvm install ruby --latest

# install the executables with homebrew
brew update
brew tap caskroom/cask
brew cask install visual-studio-code
brew install git
brew tap heroku/brew && brew install heroku
brew install postgresql
brew install node
brew install yarn

# install required gems
gem install rails -N
gem install rspec -N

# configure git's user information
git config --global user.name "$1"
git config --global user.email "$2"

# create folders and files
cd ~/Desktop
mkdir -p HTML/exercises CSS/exercises CommandLine/exercises JavaScript Ruby/exercises RoR/exercises React/exercises MidTermProject FinalProject
cd JavaScript
touch datatypes.js strings.js numbers.js booleans.js controlFlow.js loops.js arrays.js objects.js exercises.js
cd

# verify environment setup
curl -L http://bit.ly/2m1HZ8I > ~/Desktop/verify_env.rb && rspec ~/Desktop/verify_env.rb
rm ~/Desktop/verify_env.rb

# Install oh-my-zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh