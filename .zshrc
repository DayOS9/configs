# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#source $(dirname $(gem which colorls))/tab_complete.sh
#alias ls='colorls'
alias ls='eza --icons'
alias vim="nvim"
alias cd='z'

#vi mode for shell
set -o vi

#for python executables to work
#python3.11 -m site &> /dev/null && PATH="$PATH:`python3.11 -m site --user-base`/bin"

#for gcc update homebrew
#alias gcc='gcc-13'
#alias g++='g++-13'
#export PATH="/usr/local/opt/llvm/bin:$PATH"
#export JAVA_HOME=$(/usr/libexec/java_home)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# this is to fix p10k git issues ?
unset ZSH_AUTOSUGGEST_USE_ASYNC

#this is for miniconda
# export PATH="/Users/Daois2/miniconda3/bin:$PATH"  # commented out by conda initialize

#this is for alacritty
#export TERM=alacritty
#export TERM=xterm-256color
#export TERM=screen-256color
export TERM=xterm-kitty

#yazi func that will leave at last directory visited
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#this is for zoxide and fzf plugin to work (also needed for yazi)
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/Daois2/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/Daois2/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/Daois2/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/Daois2/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

#when homebrew installing postgresql need to add this path
export PATH="/usr/local/opt/postgresql@16/bin:$PATH"
export PGPORT=8888
