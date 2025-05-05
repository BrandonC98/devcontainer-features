#!/bin/bash
apt-get update -y

if ! command -v unminimize &> /dev/null
then
    DEBIAN_FRONTEND=noninteractive apt-get install -y unminimize
fi

DEBIAN_FRONTEND=noninteractive apt-get install -y man-db

if [ "$RUNUNMINIMIZE" = "true" ]
then
    yes | unminimize
fi