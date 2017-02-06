#!/bin/bash

SCALA_ROOT=/usr/local/share/scala/bin
SCALAC=$SCALA_ROOT/scalac
SCALA=$SCALA_ROOT/scala

if [ ! -d "Debug" ]; then
    mkdir Debug
fi

if [ ! -d "Release" ]; then
    mkdir Release
fi

pi=0
file=""
while [ $pi -le $# ];do
    case ${!pi} in
        -file)
            shift
            file=${!pi}
    ;;
        --debug)
            shift
            SCALAC -d Debug/ $file
    ;;
        --release)
            shift
            SCALAC -d Release/ $file
	;;
    esac
    pi=$(expr $pi + 1)
done
