#!/bin/sh

if [ $(pactl get-source-mute 0 | wc -c) -eq 9 ]
then
  echo " %{F#42A5F5}"
else
  echo "%{F#EC7875} "
fi
