#!/bin/bash
apt-get update -y

if ! command -v unminimize 2>&1 >/dev/null
then
    DEBIAN_FRONTEND=noninteractive apt-get install -y unminimize man-db
fi

DEBIAN_FRONTEND=noninteractive apt-get install -y man-db

yes | unminimize