# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate
if ! zgenom saved; then
  # specify plugins here
  zgenom prezto

  zgenom load romkatv/powerlevel10k powerlevel10k

  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-syntax-highlighting

  if hash tmux &>/dev/null; then
    zgenom prezto tmux
  fi

  # generate the init script from plugins above
  zgenom save
  zgenom compile ~/.zshrc
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# hstr
alias hh=hstr
setopt histignorespace
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor
bindkey -s "\C-r" "\C-a hstr -- \C-j"

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

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
