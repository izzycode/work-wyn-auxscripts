
create_react_project () {

  npx create-react-app $1
  cd $1
  yarn add react-router-dom
  yarn global add json
  yarn add eslint eslint-config-airbnb eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-react pre-commit --dev
  #eslint --init # creates .eslintrc.json

  # Configure package.json
  # Configure lint
  json -I -f package.json -e 'this.scripts.lint="eslint src/**/*.{js,jsx}"'
  # Configure pre-commit
  json -I -f package.json -e 'this.precommit=["lint"]'








  # Configure eslint-react plugin
  # json -I -f package.json -e 'this.extends="airbnb-base"'
  # json -I -f package.json -e 'this.lint=""' # TODO add rules

}

create_react_project "c33-something"
