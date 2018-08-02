#!/bin/bash

# This script generates the html page that compares model transformations using radar charts
# 
# PARAMETERS
#	$1: the file containing the data on model transformations
#
#

if [ "$1" = "" ]; then
	echo "Please give data file :("

else
	if [ ! -f "$1" ]; then
		echo "<$1> is not a valid file :("

	else
		# Generation can begin
		compare = '../compare-tmp.html'
		comparePage = '../compare.html'
		echo "Genrate <"$comparePage"> page ..."



		echo "... OK"
	fi
fi 