#!/bin/bash

if ! command -v unminimize 2>&1 >/dev/null
then
    apt-get update -y
    DEBIAN_FRONTEND=noninteractive apt-get install -y unminimize
fi

yes | unminimize