#!/bin/bash


## This script sorts the <all-MT-full> file in order to create 
#
## Three different versions: 
#		default sorted by Transformation name
#		all-MT-full-rules >> sorted by number of rules
#		all-MT-full-helpers >> sorted by number of helpers
#
## PARAMETERS
#
#	$1 folder where to find <all-MT-full> file and output the other files 

echo "Sorting <all-MT-full> file..."

if [ ! "$1" = "" ]; then

:> $1/all-MT-full-rules
head -n1 $1/all-MT-full > $1/all-MT-full-rules 
tail -n+2 $1/all-MT-full | sort -t, -n -k3 >> $1/all-MT-full-rules
echo "<all-MT-full-rules> file was produced"

:> $1/all-MT-full-helpers
head -n1 $1/all-MT-full > $1/all-MT-full-helpers 
tail -n+2 $1/all-MT-full | sort -t, -n -k6 >> $1/all-MT-full-helpers
echo "<all-MT-full-helpers> file was produced"

fi