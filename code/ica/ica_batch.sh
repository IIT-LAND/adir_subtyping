# ica_batch.sh

rootpath=/scratch/hphi/ml437/euaims/adi_subgrp_ica
codedir=$rootpath/code

# Step 1:  resample all preprocessed data to the same resolution
#sbatch_opts='-J 3dresample -A hphi --qos=short.q --tasks-per-node=1 --cpus-per-task=1 --time=06:00:00 --mail-user=ml437@cam.ac.uk --mail-type=ALL --no-requeue -p wbic'
#sbatch $sbatch_opts resample_medn_data.sh

# Step 2:  run MELODIC  -- Takes around 4 days to complete
#sbatch_opts='-J run_melodic -A hphi --qos=long.q --tasks-per-node=1 --cpus-per-task=1 --time=7-00:00:00 --mail-user=ml437@cam.ac.uk --mail-type=ALL --no-requeue -p wbic --mem=32g'
#sbatch $sbatch_opts $codedir/run_melodic.sh

# Step 3:  run Dual Regression
sbatch_opts='-J dual_regression -A hphi --qos=short.q --tasks-per-node=1 --cpus-per-task=1 --time=06:00:00 --mail-user=ml437@cam.ac.uk --mail-type=ALL --no-requeue -p wbic --mem=32g'
sbatch $sbatch_opts run_dualreg.sh

# Step 4:  clean dual reg output
#sbatch $sbatch_opts clean_dualreg_output.sh

