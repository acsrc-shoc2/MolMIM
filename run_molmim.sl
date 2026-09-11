#!/bin/bash -e

#SBATCH --time          00:30:00
#SBATCH --mem           20GB
#SBATCH --cpus-per-task 8
#SBATCH --account       uoa04517
#SBATCH --gres		gpu:A100:1
#SBATCH --job-name      molmim
#SBATCH --output        molmim.log

module load JupyterLab/2026.7.0-foss-2026-4.6.0

#Check for a key at ~/.ngc/ngc_api_key.molmim
#Exit if no key
./check_molmim_api_key.sh

papermill molmim.ipynb output.ipynb -p API_KEY $(cat ~/.ngc/ngc_api_key.molmim)
