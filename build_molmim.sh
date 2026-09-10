#!/bin/bash -e

#Set up cache folders
unset APPTAINER_BIND
APPTAINER_CACHEDIR=$(mktemp -d)
APPTAINER_TMPDIR=${APPTAINER_CACHEDIR}

#Build container 
apptainer build --force molmim.sif molmim.def
chmod 640 molmim.sif
