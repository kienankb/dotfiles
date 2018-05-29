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

export EDITOR=vim
export PATH=$PATH:/sbin:~/.scripts:~/.cargo/bin
export PS1="\[\033[38;5;5m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;4m\]\[$(hostname)\]\[$(tput sgr0)\]\[\033[38;5;15m\][\[$(tput sgr0)\]\[\033[38;5;14m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]]\n\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export WORKON_HOME=$HOME/projects/.virtualenvs
source /usr/bin/virtualenvwrapper_lazy.sh

# set up ssh-agent
if [ ! -f /tmp/ssh-agent.sh ]
then
	ssh-agent > /tmp/ssh-agent.sh
	source /tmp/ssh-agent.sh > /dev/null
	ssh-add ~/.ssh/*.osk
	ssh-add ~/.ssh/*.psk
else
	source /tmp/ssh-agent.sh > /dev/null
fi