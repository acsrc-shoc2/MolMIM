# MolMIM

Codebase for SHOC2 containerised version of MolMIM. Files:

- molmim.def: Apptainer definition file to build a container for molmim
- build_molmim.sh:Bash script to build molmim container
- molmim.ipynbJupyter notebook to use molmim interactively
- run_molmim.slSLURM script to run molmim.ipynb non-interactively

Suggested usage:

1. Run ./build_molmim.sh and make sure molmim.sif is built
2. Goto https://ondemand.nesi.org.nz/public/ and select Jupyter Lab
    - Cluster: SLURM HPC
    - Project Code: uoa04517
    - JupyterLab Module: 2026.7.0-foss-2026-4.6.0
    - Number of Hours: 2
    - Number of Cores: 4
    - Memory per Job: 20 GB
    - GPU: L4
3. When Open Ondemand starts, select the file 'molmim.ipynb' from the chooser
4. Modify file to run your workflow
5. If you need to run for longer, or a GPU is not available, save changes in molmum.ipynb, open a terminal kernel in Open Ondemand, and type:
6. sbatch run_molmim.sl