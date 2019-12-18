#!/bin/bash

# Use this script to start the aardvark docker container

export AARDVARK_DB_URI='postgresql://postgres:aardvark123@aardvark-database-dev.caa3rtcmyn02.us-east-1.rds.amazonaws.com:5432'
export AARDVARK_ROLE='RepokidRole'
export AARDVARK_ACCOUNTS='928712562848'

# Build containers
make clean-all
make aardvark-all

# Run the collector
docker run -v aardvark-data:/usr/share/aardvark-data --rm aardvark-collector
docker run -v aardvark-data:/usr/share/aardvark-data -p 0.0.0.0:5000:5000 aardvark-apiserver
