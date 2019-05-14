#
# ~/.bashrc
# /root/.bashrc
#

# If not running interactively, don't do anything
    [[ $- != *i* ]] && return

# Source some aliases
    source /etc/bash.bash_aliases

# Disable ctrl-s and ctrl-q.
stty -ixon

# Neuter less
    export LESSHISTFILE=/dev/null

# Set the default editor based on environment
    export EDITOR="$(
        if [[ -n $DISPLAY ]]; then
            echo 'nano';
        else
            echo 'nano';
        fi
    )"

# Avoid successive duplicates in bash command history
    export HISTCONTROL=ignoredups

# Append commands to bash history rather than overwriting
    shopt -s histappend

# Auto cd into directories
    shopt -s autocd

# Append commands to bash history upon execution, not at session close
    PROMPT_COMMAND='history -a'

# Ignore cd, ls, bg, fg, exit commands in bash history
    export HISTIGNORE="..:cd:ls:ll:[bf]g:exit"

# Set the prompt

# So _prompt evaluates prior to displaying PS1 each time
    export PROMPT_COMMAND=_prompt

# The PS1 prompt itself
    function _prompt() {
    # This bit needs to be first
        local EXIT="$?"
    # Add some color
        local RC="\033[0m"	# Reset color (white)
        local RED="\033[31m"
        local GREEN="\033[32m"
    # First part of the prompt
        PS1="\n┌─"
    # Followed by the second; RED=root GREEN=user
        if [ $EUID == 0 ] ; then
            PS1+="[${RED}\h${RC}]"
        else
            PS1+="[${GREEN}\h${RC}]"
        fi
    # And the third
        PS1+="─"
    # Almost there; RED=error GREEN=no error
        if [ $EXIT != 0 ] ; then
            PS1+="[${RED}\w${RC}]"
        else
            PS1+="[${GREEN}\w${RC}]"
        fi
    # And finally
        PS1+="\n└───╼ "
    }
        PS2="  └───╼ "
        PS3="  ╾───╼ "
        PS4="  + "

# The original prompts just in case they're needed
    #PS1='[\u@\h \W]\$ '
    #PS2='> '
    #PS3='> '
#PS4='+ '
