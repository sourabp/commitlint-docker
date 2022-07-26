#!/usr/bin/env sh

if [ -z "$1" ]
  then
    echo "No argument supplied. Pass the commit message to be evaluated as an argument"
fi

echo "$@" | commitlint