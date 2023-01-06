# pets: destfile=/home/ema/.bashrc, owner=ema, group=ema, mode=0644
# pets: package=bash-completion
# pets: package=autojump

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

eval "$(dircolors -b)"
alias ls='ls --color=auto'

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export EMAIL=ema@debian.org

export QUILT_PATCHES=debian/patches
export QUILT_SERIES=debian/patches/series

. /etc/bash_completion
. /usr/share/autojump/autojump.sh
