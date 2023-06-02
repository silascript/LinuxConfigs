#!/bin/bash
function usage() {
cat << HELP

dockertags  --  list all tags for a Docker image on a remote registry.

EXAMPLE: 
    - list all tags for ubuntu:
       dockertags ubuntu

    - list all php tags containing apache:
       dockertags php apache

HELP
}



if [ $# -lt 1 ]; then
    usage
    exit
fi

image="$1"
tags=`curl http://hub-mirror.c.163.com/v2/library/${image}/tags/list | sed -e 's/.*\[//g' -e 's/"//g' -e 's/\]\}$//g' -e 's/,/\n/g'`

if [ -n "$2" ]; then
    tags=` echo "${tags}" | grep "$2" `
fi
echo "${tags}"
