#!/bin/bash
#SBATCH --ntasks=1                      # Number of instances launched of this job.
#SBATCH --time=00:10:00                 # The time allocated for this job. Default is 30 minsutes. Acceptable format: MM, MM:SS, HH:MM:SS, DD-HH", DD-HH:MM, DD-HH:MM:SS.
#SBATCH --partition=isi                 # The partition of HPC of this job. Remove this line if you don't want to specify a partition
#SBATCH --cpus-per-task=1               # Number of CPU needed. Unless your code is designed to utilize multiple threads this number should stay 1.
#SBATCH --mem-per-cpu=1G                # Memory allocated per cpu core. Default is 1GB.
#SBATCH --gres=gpu:k20:1                # Number of GPU cores needed. Format is gpu:<GPU_type>:<number>.
#SBATCH --mem-per-gpu=1G                # Memory allocated per GPU core.
#SBATCH --job-name=JOB_NAME             # The name of this job. If removed the job will have name of your shell script.
#SBATCH --output=%x-%j.out              # The name of the file output. %x-%j means JOB_NAME-JOB_ID. If removed output will be in file slurm-JOB_ID.
#SBATCH --mail-user=EMAIL_ADDRESS       # Email address for email notifications to be sent to.
#SBATCH --mail-type=ALL                 # Type of notifications to receive. Other options includes BEGIN, END, FAIL, REQUEUE and more.
#SBATCH --export=NONE                   # Ensure job gets a fresh login environment
#SBATCH --array=n-m                     # Submitting an array of (n-m+1) jobs, with $SLURM_ARRAY_TASK_ID ranging from n to m. Add %1 if you only want one jobs running at one time.

### Load the python version of your choosing (Here we load python 3.7.4)
source /usr/usc/python/3.7.4/setup.sh
SOURCE_DIR=$(pwd)
echo ""

### Change to staging directory for fast read/write, output some system variables for monitoring
cd /staging/PROJECT_NAME/USER_NAME
echo "Current working directory: $(pwd)"
echo "Starting run at: $(date)"
echo "Job Array ID / Job ID: $SLURM_ARRAY_JOB_ID / $SLURM_JOB_ID"
echo "This is job $SLURM_ARRAY_TASK_ID out of $SLURM_ARRAY_TASK_COUNT jobs."
echo ""

### Add your python code here
python3 "$SOURCE_DIR"/YOUR_PYTHON_SCRIPT.py "$SLURM_ARRAY_TASK_ID"

### Finishing up the job and copy the output off of staging
mkdir "$SOURCE_DIR"/output
cp OUTPUT_FILES_OR_FOLDER "$SOURCE_DIR"/output
echo "Job finished with exit code $? at: $(date)"
