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

# Find the minimum maximum for each criterion
minRules=200
minMatchedRules=200
minLazyRules=200
minHelpers=200
minHelpersWContext=200
minRulesInhTrees=200
minInhRules=200

maxRules=0
maxMatchedRules=0
maxLazyRules=0
maxHelpers=0
maxHelpersWContext=0
maxRulesInhTrees=0
maxInhRules=0


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

		if [ $Rules -gt $maxRules ]; then
			maxRules=$Rules
		fi

		if [ $Rules -lt $minRules ]; then
			minRules=$Rules
		fi

		if [ $MatchedRules -gt $maxMatchedRules ]; then
			maxMatchedRules=$MatchedRules
		fi

		if [ $MatchedRules -lt $minMatchedRules ]; then
			minMatchedRules=$MatchedRules
		fi

		if [ $LazyRules -gt $maxLazyRules ]; then
			maxLazyRules=$LazyRules
		fi

		if [ $LazyRules -lt $minLazyRules ]; then
			minLazyRules=$LazyRules
		fi

		if [ $Helpers -gt $maxHelpers ]; then
			maxHelpers=$Helpers
		fi

		if [ $Helpers -lt $minHelpers ]; then
			minHelpers=$Helpers
		fi

		if [ $HelpersWContext -gt $maxHelpersWContext ]; then
			maxHelpersWContext=$HelpersWContext
		fi

		if [ $HelpersWContext -lt $minHelpersWContext ]; then
			minHelpersWContext=$HelpersWContext
		fi

		if [ $RulesInhTrees -gt $maxRulesInhTrees ]; then
			maxRulesInhTrees=$RulesInhTrees
		fi

		if [ $RulesInhTrees -lt $minRulesInhTrees ]; then
			minRulesInhTrees=$RulesInhTrees
		fi

		if [ $InhRules -gt $maxInhRules ]; then
			maxInhRules=$InhRules
		fi

		if [ $InhRules -lt $minInhRules ]; then
			minInhRules=$InhRules
		fi

	done

	#cp "compare" "./output/"$transfoName
		rm "compare"

		mkdir -p $folder"/../kiviatCharts"

		echo "Results are in: "$output

		./sort-MTs.sh $output


	#Create a file gathering all the maximum and minimum values
	# for comparison criteria

	criteriaMinMax=$output"/criteriaMinMax"
	:> $criteriaMinMax
	echo "Rules,$minRules,$maxRules" >> $criteriaMinMax
	echo "Matched rules,$minMatchedRules,$maxMatchedRules" >> $criteriaMinMax
	echo "Lazy rules,$minLazyRules,$maxLazyRules" >> $criteriaMinMax 	
	echo "Helpers,$minHelpers,$maxHelpers" >> $criteriaMinMax
	echo "Helpers with context,$minHelpersWContext,$maxHelpersWContext" >> $criteriaMinMax
	echo "Rule Inheritance Trees,$minRulesInhTrees,$maxRulesInhTrees" >> $criteriaMinMax
	echo "Inheriting rules,$minInhRules,$maxInhRules" >> $criteriaMinMax

	echo "<criteriaMinMax> file was created"

fi;