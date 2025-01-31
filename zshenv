# set history variables
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GEM_HOME=$HOME/gems

export EDITOR="vim"
export CLICOLOR=1

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings

. "$HOME/.cargo/env"
