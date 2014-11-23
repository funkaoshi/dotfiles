# zmodload zsh/zprof

# virtualenv environments
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME="$HOME/local/envs"
    source /usr/local/bin/virtualenvwrapper.sh
fi

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# ruby virtualenv setup; this loads RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


#
# Set up Antigen
#

source ~/.antigensrc/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle python
antigen bundle virtualenvwrapper
antigen bundle history
antigen bundle tmux
antigen bundle fabric

antigen theme https://gist.github.com/funkaoshi/fda87c35eaa4b8649813 mh-ram

antigen apply

# zprof
