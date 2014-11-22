HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/local/src/go/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export GOPATH="$HOME/Documents/Code/go"

export EDITOR="vim"
export CLICOLOR=1

# only build 64-bit binaries
# export CFLAGS="-arch x86_64"

# Fix clang errors
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

# virtualenv environments
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME="$HOME/local/envs"
    source /usr/local/bin/virtualenvwrapper.sh
fi

# include aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# ruby virtualenv setup; this loads RVM into a shell session as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/ramanan/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall


#
# Set up Antigen
#

source ~/.antigensrc/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle python

antigen theme https://gist.github.com/funkaoshi/fda87c35eaa4b8649813 mh-ram

antigen apply




