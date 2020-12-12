#!/bin/bash

# Fail on errors
set -eu

# Stop MEMCACHED
service memcached stop

# Stop Authentic
service authentic2-multitenant stop

# Pause 2 seconds
sleep 2