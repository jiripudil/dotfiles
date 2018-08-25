#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Load antibody
source <(antibody init)

# completions
antibody bundle zsh-users/zsh-completions
fpath=($HOME/.zsh/completions $fpath)

# history substring
antibody bundle zsh-users/zsh-history-substring-search

PATH="$(brew --prefix php@7.2)/bin:/usr/local/bin:$HOME/.composer/vendor/bin:$(yarn global bin):$PATH"
export LSCOLORS=ExGxFxdxCxegedabagacad
export GPG_TTY=$(tty)
alias ls='ls -Gh'
alias vi='vim'

COLORS='di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-colors ${(s.:.)COLORS}
zstyle ':completion:*' group-name ''

# see https://carlosbecker.com/posts/speeding-up-zsh/
#autoload -Uz compinit
#if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#	compinit;
#else
#	compinit -C;
#fi;

source $HOME/.zshprompt
