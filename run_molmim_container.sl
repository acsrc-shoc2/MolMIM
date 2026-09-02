#!/bin/bash -e

#SBATCH --time          04:00:00
#SBATCH --mem           60GB
#SBATCH --cpus-per-task 8
#SBATCH --account       uoa04517
#SBATCH --gres		gpu:L4:1
#SBATCH --job-name      run_molmim_container
#SBATCH --output        run_molmim_container.log

./run_molmim_container.sh
