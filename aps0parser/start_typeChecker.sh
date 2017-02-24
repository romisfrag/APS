#!/bin/bash

#1 arg is the file to typeCheck
swipl -s src/regles.pl -g main -- $1
