# Scripts
This repository contains various shell scripts to be run as needed to automate and execute various tasks needed for the cohorts.

## Shell Scripts
- [macOS environment setup full time]()
  <details>
    <summary>Description and Instructions</summary>
    <h3>Description</h3>
    <p>This file runs all the commands necessary to setup the development environment for the full time cohort in a mac computer.</p>
    <h3>Instructions</h3>
    In the terminal run:
    <code>
      curl the-url-to-the-raw-content-of-this-file > ~/Desktop/temp.sh </br>
      source ~/Desktop/temp.sh "FirstName LastName" mail@email.com </br>
      rm ~/Desktop/temp.sh
    </code>
  </details>
- [macOS environment setup part time]()
  <details>
    <summary>Description and Instructions</summary>
    <h3>Description</h3>
    <p>This file runs all the commands necessary to setup the development environment for the front end part time course in a mac computer.</p>
    <h3>Instructions</h3>
    In the terminal run:
    <code>
      curl the-url-to-the-raw-content-of-this-file > ~/Desktop/temp.sh </br>
      source ~/Desktop/temp.sh "FirstName LastName" mail@email.com </br>
      rm ~/Desktop/temp.sh
    </code>
  </details>

## GoodMeasure Auxiliary Functions
- New Cohort
  + Remove all homework except Week 0
    <details>
      <summary>Description and Instructions</summary>
      <h3>Description</h3>
      <p>When a new cohorts homework is imported, all of the tasks are imported. Since there may be edits to the contents of homework from the moment of cohort creation until it actually starts, this command will remove all of the courses/units/tasks that are not related to pre-work.</p>
      <h3>Instructions</h3>
      <p>In the terminal run:</p>
      <code>
        heroku run rails c -a goodmeasure
      </code>
      <p>Find the id for the cohort to be afected.</p>
      <p>When the dyno spins up execute the following:</p>
      ...
        add permalink here
      ...
  </details>

## Automating of tasks
- **React Midterm Project with Express Backend**
  <details>
    <summary>Description and Instructions</summary>
    <h3>Description</h3>
    <p>When a new cohorts homework is imported, all of the tasks are imported. Since there may be edits to the contents of homework from the moment of cohort creation until it actually starts, this command will remove all of the courses/units/tasks that are not related to pre-work.</p>
    <h3>Instructions</h3>
    <p>In the terminal run:</p>
    <code>
      heroku run rails c -a goodmeasure
    </code>
    <p>Find the id for the cohort to be afected.</p>
    <p>When the dyno spins up execute the following:</p>
    ...
      add permalink here
    ...
  </details>
