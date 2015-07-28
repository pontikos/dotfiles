source ~/dil-tunnels.sh
source ~/ucl-tunnels.sh

#reports unbound bash variables
set -u
# Basic External source

#pdflatex and other latex utilities are in /usr/texbin
export PATH=$HOME/bin:/usr/texbin/:$PATH

alias ldd='otool -L'

# Env var
export EDITOR=/usr/bin/vim

alias gvim=/usr/bin/mvim

alias ll='ls -la'
alias l='ls -Glrt'

# rlwrap specific
export RLWRAP_EDITOR="vim +%L +%C"

# User specific aliases and functions


#alias mybsub='bsub -u pontikos -q production -P prod'
#function mybigbsub() { mybsub -M 16896 -R "rusage[mem=16896]" $*; }
#alias mybsubi='mybsub -K'
#alias sql='sqlplus'
#alias sqltax='sql taxonomy_reader/reader@sppro'
#alias sqlprot='sql op$pontikos/protkos@prot'
#alias vim=/usr/bin/vim
#alias pdfjoin=~/bin/pdfjam/scripts/pdfjoin
alias functions='declare -f'
alias functionnames='declare -F'
#also export -f for exported functions

# What linux distro is this?
#export DISTRO=`head -n1 /etc/issue | cut --delimiter=' ' -f 1 | awk '{print tolower($1);}'`
#export PRINTER=ricoh4

#compare: like comm but does sort -u on the 2 files you wish to compare
function compare() {
       comm $1 <(cat $2 | sort -u $2) <(cat $3 | sort -u);
}

function calc() {
       echo "scale=4; $1" | bc
}


function lines() {
       sed -n "$1,$2p" $3
}

function line() {
       sed -n "$1p" $2
}

function remotecpfrom() {
    #establish tunnel to sheepshed
    #ssh -f -N -L 1234:192.168.195.4:22 nikolas@mess.cimr.cam.ac.uk
    #establish tunnel to linapp-1
    #works only if linapp-1 specified in .ssh/config
    #ssh -f -N -L 1234:linapp-1:22 nikolas@mess.cimr.cam.ac.uk
    #do copy
    scp -P 1234 -i ~/.ssh/id_rsa nikolas@127.0.0.1:$1 .
}

function remotecpto() {
    #establish tunnel to sheepshed
    #ssh -f -N -L 1234:192.168.195.4:22 nikolas@mess.cimr.cam.ac.uk
    #do copy
    scp -P 1234 -i ~/.ssh/id_rsa $1 nikolas@127.0.0.1:$2
}

function csvgrep() {
    m=$1
    f=$2
    paste <(head -n1 $f | tr ',' '\n') <(grep $m $f | tr ',' '\n')
}

alias trimout="sed 's/,\s\+/,/g' | sed 's/\s\+,/,/g' | sed 's/^\s\+//g'"

umask g+wrx

# Prompt
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
BIBlack='\e[1;90m'      # Black
#export PS1='\[\e[0;32m\]\u@\h:\w${text}$\e[m\] '
#export PS1='\[\e[1;31m\][\u@\h:\w]\$\[\e[0m\] ' # red color
#export PS1='\[\e[2;32m\][\u@\h:\w]\$\[\e[0m\] ' # green color
#export PS1='[\u@\h:\w]\$ ' #grey
export PS1="\[$BIBlack\][\u@\h:\w]\$\[$txtrst\] " #grey
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
export TERM=xterm-color

export PYTHONSTARTUP=~/.pythonrc

PERL_MB_OPT="--install_base \"/Users/pontikos/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pontikos/perl5"; export PERL_MM_OPT;

export PATH=$PATH:/Users/pontikos/VAAST_Code_2.1.4
#
export DYLD_INSERT_LIBRARIES="/Users/pontikos/stderred/build/libstderred.dylib${DYLD_INSERT_LIBRARIES:+:$DYLD_INSERT_LIBRARIES}"
