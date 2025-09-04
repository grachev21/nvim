# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# True color support - ПЕРЕМЕЩЕНО ВВЕРХ
if [ -n "$TMUX" ]; then
    export TERM="tmux-256color"
else
    export TERM="xterm-256color"
fi
export COLORTERM="truecolor"

# History settings
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

# Window size check
shopt -s checkwinsize

# Lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Debian chroot
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Xterm title
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Colors and aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Source aliases and completions
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

if ! shopt -oq posix; then
    [ -f /usr/share/bash-completion/bash_completion ] && source /usr/share/bash-completion/bash_completion
    [ -f /etc/bash_completion ] && source /etc/bash_completion
fi

# Neovim path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Faster CD navigation
shopt -s autocd

# Immediate history update
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Better directory navigation
cd() {
    if builtin cd "$@"; then
        ls -l --color=auto
        return 0
    else
        return 1
    fi
}

# Python virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
[ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ] && source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
