#!/bin/bash

clean=0
config=0
compile=0
jarg=2
pnetcdf=0
pnetcdf_quilt=0
prgenv=cray
perftools=0
atp=0

#module load cray-hdf5-parallel
#module load cray-netcdf-hdf5parallel
module load cray-netcdf
module load cray-hdf5
module load cray-mpich
module list

export HDF5=$HDF5_DIR
#export PHDF5=$HDF5_DIR
export NETCDF=$NETCDF_DIR
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
#export IBM_REDUCE_BUG_WORKAROUND=1

export EM_CORE=1 
export WRF_CHEM=1 
export WRF_KPP=1
export FLEX_LIB_DIR=/usr/lib64
export YACC="yacc -d"

conf=46

./clean -a


rm -rf compile_real.log
./configure
#./configure << EOF
#$conf
#1
#EOF
./compile em_real &> compile_real.log
./compile em_real
