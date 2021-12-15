# rpg-cli configuration
# Your filesystem as a dungeon!
# reference: https://github.com/facundoolano/rpg-cli

rpg () {
  rpg-cli "$@"
  cd "$(rpg-cli pwd)"
}

# create an alias to return home safely
alias rhome='rpg cd /home/fxs1l/ && rpg'

# create an alias to do cd without having to integrate cd into shell
alias rcd='rpg cd' 

