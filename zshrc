# zmodload zsh/zprof

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# generate and source plugins from ~/.zsh_plugins.txt
antidote load

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

if command -v pyenv >/dev/null 2>&1; then
    # activate pyenv!
    eval "$(pyenv init --path)"
fi

if command -v rbenv >/dev/null 2>&1; then
    # activate rbenv!
    eval "$(rbenv init -)"
fi

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# fast fuzzy search bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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


