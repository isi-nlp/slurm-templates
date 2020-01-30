# USC HPC Slurm Templates

Since we constantly interact with HPC for training and testing models, this repo serves as a collection for best
practises to submit python jobs to HPC using slurm. If you see anything here that is not a best practise/was a 
best practise but has now been changed, please let me know or create a pull request to update it.

## Setup your Python Environment

https://hpcc.usc.edu/support/documentation/python/

## Slurm Templates

In this repo you can find the the following slurm templates
* Template for a single job submission
* Template for an array job submission (good for threading/running multiple job at the same time)
* (In progress) The DMTCP-checking pointing enabled job submission. In the case of unexpected outage the job will resubmit till complete.

## Contact

Author: David Li

Email: dwangli@isi.edu
