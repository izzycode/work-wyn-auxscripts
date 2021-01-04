#!/bin/sh

# Text color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgreen=${txtbld}$(tput setaf 2) #  green
bldblu=${txtbld}$(tput setaf 4) #  blue
rvrs=${txtbld}$(tput rev)       #  reverse
txtrst=$(tput sgr0)             # Reset
linefeed=$(tput cud1)           # line feed

lsregister_grep ()
{
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/\lsregister -dump | grep -i "$1"
}

varErrors=0
clear

# GRAB GIT USER NAME FOR GREETING
varGitName=`git config user.name`
if [ `echo ${#varGitName}` == 0 ]; then
  echo $bldred "You havent configured your identity in 'git'. Please go back to the 'Install The Latest Git' step and follow all the instructions."
else
  echo $rvrs Hello $varGitName $txtrst
fi
echo
echo $txtund$bldblu Test Results $txtrst
echo

# VERIFY CHROME
varChrome=`lsregister_grep "Google Chrome/Google Chrome.app"`
if [ `echo ${varChrome: -10:10}` == "Chrome.app" ]; then
  echo $bldgreen "Chrome is installed."
else
  echo $bldred "Chrome not found."
  varErrors=$((varErrors+1))
fi

# VERIFY ATOM APP
varAtomCLI=`lsregister_grep "/Atom.app"`
if [ ${varAtomCLI: -9:9} == "/Atom.app" ]; then
  echo $bldgreen "Atom is installed."
else
  echo $bldred "Atom in not installed."
  varErrors=$((varErrors+1))
fi

# VERIFY ATOM CLI
varAtomCLI=`which atom`
if [ ${varAtomCLI: -4:4} == "atom" ]; then
  echo $bldgreen "Atom command line tools are installed."
else
  echo $bldred "Your text editor is not configured to be launched from your Command Line.Open Atom, and select Atom > Install Shell Commands."
  varErrors=$((varErrors+1))
fi

# VERIFY HOMEBREW
varBrew=`which brew`
if [ ${varBrew: -4:4} == "brew" ]; then
  echo $bldgreen "Homebrew is installed."
else
  echo $bldred "Homebrew not found."
  varErrors=$((varErrors+1))
fi

# VERIFY NODE
varNode=`which node`
if [ ${varNode: -4:4} == "node" ]; then
  echo $bldgreen "Node is installed."
else
  echo $bldred "Node not found."
  varErrors=$((varErrors+1))
fi

# VERIFY NPM
varNPM=`which npm`
if [ ${varNPM: -3:3} == "npm" ]; then
  echo $bldgreen "npm is installed."
else
  echo $bldred "npm not found."
  varErrors=$((varErrors+1))
fi

# VERIFY yarn
varYarn=`which yarn`
if [ ${varYarn: -4:4} == "yarn" ]; then
  echo $bldgreen "Yarn is installed."
else
  echo $bldred "Yarn not found."
  varErrors=$((varErrors+1))
fi

# VERIFY NETLIFY
varNetlify=`which netlify`
if [ ${varNetlify: -7:7} == "netlify" ]; then
  echo $bldgreen "Netlify is installed."
else
  echo $bldred "Netlify not found."
  varErrors=$((varErrors+1))
fi

echo $testResults

if [ $varErrors -gt 0 ]; then
  echo "Please return go back to the Environment Setup instructions and correct the $varErrors mentioned errors"
else
  echo "You're all set! Let's do some coding!! 🚀"
fi
