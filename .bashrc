# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f $HOME/.fbspecific/.fbbashrc ]; then
  . $HOME/.fbspecific/.fbbashrc
fi

if [ -f $HOME/.alias ]; then
  source $HOME/.alias
fi

export PS1="[\u@\h \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$ "
GIT_PS1_SHOWDIRTYSTATE=1      

export PAGER='less'
export LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
export GREP_OPTIONS='--color=auto'

# Include the following code in your .bashrc file to automatically set screen's
# window title and hardstatus line.

# Before each prompt, echo an escape sequence telling xterm or screen that
# a prompt is coming up, so that it can recognize command names
case "$TERM" in
    xterm*|rxvt*|gnome*)
        # For xterm, the sequence '\033]0;<string>\007' sets the title
        # to <string>
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: "'\
'"${PWD/$HOME/~}\007"'
        ;;
    screen|screen.linux)
        # Set the hardstatus line to contain the window title, hostname, and
        # current directory.
        #
        # Set dynamically set the title based on the currently running command.
        #
        # For screen, the sequence '\033_<string>\033\\' sets the
        # hardstatus to <string>
        # the sequence '\033k<string>\033\\' sets the title to <string>
        # the sequence '\033k\033\\' causes screen to take the title
        # from the next command entered
        PROMPT_COMMAND='echo -ne "\033_t "'\
'"${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\\\\033k\033\\\\"'
        ;;
    *)
        ;;
esac

set -o vi

# vi:set filetype=sh:
export PATH=/usr/local/git/bin/:$PATH

# history
export HISTCONTROL=erasedups
export HISTSIZE=100000
shopt -s histappend
