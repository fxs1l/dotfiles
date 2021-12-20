# rpg-cli configuration
# Your filesystem as a dungeon!
# reference: https://github.com/facundoolano/rpg-cli

rpg () {
  rpg-cli "$@"
  cd "$(rpg-cli pwd)"
}

# create an alias to return home safely
alias rhome='rpg cd --force /home/fxs1l/ && rpg'

# create aliases without having to integrate rpg-cli into shell
alias rls='rpg ls'
alias rcb='rpg cd .. && rls'
alias rcd='rpg cd'

# Full shell integration
# cd () {
#   rpg-cli cd "$@"
#   builtin cd "$(rpg-cli pwd)"
# 
# ls (){
#   command ls "$@"
#   if [$# -eq 0]; then
#       rpg cd -f .
#       rpg ls
#   fi
# }
#
# Arbitray dungeon levels
# dn () {
#    current=$(basename $PWD)
#    number_re='^[0-9]+$'
#
#    if [[ $current =~ $number_re ]]; then
#        next=$(($current + 1))
#        command mkdir -p $next && cd $next && rpg ls
#    elif [[ -d 1 ]] ; then
#        cd 1 && rpg ls
#    else
#        command mkdir -p dungeon/1 && cd dungeon/1 && rpg ls
#    fi
#}
