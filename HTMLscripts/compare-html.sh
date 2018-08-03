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
	if [ ! -f "../ATLzoo/output/$1" ]; then
		echo "<$1> is not a valid file :("
	else
		# Generation can begin
		compare='../compare-tmp.html'
		comparePage='../compare.html'
		:> $compare
		echo "Genrate <"$comparePage"> page ..."

		nbMts=$(tail -n+2 "../ATLzoo/output/"$1 | wc -l)

		#begin head
		#
		echo '<!DOCTYPE html>' >> $compare
		echo '<html lang="en">' >> $compare
		echo '<head>' >> $compare
		echo '<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->' >> $compare
		echo '<meta name="description" content="">' >> $compare
		echo '<meta name="author" content="">' >> $compare
		echo '<link rel="icon" href="img/atlpyta.png">' >> $compare
		echo '<meta charset="utf-8">' >> $compare
		echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">' >> $compare
		echo '<meta name="viewport" content="width=device-width, initial-scale=1">' >> $compare
		echo '<title>ATLpyta - Compare</title>' >> $compare

		echo '<!-- Bootstrap core CSS -->' >> $compare
		echo '<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">' >> $compare
		echo '<script src="bootstrap/js/jquery-3.3.1.min.js"></script>' >> $compare
		echo '<script src="bootstrap/js/bootstrap.min.js"></script>' >> $compare
		
		echo '<script src="css-js/Chart.js"></script>' >> $compare
		echo '<script src="css-js/Chart.min.js"></script>' >> $compare
		echo '<script src="css-js/compare.js"></script>' >> $compare
		echo '<script src="css-js/compare-data.js"></script>' >> $compare

		echo '<!-- Custom styles for this template -->' >> $compare
		echo '<link href="css-js/atlpyta.css" rel="stylesheet">' >> $compare

		echo '</head>' >> $compare

		#begin body
		#
		echo '<body onload="drawOnLoad();">' >> $compare

		#begin menu
		#
		echo '' >> $compare

		echo '   <nav class="navbar navbar-inverse navbar-fixed-top">' >> $compare
		echo '     <div class="container">' >> $compare
		echo '       <div class="navbar-header">' >> $compare
		echo '         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">' >> $compare
		echo '           <span class="sr-only">Toggle navigation</span>' >> $compare
		echo '           <span class="icon-bar"></span>' >> $compare
		echo '           <span class="icon-bar"></span>' >> $compare
		echo '           <span class="icon-bar"></span>' >> $compare
		echo '         </button>' >> $compare
		echo '         <a class="navbar-brand" href="index.html">ATLpyta</a>' >> $compare
		echo '       </div>' >> $compare
		echo '       <div id="navbar" class="collapse navbar-collapse">' >> $compare
		echo '         <ul class="nav navbar-nav">' >> $compare
		echo '           <li><a href="index.html">Home</a></li>' >> $compare
		echo '           <li class="active"><a href="index.html#features">Features</a></li>' >> $compare
		echo '           <li><a href="index.html#resources">Resources</a></li>' >> $compare
		echo '           <li><a href="index.html#team">Team</a></li>' >> $compare
		echo '           <li><a href="index.html#contact">Contact</a></li>' >> $compare
		echo '         </ul>' >> $compare
		echo '       </div><!--/.nav-collapse -->' >> $compare
		echo '     </div>' >> $compare
		echo '   </nav>' >> $compare

		echo '' >> $compare

		echo '<div class="page-header">' >> $compare
		echo '	<div class="jumbotron">' >> $compare
		echo '		<div class="container">' >> $compare
		echo '' >> $compare
		echo '			<div class="row titre">' >> $compare
		echo '   			<div class="col-sm-5"></div>' >> $compare
		echo '        		<div class="col-sm-2">' >> $compare
		echo '        			<img src="img/atlpyta.png" class="center-img" alt="ATLpyta Logo"/>' >> $compare
		echo '    			</div>' >> $compare
		echo '    			<div class="col-sm-5"></div>' >> $compare
		echo '      	</div>' >> $compare
		echo '' >> $compare
		echo ' 		</div>' >> $compare
		echo '	</div>' >> $compare
		echo '</div>' >> $compare
		echo '' >> $compare

echo '<!--  -->' >> $compare
echo '<!--  -->' >> $compare

echo '<div class="container">' >> $compare
echo '' >> $compare

#MTs zone 1
#
#
echo '  <div class="col-sm-3">' >> $compare
echo '    <div class="panel panel-primary">' >> $compare
echo '      <div class="panel-heading">' >> $compare
echo '        <span style="font-size:20px;">Model Transformations</span> ' >> $compare
echo '      </div>' >> $compare
echo '      <div class="panel-body">' >> $compare
echo '' >> $compare

