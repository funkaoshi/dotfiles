# zmodload zsh/zprof

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote

# source antidote
. ~/.antidote/antidote.zsh

# set fpath before loading plugins (needed for completions)
fpath=($HOME/.zsh $HOME/.docker/completions $fpath)

# use antidote static bundle for faster startup
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins.zsh
[[ -f $zsh_plugins ]] || antidote bundle <~/.zsh_plugins.txt >$zsh_plugins
source $zsh_plugins

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

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases
[[ -s ~/.aliases.local ]] && source ~/.aliases.local

# fast fuzzy search bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ $OSTYPE == darwin* ]] && (( $+commands[brew] )); then
    # On macOS: fix clang errors, link openssl, libffi, libpq
    _brew=$(brew --prefix)
    export CFLAGS="-I$_brew/opt/openssl@3/include -I$_brew/opt/libffi/include -I$_brew/opt/libpq/include"
    export CPPFLAGS=$CFLAGS
    export LDFLAGS="-L$_brew/opt/openssl@3/lib -L$_brew/opt/libffi/lib -L$_brew/opt/libpq/lib -L$_brew/opt/icu4c/lib"
    unset _brew
fi

# use mise for managing python, ruby, etc, versions
eval "$(mise activate zsh)"

# zprof
