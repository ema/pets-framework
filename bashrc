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

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

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
alias ssh-add-tpm='ssh-add -s /usr/lib/x86_64-linux-gnu/libtpm2_pkcs11.so.1'

export DEBFULLNAME="Emanuele Rocca"
export EMAIL=ema@debian.org

# Get rid of tpm2-pkcs11 warnings:
# - "Getting tokens from fapi backend failed"
# - "Could not strtoul($DEB_VERSION_UPSTREAM): Success"
export TPM2_PKCS11_LOG_LEVEL=0

. /etc/bash_completion
. /usr/share/autojump/autojump.sh
