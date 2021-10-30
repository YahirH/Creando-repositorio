#!/usr/bin/env bash

curl ifconfig.me

nmap 189.213.159.2 > resultado.txt
nmap facebook.com >> resultado.txt

base64 resultado.txt > NmapResults
