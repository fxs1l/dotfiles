# Disable the background color of 'ls' output
eval "$(dircolors -b /home/fxs1l/.dircolors)"  
alias ls='ls --color=auto'

# Change the Konsole profile when using nvim
# reference: https://www.pling.com/p/1661487/
alias nvim='sh /home/$USER/.config/scripts/KonsoleProfileSwitcher_ActiveWindow_V2.sh' 

# Set an alias for todo.sh
alias t='todo.sh'

# Vim quit alias for leaving the terminal
alias :q='exit'
