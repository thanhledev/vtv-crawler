#!/bin/bash

export TERM=xterm # docker run -t hack
while true; do
    python3 main.py
    sleep 60
done