# Set up Antibody
source <(antibody init)
antibody bundle < .plugins.txt

# Turn on completions
autoload -Uz compinit
compinit

# virtualenv environments
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME="$HOME/local/envs"
    source /usr/local/bin/virtualenvwrapper.sh
fi

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
