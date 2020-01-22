# run_preproc.py
"""
Writes a bash script for a subject that will run the full preprocessing pipeline
and any follow-up framewise displacement and dvars computations.

Example usage
python run_preproc.py --metadata bold_anat_fnames.txt --site cambridge --subidx '0,10' --script_only
"""

# import modules
import os
import numpy as np
import pandas as pd
from optparse import OptionParser


# function to parse input arguments
def parse_args():
    """
    Parse arguments.
    """
    parser=OptionParser()
    parser.add_option('--metadata',"",dest='metadata',help="Meta data file ex --metadata bold_anat_fnames.txt",default=None)
    parser.add_option('--site',"",dest='site',help="Site ex --site cambridge",default=None)
    parser.add_option('--subidx',"",dest='subidx',help="Subject indices to process (starts at 0) ex --subidx '0,10'",default=None)
    parser.add_option('--script_only',"",action="store_true",dest='script_only',help="Make the bash script but do not execute",default=False)
    parser.add_option('--ram',"",dest='ram',help="RAM to use ex --ram 4g",default="4g")
    parser.add_option('--kdaw',"",dest='kdaw',help="kdaw for meica ex --kdaw=15",default=None)
    (options,args) = parser.parse_args()
    return(options)


# function to write main bash script
def write_script(subid, bold_fname, mprage_fname, te1, te2, te3, ram="4g", kdaw=None):
    """
    Function to write main bash script.
    """
    script = []
    script.append("#!/bin/bash")
    script.append("")
    script.append("# subid")
    script.append("subid=%s" % subid)
    script.append("boldname=%s" % bold_fname)
    script.append("mpragename=%s" % mprage_fname)
    script.append("")
    script.append("# explicitly state echo times")
    script.append("te1=%d" % te1)
    script.append("te2=%d" % te2)
    script.append("te3=%d" % te3)
    script.append("")
    script.append("# load modules")
    script.append("module load default-wbic")
    script.append("module load Anaconda")
    script.append("module load AFNI")
    script.append("")
    script.append("# meica directory")
    script.append("meicadir=/home/ml437/meica_v3.2")
    script.append("meicarepdir=/home/ml437/Meica_Report")
    script.append("")
    script.append("# scratch directories")
    script.append("scratchdir=/scratch/hphi/ml437")
    script.append("rootdir=$scratchdir/euaims")
    script.append("codedir=$rootdir/code")
    script.append("preprocdir=$rootdir/preproc_v3.2")
    script.append("")
    script.append("# data directories")
    script.append("datadir=/data/ml437/euaims")
    script.append("rsfmridatadir=$datadir/rsfmri/LEAP_V01")
    script.append("mpragedatadir=$datadir/adni_mprage/LEAP_V01")
    script.append("")
    script.append("# me-ica options")
    if kdaw is None:
        script.append('meica_opts="-e $te1,$te2,$te3 --tpattern=alt+z --MNI --qwarp --OVERWRITE"')
    else:
        script.append('meica_opts="-e $te1,$te2,$te3 --tpattern=alt+z --MNI --qwarp --daw=%d --OVERWRITE"' % kdaw)
    script.append("")
    script.append("# subject-specific data directories")
    script.append("rsfmri_subdir=$rsfmridatadir/$subid/BOLD/task006")
    script.append("echo1dir=$rsfmri_subdir/echo1")
    script.append("echo2dir=$rsfmri_subdir/echo2")
    script.append("echo3dir=$rsfmri_subdir/echo3")
    script.append("mprage_subdir=$mpragedatadir/$subid/anatomy")
    script.append("")
    script.append("# subject-specific scratch directories")
    script.append("scratch_subdir=$preprocdir/$subid")
    script.append("rm -Rf $scratch_subdir")
    script.append("mkdir $scratch_subdir")
    script.append("# name of bash script to make")
    script.append("bashscript2make=$scratch_subdir/${subid}_preproc_batch.sh")
    script.append("")
    script.append("# make first line")
    script.append("echo '#!/bin/bash' >> $bashscript2make")
    script.append("echo  >> $bashscript2make")
    script.append("")
    script.append("# make symbolic links")
    script.append("echo '# making symbolic links' >> $bashscript2make")
    script.append("echo ln -s $echo1dir/$boldname $scratch_subdir/${subid}_rsfmri_TE1.nii.gz >> $bashscript2make")
    script.append("echo ln -s $echo2dir/$boldname $scratch_subdir/${subid}_rsfmri_TE2.nii.gz >> $bashscript2make")
    script.append("echo ln -s $echo3dir/$boldname $scratch_subdir/${subid}_rsfmri_TE3.nii.gz >> $bashscript2make")
    script.append("echo ln -s $mprage_subdir/$mpragename $scratch_subdir/${subid}_Adni_mprage.nii.gz >> $bashscript2make")
    script.append("")
    script.append("# call meica")
    script.append("echo '# call meica' >> $bashscript2make")
    script.append("echo cd $scratch_subdir >> $bashscript2make")
    script.append("data_arg=${subid}_rsfmri_TE[1,2,3].nii.gz")
    script.append("anat_arg=${subid}_Adni_mprage.nii.gz")
    script.append("""echo python $meicadir/meica.py -d '"'$data_arg'"' -a $anat_arg $meica_opts --prefix=$subid >> $bashscript2make""")
    script.append("")
    script.append("# compute framewise displacement")
    script.append("echo '# compute framewise displacement' >> $bashscript2make")
    script.append("meica_subdir=$scratch_subdir/meica.${subid}_rsfmri_TE123")
    script.append("echo cd $meica_subdir >> $bashscript2make")
    script.append("echo python $codedir/fd.py -d motion.1D >> $bashscript2make")
    script.append("echo mv motion_fd.txt ${subid}_motion_fd.txt >> $bashscript2make")
    script.append("echo mv motion_fd_summary_stats.csv ${subid}_motion_fd_summary_stats.csv >> $bashscript2make")
    script.append("echo mv ${subid}_motion_fd* $scratch_subdir >> $bashscript2make")
    script.append("")
    script.append("# run meica_report.py")
    script.append("echo '# run meica_report.py' >> $bashscript2make")
    script.append("echo python $meicarepdir/meica_report.py -o ./${subid}.Report --motion motion.1D -t ./TED/ --overwrite --ncpus 5 >> $bashscript2make")
    script.append("echo mv ${subid}.Report $scratch_subdir >> $bashscript2make")
    script.append("")
    script.append("# compute dvars")
    script.append("echo '# compute dvars' >> $bashscript2make")
    script.append("ted_dir=$meica_subdir/TED")
    script.append("echo cd $ted_dir >> $bashscript2make")
    script.append("echo python $codedir/dvars_me.py --hik dn_ts_OC_T1c.nii --tsoc ts_OC.nii >> $bashscript2make")
    script.append("echo python $codedir/dvars_me.py --tsoc ts_OC.nii >> $bashscript2make")
    script.append("echo mv dn_ts_OC_T1c_dvars.txt ${subid}_dn_ts_OC_T1c_dvars.txt >> $bashscript2make")
    script.append("echo mv dn_ts_OC_T1c_dvars_summary_stats.csv ${subid}_dn_ts_OC_T1c_dvars_summary_stats.csv >> $bashscript2make")
    script.append("echo mv ts_OC_dvars.txt ${subid}_ts_OC_dvars.txt >> $bashscript2make")
    script.append("echo mv ts_OC_dvars_summary_stats.csv ${subid}_ts_OC_dvars_summary_stats.csv >> $bashscript2make")
    script.append("echo mv *dvars*.txt *dvars*.csv $scratch_subdir >> $bashscript2make")
    script.append("")
    script.append("# plot fd and dvars")
    script.append("echo '# plot fd and dvars' >> $bashscript2make")
    script.append("echo cd $scratch_subdir >> $bashscript2make")
    script.append("echo python $codedir/plot_fd_dvars_me.py --fd ${subid}_motion_fd.txt --dvars_hik ${subid}_dn_ts_OC_T1c_dvars.txt --dvars_tsoc ${subid}_ts_OC_dvars.txt --subid $subid --pdf2save ${subid}_fd_dvars_plot.pdf >> $bashscript2make")
    script.append("")
    script.append("# clean up directory")
    script.append("echo '# clean up directory' >> $bashscript2make")
    script.append("flist2delete='meica.* *mprage_do.nii.gz *mprage_ns_at.nii.gz *WARP* *mprage_ns.nii.gz *mprage_u.nii.gz *.1D'")
    script.append("echo rm -Rf $flist2delete >> $bashscript2make")
    script.append("")
    script.append("# execute bashscript2make through sbatch")
    script.append("sbatch_opts='-J %s -A hphi --qos=short.q --tasks-per-node=1 --cpus-per-task=1 --time=06:00:00 --mail-user=ml437@cam.ac.uk --mail-type=ALL --no-requeue -p wbic-cs --mem=%s'" % (subid, ram))
    script.append("cd $scratch_subdir")
    script.append("sbatch $sbatch_opts $bashscript2make")
    script.append("")

    fname2save = "%s_preproc_spec.sh" % subid
    fname = open(fname2save,"w")
    fname.write("\n".join(script)+"\n")
    fname.close()
    return(fname2save)


