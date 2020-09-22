#! /bin/bash

#         builder_MITgcm_bfm.sh

#      Edit sections 1,2,3,4 in order to configure compilation and linking.

################################################################### 
#  Section 1. Choose the *.inc file, with the definition of compiler flags, to be included in Makefile
#             
#             This is a machine dependent operation, flags for
#             most popular compilers (gnu, intel, xl) are provided.
#             In the following example user will select the file x86_64.LINUX.intel.dbg.inc
#             both in bfm/compilers/ and ogstm/compilers 

usage() {
echo "Builds MITgcm executable linked to BFM and the coupler"
echo "SYNOPSYS"
echo "builder_MITgcm_bfm.sh [ -o MODEL] "
echo "MODEL can be bfm or MITgcm"
echo ""
}

if [ $# -lt 2 ] ; then
  usage
  exit 1
fi

for I in 1 ; do
   case $1 in
      "-o" ) COMPILE_ONLY=$2;;
        *  ) echo "Unrecognized option $1." ; usage;  exit 1;;
   esac
   shift 2
done




MIT_ARCH=x86_64
MIT_OS=LINUX
MIT_COMPILER=intel
DEBUG=       # this is the choice for production flags 
#DEBUG=.dbg   # this is the one for debug flags


################################################################### 
#  Section 2. Use of OpenMP threads, to improve the parallelization of ogstm.
# Just comment one of thes lines:
export OPENMP_FLAG=-fopenmp  # OpenMP activated
export OPENMP_FLAG=          # OpenMP deactivated


###################################################################
# Section 3.  Module loads (and set of environment variables)

# This is a machine dependent operation. Modules are usually used on clusters.
# User can write his module file, in the directory below there are some examples.
# Warning : this choice must be consistent with Section 1. 

# Just comment the two following lines you are not using modules. 
export MODULEFILE=$PWD/compilers/machine_modules/galileo.intel
source $MODULEFILE

COUPLERDIR=$PWD/BFMCOUPLER
BFMDIR=$PWD/bfm
MITGCM_ROOT=$PWD/MITgcm
INC_FILE=${MIT_ARCH}.${MIT_OS}.${MIT_COMPILER}${DEBUG}.inc

if [[ $COMPILE_ONLY == bfm ]] ; then

# ----------- BFM library ---------------------
cd $BFMDIR
# in-place replace the entire ARCH line
sed -i "s/.*ARCH.*/        ARCH    = '$INC_FILE'  /"  build/configurations/OGS_PELAGIC/configuration
cd $BFMDIR/build
./bfm_configure.sh -gvc -o ../lib/libbfm.a -p OGS_PELAGIC
if [ $? -ne 0 ] ; then  echo  ERROR; exit 1 ; fi

cd $BFMDIR/include
awk '{print "  "$0}' BFM_var_list.h > BFM_var_list.h.tmp
mv BFM_var_list.h.tmp BFM_var_list.h
echo "Finish. BFM lib has been created "
exit 0
fi

cp pkg_groups MITgcm/pkg/pkg_groups

export BFM_INC=${BFMDIR}/include
export BFM_LIB=${BFMDIR}/lib

mkdir -p ${MITGCM_ROOT}/pkg/BFMcoupler
MYCODE=$PWD/MYCODE
MAKECPU=8
MITGCM_GNMK=${MITGCM_ROOT}/tools/genmake2


###### build part #######################
MITGCM_OF=$PWD/compilers/$INC_FILE

BUILD_DIR=${PWD}/MITGCM_BUILD
   LOGDIR=${PWD}/MITGCM_LOG
#######################################################


##### devel part ######################################

echo "start MITgcm compiling ..."

rm -rf $BUILD_DIR $LOGDIR
mkdir -p  $BUILD_DIR $LOGDIR

echo "launching MITgcm genmake2 with customized code in $MYCODE and build_options $MITGCM_OF ..."
cd $BUILD_DIR

${MITGCM_GNMK} -mpi -gsl -of=${MITGCM_OF} -rootdir=${MITGCM_ROOT} -mods=${MYCODE} > $LOGDIR/genmake2.log 2>$LOGDIR/genmake2.err

ANS=$?
echo genmake2 exit status : $ANS
if [ $ANS -ne 0 ] ; then echo "ERROR " ; exit 1 ; fi

echo "launching dependencies compilation ..."
make depend > $LOGDIR/depend2.log 2>$LOGDIR/depend2.err
ANS=$?
echo make depend exit status : $ANS
if [ $ANS -ne 0 ] ; then echo "ERROR " ; exit 1 ; fi

echo "launching project compilation ..."
make -j $MAKECPU > $LOGDIR/make.log 2>&1  #$LOGDIR/make.err 
ANS=$?
echo make exit status : $ANS
if [ $ANS -ne 0 ] ; then echo "ERROR " ; exit 1 ; fi

echo "Compiling finished!"


