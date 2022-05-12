#******************************************************************************
# File:             bashrc
#
# Author:           PEMessage  
# Time:             2022/04/30 19:52:01
# Describe          This is my perosnal bashrc file 
#****************************************************************************/
# returns for non-interactive shells
[[ "$-" != *i* ]] && return


# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Function

# cd history "cd --" 
# Petar Marinov, http:/geocities.com/h2428, this is public domain
 cd_func ()
 {
   local x2 the_new_dir adir index
   local -i cnt
 
   if [[ $1 ==  "--" ]]; then
     dirs -v
     return 0
   fi
 
   the_new_dir=$1
   [[ -z $1 ]] && the_new_dir=$HOME
 
   if [[ ${the_new_dir:0:1} == '-' ]]; then
     # Extract dir N from dirs
     index=${the_new_dir:1}
     [[ -z $index ]] && index=1
     adir=$(dirs +$index)
     [[ -z $adir ]] && return 1
     the_new_dir=$adir
   fi
 
   #
   # '~' has to be substituted by ${HOME}
   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
 
   #
   # Now change to the new dir and add to the top of the stack
   pushd "${the_new_dir}" > /dev/null
   [[ $? -ne 0 ]] && return 1
   the_new_dir=$(pwd)
 
   #
   # Trim down everything beyond 11th entry
   popd -n +11 2>/dev/null 1>/dev/null
 
   #
   # Remove any other occurence of this dir, skipping the top of the stack
   for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
     popd -n +$cnt 2>/dev/null 1>/dev/null
     cnt=cnt-1
    fi
   done
 
   return 0
 }

alias cd=cd_func

alias ll='ls -l --color="auto"'
alias pe_proxy='http_proxy="127.0.0.1:7890";https_proxy="127.0.0.1:7890"'
alias pe_unsetproxy='unset http_proxy;unset https_proxy'

# Prompt Setting Zone
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function pe_setps1(){

    blackF="\e[30m" # Fonts color
    redF="\e[31m" 
    greenF="\e[32m" 
    yellowF="\e[33m" 
    blueF="\e[34m" 
    magentaF="\e[35m" 
    cyanF="\e[36m" 
    whiteF="\e[37m" 

    blackB="\e[30m" # Background color
    redB="\e[41m" 
    greenB="\e[42m" 
    yellowB="\e[43m" 
    blueB="\e[44m" 
    magentaB="\e[45m" 
    cyanB="\e[46m" 
    whiteB="\e[47m" 
    colorEnd="\e[0m"

    username='\u'
    hostname='\h'
    working_dir='\w'
    prompt='\$'
    number='\!'

    rember_pos='\[\e[s\e[1;1H\e[K\]'
    restore_pos='\[\e[0m\e[u\]' 
    nocountStart='\[[ '
    nocountEnd=' ]\]'
    statusline="$blueF$username@$hostname$colorEnd:$greenF$working_dir$colorEnd$colorEnd"
    user_prompt="$(parse_git_branch)$number-$yellowF$prompt$colorEnd"

    export PS1="$rember_pos"
           PS1+="$nocountStart"
           PS1+="$statusline"
           PS1+="$nocountEnd"
           PS1+="$restore_pos"
           PS1+="$user_prompt"
    #echo -ne "$rember_pos"
    #echo -ne ="$nocountStart"
    #echo -ne ="$statusline"
    #echo -ne ="$nocountEnd"
    #echo -ne ="$restore_pos"
    #echo -ne ="$user_prompt"

}

PROMPT_COMMAND=pe_setps1
bind -x '"\C-l":clear; echo -e "";'
echo -e ""

