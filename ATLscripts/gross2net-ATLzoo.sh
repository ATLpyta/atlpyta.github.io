#!/bin/bash

dir="ATLzoo"
mkdir -p "$dir"

metricsDir="$dir/ATLmetrics"
mkdir -p $metricsDir

mkdir -p "$dir/output"
atlzoofile="$dir/output/ATLzoo.csv"

sourceDir=$dir"/sources"
mkdir -p $sourceDir

listMT=$(ls *.atl)
echo "MT,source,MMs" > $atlzoofile

for mt in $listMT; do

	itsMM=""
	mtName="${mt%%.*}"

    mtDir="$dir/$mtName"
	
	if [ -f $mtName".atl" -a -f $mtName".asm" -a -f $mtName".metrics" ]; then
		
		mkdir -p "$mtDir"
		cp $mtName".atl" $mtDir
		cp $mtName".asm" $mtDir
		cp $mtName".metrics" $mtDir

		#cp .metrics file in metricsDir
		cp $mtName".metrics" $metricsDir

		#Find meta-models (method 1: cut MM2MM)
		mm1="${mtName%%2*}"
		mm2=${mtName##*2}

		#Copy 1st meta-model if exists
		if [ -f $mm1".ecore" ]; then
			cp $mm1".ecore" $mtDir
			itsMM=$(echo $itsMM" "$mm1".ecore")
			
		fi
		
		#Copy 2nd meta-model if exists
		if [ -f $mm2".ecore" ]; then 	
			itsMM=$(echo $itsMM" "$mm2".ecore")
			cp $mm2".ecore" $mtDir

		fi

		#Find meta-models (method 2: in atl files)
		if [ ! -f $mm1".ecore" -a ! -f $mm2".ecore" ]; then

			metamodels=$(grep -e ".ecore" $mt)
			if [ "$metamodels" = "" ]; then
				itsMM=""
			else
				for mm in $metamodels; do

					mmName=${mm##*/}
					if [ -f $mmName ]; then 
						itsMM=$(echo $itsMM" "$mmName)
						cp $mmName $mtDir
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