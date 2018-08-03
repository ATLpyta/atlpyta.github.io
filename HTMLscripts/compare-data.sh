#!/bin/bash

# This script generates the javascript page that contains data for comparing
#   model transformations using radar charts
# 
# PARAMETERS
#	$1: the file containing the data on model transformations
#
#

if [ "$1" = "" ]; then
	echo "Please give data file :("

else
	if [ ! -f "../ATLzoo/output/$1" ]; then
		echo "<$1> is not a valid file :("
	else
		compare='../css-js/compare-data-tmp.js'
		comparePage='../css-js/compare-data.js'
		:> $compare
		echo "Genrate <"$comparePage"> page ..."

		echo 'var chartData= new Object();' >> $compare

		echo '' >> $compare

		#Criteria
		echo 'chartData.labels= ["Rules","Matched rules","Lazy rules","Helpers","Helpers w context","rules inh tree","Inh. rules"];' >> $compare

		#Colors
		echo 'var bgColors= ["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(25,182,152,0.2)","rgba(241,196,15,0.2)","rgba(211,84,0,0.2)","rgba(52,73,94,0.2)","rgba(127,140,141,0.2)","rgba(192,57,43,0.2)","rgba(39,174,96,0.2)","rgba(176,51,255,0.2)"];' >> $compare
		echo 'var fgColors= ["rgba(255, 99, 132, 1.0)","rgba(54, 162, 235, 1.0)","rgba(25,182,152,1.0)","rgba(241,196,15,1.0)","rgba(211,84,0,1.0)","rgba(52,73,94,1.0)","rgba(127,140,141,1.0)","rgba(192,57,43,1.0)","rgba(39,174,96,1.0)","rgba(176,51,255,1.0)"];' >> $compare


		#tmp vars
		echo 'var x;' >> $compare
		echo 'var mt;' >> $compare

		#datasest vars
		echo '' >> $compare
		echo 'chartData.datasets= [];' >> $compare
		echo '' >> $compare

		# echo '	x = Math.floor((Math.random() * (bgColors.length)) + 0);' >> $compare
		# echo '	mt= {"label":"Azerty","data":[1,2,3,4,5,6,7],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};' >> $compare
		# echo '	chartData.datasets.push(mt);' >> $compare
		# echo '' >> $compare


		nb=0

		#Data for All MTs
		for line in $(tail -n+2 "../ATLzoo/output/"$1); do

			#Collect info on the MT (name criteria)
			nameMt="$(echo $line | cut -d, -f1)"
			rules="$(echo $line | cut -d, -f3)"
			mrules="$(echo $line | cut -d, -f4)"
			lrules="$(echo $line | cut -d, -f5)"
			helpers="$(echo $line | cut -d, -f6)"
			helperswc="$(echo $line | cut -d, -f7)"
			inhTress="$(echo $line | cut -d, -f8)"
			inhRules="$(echo $line | cut -d, -f9)"

			x=$(($nb % 10))
			data="[$rules,$mrules,$lrules,$helpers,$helperswc,$inhTress,$inhRules]"

			echo 'x='$x >> $compare
			echo 'mt= {"label":"'$nameMt'","data":'$data',"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};' >> $compare		
			echo 'chartData.datasets.push(mt);' >> $compare
			echo '' >> $compare

			nb=$(($nb+1))

		done

		mv $compare $comparePage
		echo "...OK"
	fi
fi