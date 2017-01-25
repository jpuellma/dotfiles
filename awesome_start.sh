#!/bin/bash

# /usr/share/xsessions/awesome.desktop has been modified to run this instead
# of the default awesome exec.
# This file should be executable.

browser='/usr/bin/vivaldi-snapshot'
terminal='/usr/bin/gnome-terminal'

${browser} &
${terminal} &
${terminal} -e htop &
/usr/bin/synergyc blacktop
exec /usr/bin/awesome
