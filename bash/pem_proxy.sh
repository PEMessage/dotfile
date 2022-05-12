#!/bin/bash
echo "PEM Enable Proxy"
git config --global http.proxy 'http://127.0.0.1:7890'
git config --global https.proxy 'https://127.0.0.1:7890'

http_proxy="127.0.0.1:7890"
https_proxy="127.0.0.1:7890"

