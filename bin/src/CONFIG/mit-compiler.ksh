#!/bin/ksh

sed	-e "s%@@(I:MIT_HOME)%${MIT_HOME}%g"			\
	-e "s%@@(I:MIT_MODULE)%${MIT_MODULE}%g"			\
	-e "s%@@(I:MIT_HOSTNAME)%${MIT_HOSTNAME}%g"		\
	-e "s%@@(I:MIT_WORKDIR)%${MIT_WORKDIR}%g"		\
	-e "s%@@(I:MIT_BACKUP)%${MIT_BACKUP}%g"			\
	-e "s%@@(I:MIT_ARCH)%${MIT_ARCH}%g"			\
	-e "s%@@(I:MIT_OS)%${MIT_OS}%g"				\
	-e "s%@@(I:MIT_COMPILER)%${MIT_COMPILER}%g"		\
	-e "s%@@(I:MIT_VERSION_NUMBER)%${MIT_VERSION_NUMBER}%g"	\
	-e "s%@@(I:MIT_VERSION)%${MIT_VERSION}%g"		\
	-e "s%@@(I:MIT_EXTENSION)%${MIT_EXTENSION}%g"		\
	-e "s%@@(I:MIT_STAGE)%${MIT_STAGE}%g"			\
	$1 > $2

