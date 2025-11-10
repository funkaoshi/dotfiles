# zmodload zsh/zprof

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

fpath=(/Users/ramanan/.docker/completions $fpath)

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
    /opt/homebrew/opt/libpq/bin
    /opt/homebrew/opt/icu4c/bin
    /usr/local/bin
    /usr/local/sbin
    $HOME/.local/bin
    $HOME/local/bin
    $HOME/go/bin
    $HOME/.cargo/bin
    $path[@]
)

fpath=(~/.zsh $fpath)

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases
[[ -s ~/.aliases.local ]] && source ~/.aliases.local

# fast fuzzy search bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ $OSTYPE =~ "darwin*" ]] then
    # On OSX: only build 64-bit binaries, fix clang errors, link openssl
    export CFLAGS="$CFLAGS -I$(brew --prefix openssl@3.5)/include"
    export CFLAGS="$CFLAGS -I$(xcrun --show-sdk-path)/usr/include/sasl"
    export CFLAGS="$CFLAGS -I$(brew --prefix libffi)/include"
    export CFLAGS="$CFLAGS -I$(brew --prefix libpq)/include"
    export CPPFLAGS=$CFLAGS
    export LDFLAGS="-L$(brew --prefix openssl@3.5)/lib -L$(brew --prefix libffi)/lib -L$(brew --prefix libpq)/lib -L$(brew --prefix icu4c)lib"
fi

# use mise for managing python, ruby, etc, versions
eval "$(~/.local/bin/mise activate zsh)"

# zprof
