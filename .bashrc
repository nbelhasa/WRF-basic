# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# ATMOSPHERE START
export CSS=/lus/sw
module use -a $CSS/modules/modulefiles
export PATH=$PATH:$CSS/.local/bin
export machine=atmosphere
export LUS=/lus/scratch/nalshamsi
export TMPDIR=/lus/scratch/tmp

export LD_LIBRARY_PATH=$(echo $LD_LIBRARY_PATH | sed -e 's/$/:/;s/^/:/;s/:/::/g;:a;s#\(:[^:]\{1,\}:\)\(.*\)\1#\1\2#g;ta;s/::*/:/g;s/^://;s/:$//;')
export PATH=$(echo $PATH | sed -e 's/$/:/;s/^/:/;s/:/::/g;:a;s#\(:[^:]\{1,\}:\)\(.*\)\1#\1\2#g;ta;s/::*/:/g;s/^://;s/:$//;')


module load miniconda3
source activate ncl_stable
module load ncview
module load cray-netcdf
module load cray-hdf5


shopt -s extglob # enables extglob i.e. @(x|y|z) regular expressions in bash
shopt -s direxpand
# ATMOSPHERE END
