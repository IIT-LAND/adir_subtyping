#!/bin/bash

# subid
subid=101129844643
boldname=bold.nii.gz
mpragename=Adni_mprage_2.nii.gz

# explicitly state echo times
te1=12
te2=31
te3=48

# load modules
module load default-wbic
module load Anaconda
module load AFNI

# meica directory
meicadir=/home/ml437/meica_v3.2

# scratch directories
scratchdir=/scratch/hphi/ml437
rootdir=$scratchdir/euaims
codedir=$rootdir/code
preprocdir=$rootdir/preproc_v3.2

# data directories
datadir=/data/ml437/euaims
rsfmridatadir=$datadir/rsfmri/LEAP_V01
mpragedatadir=$datadir/adni_mprage/LEAP_V01

# me-ica options
meica_opts="-e $te1,$te2,$te3 --tpattern=alt+z --MNI --qwarp --OVERWRITE"

# subject-specific data directories
rsfmri_subdir=$rsfmridatadir/$subid/BOLD/task006
echo1dir=$rsfmri_subdir/echo1
echo2dir=$rsfmri_subdir/echo2
echo3dir=$rsfmri_subdir/echo3
mprage_subdir=$mpragedatadir/$subid/anatomy

# subject-specific scratch directories
scratch_subdir=$preprocdir/$subid
rm -Rf $scratch_subdir
mkdir $scratch_subdir
# name of bash script to make
bashscript2make=$scratch_subdir/${subid}_preproc_batch.sh

# make first line
echo '#!/bin/bash' >> $bashscript2make
echo  >> $bashscript2make

# make symbolic links
echo '# making symbolic links' >> $bashscript2make
echo ln -s $echo1dir/$boldname $scratch_subdir/${subid}_rsfmri_TE1.nii.gz >> $bashscript2make
echo ln -s $echo2dir/$boldname $scratch_subdir/${subid}_rsfmri_TE2.nii.gz >> $bashscript2make
echo ln -s $echo3dir/$boldname $scratch_subdir/${subid}_rsfmri_TE3.nii.gz >> $bashscript2make
echo ln -s $mprage_subdir/$mpragename $scratch_subdir/${subid}_Adni_mprage.nii.gz >> $bashscript2make

# call meica
echo '# call meica' >> $bashscript2make
echo cd $scratch_subdir >> $bashscript2make
data_arg=${subid}_rsfmri_TE[1,2,3].nii.gz
anat_arg=${subid}_Adni_mprage.nii.gz
echo python $meicadir/meica.py -d '"'$data_arg'"' -a $anat_arg $meica_opts --prefix=$subid >> $bashscript2make

# compute framewise displacement
echo '# compute framewise displacement' >> $bashscript2make
meica_subdir=$scratch_subdir/meica.${subid}_rsfmri_TE123
echo cd $meica_subdir >> $bashscript2make
echo python $codedir/fd.py -d motion.1D >> $bashscript2make
echo mv motion_fd.txt ${subid}_motion_fd.txt >> $bashscript2make
echo mv motion_fd_summary_stats.csv ${subid}_motion_fd_summary_stats.csv >> $bashscript2make
echo mv ${subid}_motion_fd* $scratch_subdir >> $bashscript2make

# compute dvars
echo '# compute dvars' >> $bashscript2make
ted_dir=$meica_subdir/TED
echo cd $ted_dir >> $bashscript2make
echo python $codedir/dvars_me.py --hik dn_ts_OC_T1c.nii --tsoc ts_OC.nii >> $bashscript2make
echo python $codedir/dvars_me.py --tsoc ts_OC.nii >> $bashscript2make
echo mv dn_ts_OC_T1c_dvars.txt ${subid}_dn_ts_OC_T1c_dvars.txt >> $bashscript2make
echo mv dn_ts_OC_T1c_dvars_summary_stats.csv ${subid}_dn_ts_OC_T1c_dvars_summary_stats.csv >> $bashscript2make
echo mv ts_OC_dvars.txt ${subid}_ts_OC_dvars.txt >> $bashscript2make
echo mv ts_OC_dvars_summary_stats.csv ${subid}_ts_OC_dvars_summary_stats.csv >> $bashscript2make
echo mv *dvars*.txt *dvars*.csv $scratch_subdir >> $bashscript2make

# plot fd and dvars
echo '# plot fd and dvars' >> $bashscript2make
echo cd $scratch_subdir >> $bashscript2make
echo python $codedir/plot_fd_dvars_me.py --fd ${subid}_motion_fd.txt --dvars_hik ${subid}_dn_ts_OC_T1c_dvars.txt --dvars_tsoc ${subid}_ts_OC_dvars.txt --subid $subid --pdf2save ${subid}_fd_dvars_plot.pdf >> $bashscript2make

# clean up directory
echo '# clean up directory' >> $bashscript2make
flist2delete='meica.* *mprage_do.nii.gz *mprage_ns_at.nii.gz *WARP* *mprage_ns.nii.gz *mprage_u.nii.gz *.1D'
echo rm -Rf $flist2delete >> $bashscript2make

# execute bashscript2make through sbatch
sbatch_opts='-J 101129844643 -A hphi --qos=short.q --tasks-per-node=1 --cpus-per-task=1 --time=06:00:00 --mail-user=ml437@cam.ac.uk --mail-type=ALL --no-requeue -p wbic --mem=4g'
cd $scratch_subdir
sbatch $sbatch_opts $bashscript2make

