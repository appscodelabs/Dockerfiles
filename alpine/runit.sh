#!/bin/bash
export > /etc/envvars

echo "Starting runit..."
exec /usr/sbin/runsvdir-start
