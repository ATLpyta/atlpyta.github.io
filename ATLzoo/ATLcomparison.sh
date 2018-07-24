#!/bin/bash

## if parameter 1= --help, print help 
## else collect metrics from transformations folder

if [ "$1" = "--help" ]; then

echo "compareATL"
echo ""
echo "	This tool collects metrics about the complexity of ATL transformations."
echo "	The final goal is to compare them and to select a set of diverse ones."
echo ""
echo ""
echo "	Required"
echo ""
echo "		Please make sure that these different software/libs are available on your computer:"
echo "			xmllint"
echo "			R"
echo "			radarchart package"



else

folder=$1"/"
mkdir -p output

echo "...I'm trying to collect ALT metrics in folder: ./transformations/"	

metricFile=$(ls $folder)

echo ""
echo "Rules" > "output/criteria"
echo "MatchedRules" >> "output/criteria"
echo "LazyRules" >> "output/criteria"
echo "Helpers" >> "output/criteria"
echo "HelpersWContext" >> "output/criteria"
echo "RulesInhTrees" >> "output/criteria"
echo "InhRules" >> "output/criteria"

:> "output/MT"
:> "output/MTs"
:> "output/all-MT"
:> "output/all-MT-full"


echo "MT,Rules,MatchedRules,LazyRules,Helpers,HelpersWContext,RulesInhTrees,InhRules" > "output/all-MT-full"

	for file in $metricFile; do

		echo "	"$file
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

		echo "      fileName="$mtName
		echo "		name="$transfoName
		echo "		Rules="$Rules
		echo "		MatchedRules="$MatchedRules
		echo "		LazyRules="$LazyRules
		echo "		Helpers="$Helpers
		echo "		HelpersWContext="$HelpersWContext
		echo "		RulesInhTrees="$RulesInhTrees
		echo "		InhRules="$InhRules
		echo ""

		echo $transfoName >> "output/MT"
		echo $mtName >> "output/MTs"
        echo $Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules > "compare"
		echo $Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules >> "output/all-MT"
		echo $transfoName","$Rules","$MatchedRules","$LazyRules","$Helpers","$HelpersWContext","$RulesInhTrees","$InhRules >> "output/all-MT-full"

		#cp "compare" "./output/"$transfoName
		rm "compare"

		mkdir -p "kiviatCharts"

	done

fi;