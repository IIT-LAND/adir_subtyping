#!/bin/bash

# run_melodic.sh
starttime=`date +%s`

# load fsl module
module unload fsl
module load fsl

# paths
rootpath=/scratch/hphi/ml437/euaims
outdir=$rootpath/adi_subgrp_ica
datadir=$outdir/data
codedir=$outdir/code
icadir=$outdir/ica
cd $datadir
mkdir $icadir

# create symbolic links in data directory
echo "Making symbolic links"
resampdir=$rootpath/resamp_data
# clear previous symbolic links in data directory
rm -Rf $datadir/*
subs=`cat $codedir/asd_subgrp_data_rsfmri_ALL_DSM5_sublist.txt`
for sub in $subs
do
	echo ln -s $resampdir/${sub}_T1c_medn_nlw_resamp.nii.gz $datadir
	ln -s $resampdir/${sub}_T1c_medn_nlw_resamp.nii.gz $datadir
done
ls -l $datadir

# make flist to use in melodic call
rm -Rf $codedir/flist.txt
subs=`cat $codedir/asd_subgrp_data_rsfmri_ALL_DSM5_sublist.txt`
for sub in $subs
do
	echo $datadir/${sub}_T1c_medn_nlw_resamp.nii.gz >> $codedir/flist.txt
done
sublist=$codedir/flist.txt

# masks
masksdir=$outdir/masks
bgimg=$masksdir/bg_brain.nii.gz
bgmask=$masksdir/bg_mask.nii.gz

# TR and dimest.
TR=2.3
dimest=30

# run melodic
echo melodic -i $sublist -o $icadir -d $dimest --nobet --tr=$TR --bgimage=$bgimg --Oall --report -v -a concat --mmthresh=0.5
melodic -i $sublist -o $icadir -d $dimest --nobet --tr=$TR --bgimage=$bgimg --Oall --report -v -a concat --mmthresh=0.5

stoptime=`date +%s`
echo Processing time `ccalc -form cint ${stoptime}-${starttime}` seconds.
