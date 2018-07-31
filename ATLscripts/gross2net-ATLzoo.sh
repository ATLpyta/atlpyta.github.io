#!/bin/bash

# This script takes the raw ATL zoo (https://github.com/ATLpyta/atlpyta.github.io/blob/master/raw-ATLzoo.zip)
# and collects its important information
# 
# PARAMETERS
#	$1: folder containing the raw ATL zoo
#
# OUTPUT
#	The results are put in <ATLzoo> folder
#   Data are gathered in 3 sub-folders
#		ATLmetrics: contains all the .metrics files
#		sources: contains archive file for each Model transformation
#		output: contains some csv files summarising the data
#

if [ "$1" != "" ]; then
	if [ -d $1 ]; then
		dir="ATLzoo"
		mkdir -p "$dir"

		metricsDir="$dir/ATLmetrics"
		mkdir -p $metricsDir

		mkdir -p "$dir/output"
		atlzoofile="$dir/output/ATLzoo.csv"

		sourceDir=$dir"/sources"
		mkdir -p $sourceDir

		#listMT=$(ls *.atl)
		listMT=$(ls $1 | grep -e ".atl")

		echo "MT,source,MMs" > $atlzoofile

		for mt in $listMT; do

			itsMM=""
			mtName="${mt%%.*}"
			mtPath="$1/${mt%%.*}"

			
		    mtDir="$dir/$mtName"
			
			if [ -f "$mtPath.atl" -a -f "$mtPath.asm" -a -f "$mtPath.metrics" ]; then
				
				mkdir -p "$mtDir"
				cp $mtPath".atl" $mtDir
				cp $mtPath".asm" $mtDir
				cp $mtPath".metrics" $mtDir

				#cp .metrics file in metricsDir
				cp $mtPath".metrics" $metricsDir

				#Find meta-models (method 1: cut MM2MM)
				mm1="${mtName%%2*}"
				mm2=${mtName##*2}

				#Copy 1st meta-model if exists
				if [ -f "$1/$mm1.ecore" ]; then
					cp "$1/$mm1.ecore" $mtDir
					itsMM=$(echo $itsMM" "$mm1".ecore")					
				fi
				
				#Copy 2nd meta-model if exists
				if [ -f "$1/"$mm2".ecore" ]; then 	
					itsMM=$(echo $itsMM" "$mm2".ecore")
					cp "$1/$mm2.ecore" $mtDir

				fi

				#Find meta-models (method 2: in atl files)
				if [ ! -f "$1/$mm1.ecore" -a ! -f "$1/$mm2.ecore" ]; then

					metamodels=$(grep -e ".ecore" $1/$mt)
					if [ "$metamodels" = "" ]; then
						itsMM=""
					else
						for mm in $metamodels; do

							mmName=${mm##*/}
							if [ -f $mmName ]; then 
								itsMM=$(echo $itsMM" "$mmName)
								cp "$1/$mmName" $mtDir
							fi

						done
					fi
				fi

				echo $mtName
				echo "    mms: "$itsMM

				#Create Achives
				mtZip=$(echo $mtDir".tar.gz")
				tar -cvf $mtZip $mtDir > "/dev/null"

				mv $mtZip $sourceDir

				#Create csv file for gathering all these data (then generate HTML)
				echo $mtName","$mtZip","$itsMM >> $atlzoofile

				rm -r $mtDir

			fi
		done
	else
		echo "Please give an existing folder"
	fi
else
	echo "Please give a folder"
fi