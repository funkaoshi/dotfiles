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


if [[ $OSTYPE =~ "darwin*" ]] then
    # On OSX: only build 64-bit binaries, fix clang errors, link openssl
    export CCFLAGS="$CCFLAGS -I/usr/local/opt/openssl@1.1/include"
    export CCFLAGS="$CCFLAGS -I$(xcrun --show-sdk-path)/usr/include/sasl"
    export CCFLAGS="$CCFLAGS -I/usr/local/opt/libffi/include"
    export CPPFLAGS=$CCFLAGS
    export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/libffi/lib"
fi

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings
