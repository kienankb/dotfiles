# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

source ~/.bash_aliases

eval $(thefuck --alias)

export KITTY_HOSTNAME=`hostname`
export EDITOR=vim
export PATH=$PATH:/sbin:~/.scripts:~/.cargo/bin:~/.local/bin:~/projects/tools/eww/target/release
source ~/.local/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export WORKON_HOME=$HOME/projects/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -f -g \"\""

# source ssh-agent info

if [ -f /tmp/ssh-agent.sh ]
then
	source /tmp/ssh-agent.sh > /dev/null
fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
. "$HOME/.cargo/env"
