# set history variables
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GOPATH="$HOME/Documents/Code/go"

export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

export EDITOR="vim"
export CLICOLOR=1

# only build 64-bit binaries, fix clang errors, link openssl
export CFLAGS="-arch x86_64 -Qunused-arguments -I/usr/local/opt/openssl/include"
export CPPFLAGS=$CFLAGS
export LDFLAGS="-L/usr/local/opt/openssl/lib"

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings

