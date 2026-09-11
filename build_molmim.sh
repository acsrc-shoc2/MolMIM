#!/bin/bash -e

#Set up cache folders
unset APPTAINER_BIND
APPTAINER_CACHEDIR=$(mktemp -d)
APPTAINER_TMPDIR=${APPTAINER_CACHEDIR}

#Build container and make readable to everyone 
apptainer build --force molmim.sif molmim.def
chmod 640 molmim.sif

#Should also be available via
# apptainer pull molmim.sif oras://ghcr.io/acsrc-shoc2/molmim/molmim:latest
