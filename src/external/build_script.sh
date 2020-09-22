./downloader_MITgcm_bfm.sh

# edit builder_MITgcm_bfm.sh - to set debug or not, compiler, ecc

./builder_MITgcm_bfm.sh -o bfm

./configure_MITgcm_bfm.sh
./builder_MITgcm_bfm.sh -o MITgcm
