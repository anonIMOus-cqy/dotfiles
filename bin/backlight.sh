#!/bin/bash

[[ "$1" = 'fast' ]] && OPTION='-steps 1 -time 0 '
case ${2} in
    up)     OPTION+="-inc" ;;
    down)   OPTION+="-dec" ;;
esac

xbacklight $OPTION $3
pkill -RTMIN+11 i3block


