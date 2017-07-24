#!/bin/sh

cd /root/shotgunEventDaemon
python shotgunEventDaemon.py start

while ps -eaf | grep shotgunEventDaemon.py | grep -v grep; do sleep 10; done
