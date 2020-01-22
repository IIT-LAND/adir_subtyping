#!/bin/bash

# run_dualreg.sh
starttime=`date +%s`

# load fsl module
module unload fsl
module load fsl

# paths
rootpath=/scratch/hphi/ml437/euaims/adi_subgrp_ica
icadir=$rootpath/ica
drdir=$icadir/dualreg
datadir=$rootpath/data
codedir=$rootpath/code
outdir=$drdir
cd $rootpath
#mkdir $drdir

# set some dualreg input parameters
icmap=$icadir/melodic_IC
desnorm=1
desmat=$drdir/design.mat
descon=$drdir/design.con
n_perm=10

# construct sublist
subs=`cat $codedir/asd_subgrp_data_rsfmri_ALL_DSM5_sublist.txt`
sublist=""
for sub in $subs
do
	sublist="$sublist $datadir/${sub}_T1c_medn_nlw_resamp.nii.gz"
done
#echo $sublist


echo dual_regression $icmap $desnorm $desmat $descon $n_perm $outdir $sublist
dual_regression $icmap $desnorm $desmat $descon $n_perm $outdir $sublist

stoptime=`date +%s`
echo Processing time `ccalc -form cint ${stoptime}-${starttime}` seconds
