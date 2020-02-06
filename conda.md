# Anaconda on USC HPC

Sometime we might need our python interpreter to replicate the exact running environment we have on our local
laptop. In this case, the python source directory can be difficult to work with (you might need to uninstall 
packages, or downgrade several packages). It is possible to install a conda environment in the HPC

## Installation

https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html

Follow the above guideline, use "sftp USER_NAME@hpc-transfer.usc.edu" to upload the conda installation shell file.

WARNING: DO NOT INSTALL CONDA IN YOUR HOME DIRECTORY - this will slow down your terminal speed so much that it will 
take multiple seconds to execute basic commands. Make sure you install conda in your project directory:
/auto/nlg-05/USER_NAME

## Job submission scripts

There are several changes to be made to the sbatch submission template to use conda environment (To be added)