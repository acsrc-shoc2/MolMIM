#!/bin/bash

#Credentials for NGC
NGC_API_KEY=$(cat ~/.ngc/ngc_api_key.molmim)
if [[ -n "$NGC_API_KEY" ]]; then
    echo "NGC API Key for molmim found at ~/.ngc/ngc_api_key.molmim"
    echo "Testing"
    RET_CODE=$(curl -s -o /dev/null -w "%{http_code}\n"     "https://api.ngc.nvidia.com/v2/orgs?page-size=500"     -H "Authorization: Bearer $NGC_API_KEY")
    if [ "$RET_CODE" -eq 200 ]; then
      echo "API key is valid"
    elif [ "$RET_CODE" -eq 401 ]; then
      echo "API key is invalid or expired"
      echo "delete ~/.ngc/ngc_api_key.molmim and try again"
    else
      echo "Unexpected response code: $RET_CODE"
      echo "delete ~/.ngc/ngc_api_key.molmim and try again"
  fi
else
    echo "NGC API Key for molmim not found.  Create one at:"
    echo "https://build.nvidia.com/nvidia/molmim-generate"
    echo "and paste it into this window"
    read -r NGC_API_KEY
    mkdir -p ~/.ngc/
    echo $NGC_API_KEY > ~/.ngc/ngc_api_key.molmim
    echo "Key saved.  Rereun script to check"
fi
