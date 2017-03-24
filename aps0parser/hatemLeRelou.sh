#!/bin/bash

#1 arg is the file to typeCheck
./exec $1 $2
x=`swipl -s src/regles.pl -g main -- $2`
echo $x
if [ "$x" == "true" ];
then echo 
fi

#x=`swipl -s src/regles.pl -g main -- $1`
#if [$x=="true"]; then echo `./interpreter 

