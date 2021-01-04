#!/bin/bash
# load zhell
zsh

function draw_line { printf %"$COLUMNS"s |tr " " "-" }

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

# Install oh-my-zshell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh  --unattended)"

source ~/.zhrc

# Install gpg
if [ "which gpg" =~ [\/usr\/local\/bin\/gpg\n] ]
then
  draw_line
  echo gpg is installed
else
  brew install gpg
fi

# install the executables with homebrew
brew update
brew tap caskroom/cask
brew install visual-studio-code
brew install git
brew tap heroku/brew && brew install heroku
brew install postgresql
brew install node
brew install yarn

name="$1"
email="$2"
git config --global user.name "$name"
git config --global user.email "$email"

# create folders and files
cd ~/Desktop
mkdir -p HTML/exercises CSS/exercises CommandLine/exercises JavaScript Ruby/exercises RoR/exercises React/exercises MidTermProject FinalProject
cd JavaScript
touch datatypes.js strings.js numbers.js booleans.js controlFlow.js loops.js arrays.js objects.js exercises.js

# verify environment setup
curl -L http://bit.ly/wyn-env-test > ~/Desktop/verify_env.sh && sh ~/Desktop/verify_env.sh && rm ~/Desktop/verify_env.sh

# `bash <(curl -sL https://gist.githubusercontent.com/izzycode/f2eda27eb3a973e53ad543736a89dd0a/raw/d39bef02d489a8f13f864d211578ee96c73e095b/ptEnvSetupMac.sh) 'first_name last_name' email@nowwhere.com`
