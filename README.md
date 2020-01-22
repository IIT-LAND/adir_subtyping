# Code and data for ADI-R subtyping project

This repository has all the code and tidy data for the analyses in Bertelsen et al.,

The code directory has all of the code for running the primary analyses.

The data directory houses tidy data generated for each step.

## Requirements

* **AFNI** (https://afni.nimh.nih.gov/) - for preprocessing

* **FSL** (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki) - for preprocessing and ICA


* **Python 2.7** from the **Anaconda** distribution (https://www.anaconda.com/distribution/)

  + **meica 3.2** (https://bitbucket.org/prantikk/me-ica) - for running ME-ICA preprocessing.

  + **nibabel** (https://nipy.org/nibabel/) - used by `dvars_me.py`.


* **R 3.5.1** or higher and **RStudio** (https://rstudio.com/)

  + **R libraries**

  **```c("here","ggplot2","rjson","readxl","reshape2","WGCNA","nlme")```**


* **MATLAB R2018b** or higher (https://www.mathworks.com/)

  + **FSLNets** (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLNets) - Used for computation of partial correlations to estimate connectivity.
