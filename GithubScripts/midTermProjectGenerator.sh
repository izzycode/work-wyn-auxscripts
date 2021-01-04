#!/bin/bash

# install VSCode's Web Template Studio: https://github.com/microsoft/WebTemplateStudio/blob/dev/docs/install.md
# in VSCode run: Cmd + Shift + p
# then type: Web Template Studio: Launch
# name the project
# select front and back end
# select blank page
# skip cloud services
# create project
# in project folder git init; git add .; git commit -m "first commit"; git remote add origin https://github.com/izzycode/midTermRepo.git ; git push -u origin master


# Add library to edit package.json
yarn global add npm-package-bin

# Add current versions of all needed librarires
yarn add --dev pre-commit concurrently nodemon
yarn add body-parser bootstrap classnames cookie-parser debug express morgan react react-dom react-router-dom react-scripts


npm-bin add foo foobar.js -o package.json
