#!/bin/sh

cd /root/shotgunEventDaemon
PYTHONPATH=/root/repositories/python-api python shotgunEventDaemon.py start

while ps -eaf | grep shotgunEventDaemon.py | grep -v grep; do sleep 10; done