nb=0

echo '<div id="MTs1">' >> $compare

for line in $(tail -n+2 "../ATLzoo/output/"$1 | head -n+52); do

	#echo $numMT

	#Collect info on the MT (name criteria)
	nameMt="$(echo $line | cut -d, -f1)"
	rules="$(echo $line | cut -d, -f3)"
	mrules="$(echo $line | cut -d, -f4)"
	lrules="$(echo $line | cut -d, -f5)"
	helpers="$(echo $line | cut -d, -f6)"
	helperswc="$(echo $line | cut -d, -f7)"
	inhTress="$(echo $line | cut -d, -f8)"
	inhRules="$(echo $line | cut -d, -f9)"

	echo '<div class="row">' >> $compare
	echo '	<label class="checkbox">'$nameMt >> $compare
  	echo '		<input type="checkbox" class="MTCheckBox" id="'$nameMt'" onchange="updateSelectedMts(this);">' >> $compare
  	echo '		<span class="checkmark"></span>' >> $compare
	echo '	</label>' >> $compare
	echo '</div>' >> $compare

	nb=$(($nb+1))

done

echo '</div>' >> $compare

echo '' >> $compare
echo '      </div>' >> $compare
echo '    </div>' >> $compare
echo '  </div>' >> $compare
echo '' >> $compare

#Compare button
#Chart zone
#
echo '<div class="col-sm-6">' >> $compare
echo '    <div class="panel panel-primary">' >> $compare
echo '      <div class="panel-heading">' >> $compare

echo '      	<div class="row">' >> $compare

echo '      	<div class="col-sm-7">' >> $compare
echo '				<span style="font-size:16px;">Selected Model Transformations</span> ' >> $compare
echo '        		<span id="nbMT" class="badge">0</span>' >> $compare
echo '		    	/ ' >> $compare
echo '        		<span id="totalMT" class="badge">'$nbMts'</span>' >> $compare
echo '      	</div>' >> $compare
echo '      	<div class="col-sm-1"></div>' >> $compare
echo '      	<div class="col-sm-4">' >> $compare
echo "				<button type=\"button\" class=\"btn btn-default\" onclick=\"drawCharts();\">Compare</button>" >> $compare
echo "				<button type=\"button\" class=\"btn btn-default\" onclick=\"deselectAll();\"><img src=\"img/mull.png\" style=\"width:15px;\" /></button>" >> $compare
echo '      	</div>' >> $compare

echo '      	</div>' >> $compare

echo '      </div>' >> $compare

echo '      <div class="panel-body" id="chartDiv">' >> $compare
echo '			<p id="compare-p"></p>' >> $compare
echo '      	<canvas id="myChart" width="400" height="400"></canvas>' >> $compare
echo '      </div>' >> $compare
echo '   </div> <!-- panel-->' >> $compare

echo '</div>' >> $compare


#2nd MTs zone
#
echo '<div class="col-sm-3">' >> $compare
echo '	<div class="panel panel-primary">' >> $compare
echo '		<div class="panel-heading">' >> $compare
echo '			<span style="font-size:20px;">Model Transformations</span> ' >> $compare
echo '		</div>' >> $compare
echo '		<div class="panel-body">' >> $compare

nb=0

echo '			<div id="MTs2">' >> $compare

for line in $(tail -n+2 "../ATLzoo/output/"$1 | tail -n+53); do

	#echo $numMT

	#Collect info on the MT (name criteria)
	nameMt="$(echo $line | cut -d, -f1)"
	rules="$(echo $line | cut -d, -f3)"
	mrules="$(echo $line | cut -d, -f4)"
	lrules="$(echo $line | cut -d, -f5)"
	helpers="$(echo $line | cut -d, -f6)"
	helperswc="$(echo $line | cut -d, -f7)"
	inhTress="$(echo $line | cut -d, -f8)"
	inhRules="$(echo $line | cut -d, -f9)"

	echo '<div class="row">' >> $compare
	echo '	<label class="checkbox">'$nameMt >> $compare
  	echo '		<input type="checkbox" class="MTCheckBox" id="'$nameMt'" onchange="updateSelectedMts(this);">' >> $compare
  	echo '		<span class="checkmark"></span>' >> $compare
	echo '	</label>' >> $compare
	echo '</div>' >> $compare

	nb=$(($nb+1))

done

echo '			</div>' >> $compare
echo '		</div>' >> $compare
echo '	</div><!--panel MTs 2-->' >> $compare
echo '</div><!--col-sm-3 MTs 2-->' >> $compare

echo '</div><!-- container div -->' >> $compare


		#Close body tag
		#close html tag
		echo '</body>' >> $compare
		echo '</html>' >> $compare
		mv $compare $comparePage
		echo "... OK"
	fi
fi 