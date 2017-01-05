#!/bin/bash

# /usr/share/xsessions/awesome.desktop has been modified to run this instead
# of the default awesome exec.
# This file should be executable.

terminal='/usr/bin/gnome-terminal'

${terminal} -e htop &
${terminal} &

/usr/bin/google-chrome &

/usr/bin/synergyc blacktop
exec /usr/bin/awesome

