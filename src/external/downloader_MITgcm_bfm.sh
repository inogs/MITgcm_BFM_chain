#! /bin/bash


  BFM_BRANCH=dev_ogs

 MITGCM_TAG=checkpoint66j

# ----------- BFM library ---------------------

OGSTM_HOME=$PWD

# Requirement: to have an account on git server
git clone https://github.com/CMCC-Foundation/BiogeochemicalFluxModel.git bfm
#git clone git@github.com:CMCC-Foundation/BiogeochemicalFluxModel.git bfm
#maranicineca Rk3tfe181085
cd bfm
git checkout -b $BFM_BRANCH origin/$BFM_BRANCH

cd $OGSTM_HOME
git clone https://github.com/gcossarini/BFMCOUPLER.git
#git clone git@github.com:gcossarini/BFMCOUPLER.git
cd BFMCOUPLER
git checkout bfmv5

cd $OGSTM_HOME
git clone https://github.com/MITgcm/MITgcm.git
cd MITgcm
git checkout -b $MITGCM_TAG $MITGCM_TAG
