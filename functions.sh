set -u
# Basic External source


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

function fullpath() {
    echo `pwd -P`/$1
}

function linkchk() {
    find $1 -type l -print0 | xargs -r0 file | grep "broken symbolic"| sed -e 's/^\|: *broken symbolic.*$//g'
}

