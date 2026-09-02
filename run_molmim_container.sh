#!/bin/bash -e

#Setup nvc cache
export CACHEDIR=/nesi/nobackup/uoa04517/cache
export LOCAL_NVS_CACHE=$CACHEDIR

#Setup apptainer cache
export APPTAINER_CACHEDIR="/dev/shm/apptainer-cache"
export APPTAINER_TMPDIR=${APPTAINER_CACHEDIR}

./check_molmim_api_key.sh
NGC_API_KEY=$(cat ~/.ngc/ngc_api_key.molmim)

#Find an available port for the api
export PORT=8000
while netstat -tuln | grep -q ":$PORT "; do
  echo "Port $PORT is in use, trying next..."
  ((PORT++))
done
echo Port $PORT available

apptainer run \
--env NVIDIA_VISIBLE_DEVICES=0 \
--env NGC_API_KEY=$NGC_API_KEY \
--env NIM_HTTP_API_PORT=$PORT \
--bind $LOCAL_NVS_CACHE:/home/nvs/.cache \
--bind $CACHEDIR:/tmp \
--writable-tmpfs \
--nv \
molmim.sif /usr/local/bin/start_server
#/opt/nesi/containers/MolMIM/molmim-1.0.0.aimg /usr/local/bin/start_server
