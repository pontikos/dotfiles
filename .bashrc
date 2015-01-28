#reports unbound bash variables
set -u
# Basic External source

#python
export PYTHON=/share/apps/python-2.7.3-static
export PATH=$PYTHON/bin/:$PATH
#pdflatex and other latex utilities are in /usr/texbin
export vyp_software=/cluster/project8/vyp/vincent/Software
export pontikos_software=/cluster/project8/vyp/pontikos/Software
export PATH=$HOME/bin:/usr/texbin/:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=/share/apps/R:$PATH
export PATH=$HOME/bin/VAAST_Code_2.1.4/:$PATH
export PATH=$HOME/bin/ctags-5.8/:$PATH
export PATH=$HOME/bin/axel-1.0b/:$PATH
#novoalign
export PATH=${vyp_software}/novocraft3/:$PATH
#samtools
export PATH=${vyp_software}/samtools-1.1/:$PATH
#bedtools
export PATH=${vyp_software}/bedtools-2.17.0/bin/:$PATH
#vcftools
export PATH=${vyp_software}/vcftools_0.1.12a/bin:$PATH
#tabix
export PATH=${vyp_software}/tabix-0.2.3/:$PATH
#pVAAST
pVAAST=$pontikos_software/VAAST_Code_2.1.4/
export PATH=$pVAAST/bin:$pVAAST/bin/vaast_tools:$PATH
#R
export PATH=$HOME/R-3.1.2/bin:$PATH
#vcflib
export PATH=$pontikos_software/vcflib/bin:$PATH

# Env var
export EDITOR=/usr/bin/vim

alias gvim=/usr/bin/mvim

alias ll='ls -la'
alias l='ls -lrt'
alias zless='zless -S'

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
export PS1='\[\e[1;90m\][\u@\h:\w]$\[\e[0m\] ' #grey
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
export TERM=xterm-color

alias mount-dil='sshfs nikolas@linapp-1:/home/nikolas /Users/pontikos/dil'

export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=$HOME/.local/lib:$PYTHON/lib/python2.7

alias qsh='qrsh -wd $PWD -pty y -l tmem=1G,h_vmem=1G,h_rt=2:0:0 bash'
alias bigqsh='qrsh -wd $PWD -pty y -l tmem=8G,h_vmem=8G,h_rt=8:0:0 bash'

# follows symlink
alias pwd='pwd -P'
#alias cd='cd -P'

#perl nonsense
set +u
source ~/perl5/perlbrew/etc/bashrc
#export PERL5LIB=/home/rmhanpo/perl5/lib/perl5/x86_64-linux-thread-multi/local.pod/:$PERL5LIB
export PERL5LIB=/home/rmhanpo/perl5/lib/perl5:$PERL5LIB
export PERL5LIB=${vyp_software}/vcftools_0.1.12a/lib/perl5/site_perl:$PERL5LIB

function fullpath() {
    echo `pwd -P`/$1
}


export BCF_TOOLS=$pontikos_software/bcftools/
export PATH=$BCF_TOOLS:$PATH
export BCFTOOLS_PLUGINS=$BCF_TOOLS/plugins
export LD_LIBRARY_PATH=$BCFTOOLS/plugins/:$pontikos_software/htslib/


function linkchk() {
    find $1 -type l -print0 | xargs -r0 file | grep "broken symbolic"| sed -e 's/^\|: *broken symbolic.*$//g'
}
