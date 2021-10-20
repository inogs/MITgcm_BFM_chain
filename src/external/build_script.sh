./downloader_MITgcm_bfm.sh

# edit builder_MITgcm_bfm.sh - to set debug or not, compiler, ecc

./builder_MITgcm_bfm.sh -o bfm

./configure_MITgcm_bfm.sh
#-------------------------
cp presets/NORTH_ADRIATIC/SIZE.h_095p MYCODE/SIZE.h
#-------------------------
./builder_MITgcm_bfm.sh -o MITgcm

cp MITGCM_BUILD/mitgcmuv ../../HOST/${MIT_HOSTNAME}/bin/mitgcmuv_95 #_130
