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

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
export PATH="$HOME/gems/bin:$PATH"

export EDITOR="vim"
export CLICOLOR=1

# only build 64-bit binaries, fix clang errors, link openssl
export CCFLAGS="-I/usr/local/opt/openssl/include -I$(xcrun --show-sdk-path)/usr/include/sasl"
export CPPFLAGS=$CCFLAGS
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export DYLD_LIBRARY_PATH="/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH" 

# set my usual python path and django settings
export DJANGO_SETTINGS_MODULE=settings

# used to trigger builds
export GITLAB_CI_TOKEN=5b081f9eadfd2495d6b60ae2f8dd86
export GITLAB_TOKEN=3-VqKzyzAv6GkdfqiVZ5
