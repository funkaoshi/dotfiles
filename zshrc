# zmodload zsh/zprof

# Set up Antibody
source ~/.zsh_plugins.sh

# Set up lazyloading for slow start up scripts (virtualenv, etc)
source ~/.sandboxd/sandboxd

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
    /usr/local/share/npm/bin
    /usr/local/opt/postgresql@9.6/bin
    /usr/local/opt/ncurses/bin
    /usr/local/opt/ruby/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/go/bin
    $HOME/local/bin
    $HOME/gems/bin
    $path[@]
)

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# zprof

