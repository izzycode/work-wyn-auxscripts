let groups = [
  ["Wynwood Waldo", "Aaron Holland", "Nicole Cuellar", "Adlai Bradley", "Wilson Ng"],
  ["Votelity", "Joshua Martinez", "Miguel Clavel", "Gabriel Vicioso", "Anthony Gil"],
  ["In Between", "Sophia Banda", "Chris Menendez", "Tushar Poojara"],
  ["Pet 101", "Jajuan Burton", "Darci Pons", "Edwin Sanchez", "Syed Rahman"],
  ["Recipe box", "Johan Gace", "Micha Carrera", "Gerson Areche"],
  ["Tiny Garden", "Raphaël Burkhardt", "Matthew Palmer", "Tim Martinez", "Mixolidia Gautreaux"]
]

let fakeCohortSlug = 'c34'

const fetch = require('node-fetch')

let opts = {
  headers: {
    'Authorization': 'Basic ' + new Buffer.from(`izzycode:dragoneante47`).toString('base64')
  }
}

const parseGithubData = (ghData, groups) => {
  for(i=0; i < groups.length; i++){
    for(j=1; j < groups[i].length; j++){
      for(k=0, found=false; k < ghData.length && found === false; k++){
        if (ghData[k][0] && ( groups[i][j].toLowerCase().includes( ghData[k][0].toLowerCase() ) ) ){
          groups[i][j] = { name: groups[i][j], login: ghData[k][1] }
          ghData.splice(k,1)
          found = true
        }
      }
      if( typeof groups[i][j] === "string" ){
        groups[i][j] = { name: groups[i][j] }
      }
    }
  }
  console.log('ghData: ', ghData, " groups: ", groups)
}

const teamMembers = async (team) => {
  let ghubTeamReq = await fetch(`https://api.github.com/orgs/wyncode/teams/${team}`, this.opts)
  let ghubTeam = await ghubTeamReq.json()
  let membersReq = await fetch(ghubTeam.members_url.replace('{/member}', ''), this.opts)
  let moreMembersReq = await fetch(ghubTeam.members_url.replace('{/member}', '') + '?page=2', this.opts)
  let members = [...(await membersReq.json()), ...(await moreMembersReq.json())]

  let response = members.map( async member => {
    let dataReq = await fetch(`https://api.github.com/users/${member.login}`, this.opts)
    let data = await dataReq.json()
    return [data.name, data.login]
  })
  Promise.all(response).then( data => {
    let finalResult = parseGithubData(data, groups)
    console.log(finalResult)
    return finalResult
  })
}

const matchGithubUsernames = async (groups, cohortSlug) => {
  await teamMembers(cohortSlug)
}

console.log('Final result: ', matchGithubUsernames(groups, fakeCohortSlug) )


// Wynwood Waldo Votelity In Between Pet 101 Recipe box Tiny Garden
// Aaron Holland Joshua Martinez Sophia Banda Jajuan Burton Johan Gace Raphaël Burkhardt
// Nicole Cuellar Miguel Clavel Chris Menendez Darci Pons Micha Carrera Matthew Palmer
// Adlai Bradley Gabriel Vicioso Tushar Poojara Edwin Sanchez Gerson Areche Tim Martinez
// Wilson Ng Anthony Gil Mixolidia Gautreaux Syed Rahman