# boilerplate code to call main code for executing
if __name__ == '__main__':
    # parse arguments
    opts = parse_args()

    # flag for making script only
    script_only = opts.script_only

    # which site to use
    site = opts.site
    # ram
    ram = opts.ram
    # kdaw
    kdaw = opts.kdaw
    if kdaw is not None:
        kdaw = np.array(kdaw, dtype=int)

    # which subs to process
    subidx = opts.subidx
    subidx = np.array(subidx.split(','), dtype=int)

    # read in meta data file
    meta_data_file = opts.metadata
    meta_data = pd.read_table(meta_data_file, index_col = 0)
    # grab subset of meta data to use
    meta_data2use = meta_data.loc[site][subidx[0]:subidx[1]]

    for isub in range(meta_data2use.shape[0]):
        # get subid
        subid = meta_data2use["subid"][isub]
        # get bold filename
        bold_fname = meta_data2use["bold"][isub]
        # get mprage filename
        mprage_fname = meta_data2use["mprage"][isub]

        # get echo times
        te1 = meta_data2use["te1"][isub]
        te2 = meta_data2use["te2"][isub]
        te3 = meta_data2use["te3"][isub]

        # write bash script
        bashscriptname = write_script(subid=subid, bold_fname=bold_fname,
                                      mprage_fname=mprage_fname,
                                      te1=te1, te2=te2, te3=te3, ram=ram,
                                      kdaw=kdaw)

        if not script_only:
            os.system("bash %s" % bashscriptname)
