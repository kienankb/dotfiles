eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.cargo/env"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(thefuck --alias)"

export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -f -g \"\""

alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias status="git status"
alias add="git add -A"
alias com="git commit"
alias push="git push"
alias pull="git pull"
alias search="ps -ef | grep -i"
alias grep="grep --color=auto"
alias FUCK='fuck --hard'
