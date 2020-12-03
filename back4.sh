#!/bin/bash

dir=/tmp/back4
speed=$1
gif_path=$2
prog=$3

[[ "$gif_path" == "" ]] && { gif_path=$speed ; speed=${gif_path##*-} ; }

hash=`md5sum $gif_path | cut -f1 -d" "`

[[ ! -d $dir ]] && mkdir $dir

[[ ! -d $dir/$hash ]] && { mkdir $dir/$hash ; echo "spliting .." ; convert -coalesce $gif_path $dir/$hash/$hash.png ; echo ok ; }

while : ; do for i in ` ls $dir/$hash -v ` ; do $prog $dir/$hash/$i ; sleep $speed ; done ; done
