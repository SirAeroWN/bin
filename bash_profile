
### custom stuff ###
# search binds
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# colorize ls output
export CLICOLOR=1

### stuff from cassidoo ###
alias reload='source ~/.bashrc'
alias a='echo "------------Your aliases------------";alias'
alias sa='source ~/.bashrc;echo "Bash aliases sourced."'
alias bp='nano ~/.bashrc'

# Git Stuff
alias co='git checkout'
alias st='git status'
alias yolo='git status && git add -A && git commit -m "I do what I want" && git push origin master'

## Add line before each terminal command
fill="-- "
reset_style='\[\033[00m\]'
status_style=$reset_style'\[\033[0;90m\]' # gray color; use 0;37m for lighter color
prompt_style=$reset_style
command_style=$reset_style'\[\033[1;29m\]' # bold black

# Prompt variable:
#PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\u@\h:\w\$'"$command_style "
# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG

function prompt_command {
  # create a $fill of all screen width minus the time string and a space:
  let fillsize=${COLUMNS}-20
  fill=""
  while [ "$fillsize" -gt "0" ]
  do
    fill="-${fill}" # fill with underscores to work on
    let fillsize=${fillsize}-1
  done

  ################################################################################################################
  if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
    BRANCH="\$(__git_ps1 '[ %s ] ')"
  fi
  local TIME=`fmt_time` # format time for prompt string
  local LOAD=`uptime|awk '{min=NF-2;print $min}'`
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  # return color to Terminal setting for text color
  local DEFAULT="\[\033[0;39m\]"
  export PS1="$status_style"'$fill \t\n'"\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\h:${GRAY}\w ${CYAN}]\n${GREEN}${BRANCH}${DEFAULT}$ "
}
PROMPT_COMMAND=prompt_command




fmt_time () { #format time just the way I likes it
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi
    date +"%l:%M:%S$meridiem"|sed 's/ //g'
}
pwdtail () { #returns the last 2 fields of the working directory
    pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}
chkload () { #gets the current 1m avg CPU load
    local CURRLOAD=`uptime|awk '{print $8}'`
    if [ "$CURRLOAD" > "1" ]; then
        local OUTP="HIGH"
    elif [ "$CURRLOAD" < "1" ]; then
        local OUTP="NORMAL"
    else
        local OUTP="UNKNOWN"
    fi
    echo $CURRLOAD
}

#PS1="$status_style"'$fill \t\n'"$prompt_style"'\[\e[0;32m\]\u\[\e[m\]\[\e[0m\]\[\e[32m\]@\h \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'


# Filesystem Stuff
alias l='ls -F'
alias la='ls -aF'
alias ll='ls -lhAF'
alias ..='cd ..'
alias ...='cd ../../'


### mine ###
alias vi="vim"
alias svi="sudo vim"
alias update="sudo apt update && sudo apt upgrade"
alias root="sudo -i"
alias su="sudo -i"
alias howdoi="howdoi --color --all"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
