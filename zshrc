# zmodload zsh/zprof

# Set up Antibody
source ~/local/dotfiles/zsh_plugins.sh

# Set up lazyloading for slow start up scripts (virtualenv, etc)
source ~/local/dotfiles/sandboxd/sandboxd

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

# include aliases
[[ -s ~/.aliases ]] && source ~/.aliases

# iterm shell integration
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# zprof
