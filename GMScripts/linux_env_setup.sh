sudo apt-get install curl

#!/bin/bash

if [[ ${1:+present} ]]
then
    echo "Using $1 as the user for Git configuration file."
else
    echo "Please pass first name and last name as a single string as a first argument: 'Your Name'"
    kill -INT $$
fi

if [[ ${2:+present} ]]
    then
        echo "Using $2 as the email for Git configuration file."
    else
        echo "Please pass an email address as a second argument: 'me@somewhere.com'"
	kill -INT $$
fi

echo "Installing software..."

# install google chrome
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -y install -f

# install utils
sudo apt-get update
sudo apt install build-essential nodejs zlib1g-dev libsqlite3-dev libpq-dev libreadline-dev software-properties-common apt-transport-https wget snap

# install vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code

# heroku
sudo snap install --classic heroku

# git
sudo add-apt-repository -y ppa:git-core/ppa

sudo apt-get -y install software-properties-common \
    atom  \
    heroku \
    zlib1g-dev \
    postgresql \
    git \
    libsqlite3-dev \
    libpq-dev

# Install the node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

source  ~/.nvm/nvm.sh
nvm install lts/carbon

npm install -g yarn


# Create postgresql user.
sudo -u postgres createuser -dPs $(whoami)

git config --global user.name "$1"
git config --global user.email "$2"

# Use a heredoc.
# Create the .railsrc here.
cat > ~/.railsrc <<- EndOfMessage
--skip-coffee
EndOfMessage

# Create a .gemrc file.
cat > ~/.gemrc <<- EndOfMessage
gem: --no-document
:backtrace: true
EndOfMessage

# install rvm
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
sudo apt-add-repository -y ppa:brightbox/ruby-ng
xdg-open https://github.com/rvm/ubuntu_rvm#user-content-2-change-your-terminal-window

echo "Now follow the instructions on the web page that opened and after you restart your computer run this: \nrvm install ruby --latest; gem install rails -N; gem install rspec -N; curl -L http://bit.ly/2GSm4HF > ~/Desktop/rspec_test.rb; rspec ~/Desktop/rspec_test.rb; rm rspec ~/Desktop/rspec_test.rb "

# rails
sudo gem install rails -N
sudo gem install rspec -N

cd ~/Desktop
curl -L http://bit.ly/2GSm4HF > ~/Desktop/rspec_test.rb
rspec rspec_test.rb