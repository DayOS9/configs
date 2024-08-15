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

#this is for alacritty
#export TERM=alacritty
#export TERM=xterm-256color
#export TERM=screen-256color
export TERM=xterm-kitty

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
eval "$(zoxide init zsh)"
source <(fzf --zsh)
