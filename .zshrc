# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  # specify plugins here
  zgen prezto

  zgen load romkatv/powerlevel10k powerlevel10k

  zgen zsh-users/zsh-completions
  zgen zsh-users/zsh-history-substring-search

  # generate the init script from plugins above
  zgen save
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# hstr
export HISTFILE=~/.zsh_history
export HH_CONFIG=hicolor
bindkey -s "\C-r" "\eqhstr\n"

PATH="/usr/local/bin:/usr/local/sbin:$HOME/.composer/vendor/bin:$(yarn global bin):$(brew --prefix ruby)/bin:$PATH"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
