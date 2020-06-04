# set history variables
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Ensure languages are set
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export GOPATH="$HOME/Documents/Code/go"

export GEM_HOME=$HOME/gems

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/gems/bin:$PATH"


export EDITOR="vim"
export CLICOLOR=1


if [[ $OSTYPE =~ "darwin*" ]] then
    # On OSX: only build 64-bit binaries, fix clang errors, link openssl
    export CCFLAGS="-I/usr/local/opt/openssl/include -I$(xcrun --show-sdk-path)/usr/include/sasl"
    export CPPFLAGS=$CCFLAGS
    export LDFLAGS="-L/usr/local/opt/openssl/lib"
fi

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings
