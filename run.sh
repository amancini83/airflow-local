#!/bin/bash

# Check if running in Cygwin, Mac or Linux
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) machine=Linux ;;
Darwin*) machine=Mac ;;
CYGWIN*) machine=Cygwin ;;
MINGW*) machine=MinGw ;;
*) machine="UNKNOWN:${unameOut}" ;;
esac

pid[0]=$!
docker-compose up &
pid[1]=$!

# Kill the process in the background with ctrl + c
trap "kill ${pid[0]} & docker-compose down; exit 1" INT
wait