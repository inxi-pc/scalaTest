#!/bin/bash

SCALA_ROOT=/usr/local/share/scala/bin
SCALAC=$SCALA_ROOT/scalac
SCALA=$SCALA_ROOT/scala
DEBUG_DIR=./Debug/
RELEASE_DIR=./Release/

pi=0
class=""
while [ $pi -le $# ];do
    case ${!pi} in
        -class)
            shift
            class=${!pi}
    ;;
        --debug)
            shift
            SCALA -classpath DEBUG_DIR $class
    ;;
        --release)
            shift
            SCALA -classpath RELEASE_DIR $class
	;;
    esac
    pi=$(expr $pi + 1)
done
