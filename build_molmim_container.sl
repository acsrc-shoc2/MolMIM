#!/bin/bash -e

#SBATCH --time          04:00:00
#SBATCH --mem           60GB
#SBATCH --cpus-per-task 8
#SBATCH --account       uoa04517
#SBATCH --job-name      build_molmim_container
#SBATCH --output        build_molmim_container.log

./build_molmim_container.sh
