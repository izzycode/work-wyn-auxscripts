const fetch = require('node-fetch')
const get = require('readline-sync')
const API_ENDPOINT = 'https://api.github.com'

const createRepoFromTemplate = (templateId, auth) => {
  const url = `https://api.github.com/repos/:template_owner/:template_repo/generate`
  fetch('', {
    method: 'POST',
    headers: {
      'Accept': 'application/vnd.github.baptiste-preview+json'
    },
  })
}

const authenticate = (username, password) => {
  fetch(`${API_ENDPOINT}/user`, {
    headers: {
      'Authorization': 'Basic ' + new Buffer.from(username + ':' + password).toString('base64')
    }
  })
  .then( res => res.json() )
  .then( data => console.log(data ) )
}

const username = get.question('Username: ')
const password = get.question('Password: ')
authenticate(username, password)