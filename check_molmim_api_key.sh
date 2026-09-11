#!/bin/bash

#Credentials for NGC
NGC_API_KEY=$(cat ~/.ngc/ngc_api_key.molmim 2>/dev/null)
if [[ -n "$NGC_API_KEY" ]]; then
  # lock down permissions in case this file predates this check (e.g. created world/group-readable)
  chmod 700 ~/.ngc
  chmod 600 ~/.ngc/ngc_api_key.molmim
  echo "NGC API Key for molmim found at ~/.ngc/ngc_api_key.molmim"
  echo "Testing"
  RET_CODE=$(curl -s -o /dev/null -w "%{http_code}\n"     "https://api.ngc.nvidia.com/v2/orgs?page-size=500"     -H "Authorization: Bearer $NGC_API_KEY")
  if [ "$RET_CODE" -eq 200 ]; then
    echo "API key is valid"
  elif [ "$RET_CODE" -eq 401 ]; then
    echo "API key is invalid or expired"
    echo "delete ~/.ngc/ngc_api_key.molmim and rerun check_molmim_api_key.sh"
  else
    echo "Unexpected response code: $RET_CODE"
    echo "delete ~/.ngc/ngc_api_key.molmim and rerun check_molmim_api_key.sh"
  fi
else
  echo "NGC API Key for molmim not found.  Create one at:"
  echo "https://build.nvidia.com/nvidia/molmim-generate"
  echo "and paste it into this window"
  read -r NGC_API_KEY
  mkdir -p ~/.ngc/
  chmod 700 ~/.ngc
  echo "$NGC_API_KEY" > ~/.ngc/ngc_api_key.molmim
  chmod 600 ~/.ngc/ngc_api_key.molmim
  echo "Key saved at ~/.ngc/ngc_api_key.molmim.  Rereun check_molmim_api_key.sh to confirm"
fi
