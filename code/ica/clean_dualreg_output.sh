#!/bin/bash

# clean_dualreg_output.sh

# load fsl module
module unload fsl
module load fsl

rootpath=/scratch/hphi/ml437/euaims/adi_subgrp_ica/ica
drdir=$rootpath/dualreg


cd $drdir

#==============================================================================
#tnum="1 2 3 4 5 6 7 8 9 10 11 12 13"
tnum="1"

fstem="tfce_corrp_tstat"
for T in $tnum
do
	flist=`ls -d dr_stage3*${fstem}${T}*`
	outname=dr_stage3_icALL_${fstem}${T}.nii.gz
	echo Working on $outname
	fslmerge -t $outname $flist
done

fstem="tfce_p_tstat"
for T in $tnum
do
	flist=`ls -d dr_stage3*${fstem}${T}*`
	outname=dr_stage3_icALL_${fstem}${T}.nii.gz
	echo Working on $outname
	fslmerge -t $outname $flist
done

mkdir dr_stage3
mv dr_stage3_ic0*tfce*.nii.gz dr_stage3/


fstem="tstat"
for T in $tnum
do
	flist=`ls -d dr_stage3_ic0*${fstem}${T}*`
	outname=dr_stage3_icALL_${fstem}${T}.nii.gz
	echo Working on $outname
	fslmerge -t $outname $flist
done

mv dr_stage3_ic0*.nii.gz dr_stage3/

mkdir dr_stage1 dr_stage2
mv dr_stage2*.nii.gz dr_stage2/
mv dr_stage1*.txt dr_stage1/
