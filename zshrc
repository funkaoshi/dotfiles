# zmodload zsh/zprof

# Set up Antibody
source ~/.zsh_plugins.sh

# Set up lazyloading for slow start up scripts (virtualenv, etc)
source ~/.sandboxd

# Turn on completions
autoload -Uz compinit

# speed up compinit by only checking cache once a day
# https://gist.github.com/ctechols/ca1035271ad134841284
() {
    setopt extendedglob local_options

    if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
        compinit
    else
        compinit -C
    fi
}

# set paths
typeset -U PATH path
path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /opt/homebrew/opt/ruby/bin
    /usr/local/bin
    /usr/local/sbin
    $HOME/local/bin
    $path[@]
)

# activate pyenv!
eval "$(pyenv init - zsh)"

# activate rbenv!
eval "$(rbenv init - zsh)"

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ $OSTYPE =~ "darwin*" ]] then
    # On OSX: only build 64-bit binaries, fix clang errors, link openssl
    export CFLAGS="$CFLAGS -I$(brew --prefix openssl@1.1)/include"
    export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include/sasl"
    export CFLAGS="$CFLAGS -I$(brew --prefix libffi)/include"
    export CPPFLAGS=$CFLAGS
    export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib -L$(brew --prefix libffi)/lib"
fi

# zprof

