#
# ~/.bash_profile
# /root/.bash_profile
#

[[ -s ~/.bashrc ]] && . ~/.bashrc

# Clear terminal at logon
    printf "\033c"

# Append PATH with .config/bin
    PATH=$PATH:$HOME/.config/bin

# Start X at logon ( add exec in front of startx to auto logout after killing X )
#    [[ $(fgconsole 2>/dev/null) == 1 ]] && startx -- -keeptty &> /dev/null
#    logout
