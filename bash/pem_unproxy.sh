#!/bin/bash
echo "PEM Disable Proxy"
git config --global --unset http.proxy 
git config --global --unset https.proxy 


unset http_proxy
unset https_proxy


