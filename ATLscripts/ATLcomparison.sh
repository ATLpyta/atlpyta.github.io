#!/bin/bash

## if parameter 1= --help, print help 
## else collect metrics from transformations folder

if [ "$1" = "--help" -o "$1" = "" ]; then

echo "ATL Compare"
echo ""
echo "	This tool collects metrics about the complexity of ATL transformations."
echo "	The final goal is to compare them and to select a set of diverse ones."
echo ""
echo "PARAMETERS"
echo "	#1: folder containing .metrics files"
echo ""
echo ""
echo "OUTPUT"
echo ""
echo "	The results are saved in $1/outputs"
echo ""
echo "REQUIRED"
echo ""
echo "	Please make sure that these different software/libs"
echo "	are available on your computer:"
echo ""
echo "		xmllint"
echo "		R"
echo "		radarchart package for R"

else

folder=$1"/"
output=$folder"../output"
mkdir -p $output

criteria=$output"/criteria"
MT=$output"/MT"
MTs=$output"/MTs"
allMT=$output"/all-MT"
allMTfull=$output"/all-MT-full"


echo "...I'm trying to collect ALT metrics in folder: "$1	

metricFile=$(ls $folder)

echo ""
echo "Rules" > $criteria
echo "MatchedRules" >> $criteria
echo "LazyRules" >> $criteria
echo "Helpers" >> $criteria
echo "HelpersWContext" >> $criteria
echo "RulesInhTrees" >> $criteria
echo "InhRules" >> $criteria

:> $MT
:> $MTs
:> $allMT
:> $allMTfull


echo "MT,Module,Rules,MatchedRules,LazyRules,Helpers,HelpersWContext,RulesInhTrees,InhRules" > $allMTfull

	for file in $metricFile; do

		transfoName=$(xmllint --xpath "string(//@TrafoName)" $folder$file)
		Rules=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Transformation Rules"]/@Value)' $folder$file)
		MatchedRules=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Matched Rules (Excluding Lazy Matched Rules)"]/@Value)' $folder$file)
		LazyRules=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Lazy Matched Rules (Including Unique)"]/@Value)' $folder$file)
		Helpers=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Helpers"]/@Value)' $folder$file)
		HelpersWContext=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Helpers with Context"]/@Value)' $folder$file)
		RulesInhTrees=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Rule Inheritance Trees"]/@Value)' $folder$file)
		InhRules=$(xmllint --xpath 'string(//SimpleMetrics[@Metric="Number of Inheriting Transformation Rules"]/@Value)' $folder$file)
		
		if [ "$Rules" = "" ]; then
			Rules="0"
		fi;

		if [ "$MatchedRules" = "" ]; then
			MatchedRules="0"
		fi;

		if [ "$LazyRules" = "" ]; then
			LazyRules="0"
		fi;

		if [ "$Helpers" = "" ]; then
			Helpers="0"
		fi;

		if [ "$HelpersWContext" = "" ]; then
			HelpersWContext="0"
		fi;

		if [ "$RulesInhTrees" = "" ]; then
			RulesInhTrees="0"
		fi;

		if [ "$InhRules" = "" ]; then
			InhRules="0"
		fi;	

		mtName="${file%%.*}"
		echo "	"$mtName

		# echo "      fileName="$mtName
		# echo "		name="$transfoName
		# echo "		Rules="$Rules
		# echo "		MatchedRules="$MatchedRules
		# echo "		LazyRules="$LazyRules
		# echo "		Helpers="$Helpers
		# echo "		HelpersWContext="$HelpersWContext
		# echo "		RulesInhTrees="$RulesInhTrees
		# echo "		InhRules="$InhRules
		# echo ""
		echo $transfoName >> $MT
		echo $mtName >> $MTs
        echo $Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules > "compare"
		echo $Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules >> $allMT
		echo $mtName","$transfoName","$Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules >> $allMTfull

	done

	#cp "compare" "./output/"$transfoName
		rm "compare"

		mkdir -p $folder"/../kiviatCharts"

		echo "Results are in: "$output

fi;