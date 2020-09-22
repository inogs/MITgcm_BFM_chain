# run with OpenMP: needs to set environment var. OMP_NUM_THREADS
#    and generally, needs to increase the stack-size:
#   -  sh,bash:
#     > export OMP_NUM_THREADS=2
#     > export KMP_STACKSIZE=400m
#   - csh,tcsh:
#     > setenv OMP_NUM_THREADS 2
#     > setenv KMP_STACKSIZE 400m
#  NOTE, MPI+OpenMP: might need to set KMP_STACKSIZE in ~/.tcshrc
#        (but curiously, works without OMP_NUM_THREADS in ~/.tcshrc).
#-------

  CC=mpiicc
  FC=mpiifort 
  F90C=mpiifort
  LINK=mpiifort

DEFINES='-DWORDLENGTH=4'
CPP='cpp -traditional -P'
F90FIXEDFORMAT='-fixed -Tf'
EXTENDED_SRC_FLAG='-132'
GET_FC_VERSION="--version"
OMPFLAG='-openmp'

NOOPTFLAGS='-O0 -g'
NOOPTFILES=''

if test "x$GENERIC" != x ; then
    PROCF=-axSSE4.2,SSE4.1,SSSE3,SSE3,SSE2
else
    PROCF=-xHost
fi

FFLAGS="$FFLAGS -m64 -fPIC -assume byterecl -mcmodel=large -shared-intel -extend_source "


if test "x$IEEE" = x ; then     #- with optimisation:
  FOPTIM="-O2 -align -ip -qopt-streaming-stores auto $PROCF" 
else
  if test "x$DEVEL" = x ; then  #- no optimisation + IEEE :
    FOPTIM="-O0 -fp-model source -noalign $PROCF"
  else                          #- development/check options:
    FOPTIM="-O0 -noalign -g -traceback $PROCF"
    NOOPTFLAGS=$FOPTIM
    NOOPTFILES='adread_adwrite.F'
    FOPTIM="$FOPTIM -warn all -warn nounused"
    FOPTIM="$FOPTIM -fpe0 -ftz -fp-stack-check -check all -ftrapuv"
  fi
fi

F90FLAGS=$FFLAGS
F90OPTIM=$FOPTIM
CFLAGS="-O0 -ip -m64 -fPIC $PROCF"


NETCDF_ROOT=$NETCDFF_HOME
NETCDF_HOME=$NETCDFF_HOME
NETCDF_INCDIR=$NETCDFF_INC
MPI_INC_DIR=$INTELMPI_HOME/include64


if [ -n "$MPI_INC_DIR" -a "x$MPI" = xtrue ] ; then
    INCLUDES="$INCLUDES -I$MPI_INC_DIR"
    INCLUDEDIRS="$INCLUDEDIRS $MPI_INC_DIR"
    MPIINCLUDEDIR="$MPI_INC_DIR"
    MPI_HEADER_FILES='mpif.h mpiof.h netcdf.inc pnetcdf.inc'
fi

export INCLUDEDIRS="$INCLUDEDIRS $BFM_INC $GSL_INC"
export INCLUDES="$INCLUDES -I$BFM_INC -I$GSL_INC"
export LIBS="$LIBS -L$BFM_LIB -lbfm -L$GSL_LIB -lgsl -lgslcblas -L$NETCDFF_LIB -lnetcdff "
