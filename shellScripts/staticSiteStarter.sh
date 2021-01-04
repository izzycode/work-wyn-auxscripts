#!/bin/bash

createStaticProject()
{
  FOLDER_NAME=$1
  echo "Creating Folder $FOLDER_NAME"
  mkdir $FOLDER_NAME
  echo "Creating static site template files"
  cd $FOLDER_NAME
  touch index.html styles.css scripts.js
  curl https://gist.githubusercontent.com/izzycode/c681f7b191bdfc122d50f2bac8b91d62/raw/e420aa11f64dc73714d623d7d51b8b9887aefd85/htmlBoilerplate.html > index.html
  echo ""
  echo "Happy coding"
  atom . || subl . || code .
}

if [ -n "$1" ]
then
  createStaticProject "$1"
else
  echo ""
  echo "You need to provide a folder name to execute this script."
fi
