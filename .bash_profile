# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad
    alias ls='ls -GFh --color=auto'
fi

# some more aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -Al'
alias del='rm -i'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export TERM=xterm-256color

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
    PS1='${debian_chroot:+($debian_chroot)}\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]:[\[\033[33;1m\]\w\[\033[m\]]\[\033[00;34m\]$(__git_ps1 "%s")\[\033[00m\]\$ '
fi

# auto-complete branches, etc
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi

export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1

# start tmux

#if [[ "$TERM" != "screen" ]]; then
#    WHOAMI=$(whoami)
#    if tmux has-session -t $WHOAMI 2>/dev/null; then
#        tmux -2 attach-session -t $WHOAMI
#    else
#        tmux -2 new-session -s $WHOAMI
#    fi
#fi
