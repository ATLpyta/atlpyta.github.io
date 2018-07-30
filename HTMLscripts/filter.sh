#!/bin/bash

######
#This script creates .html pages for exploration of MTs with different sorting.
#
#PARAMETERS
#	$1 csv file to use e.g. all-MT-full (located in ../ATLzoo/output/)
#
#HOW IT WORKS
#
#
#
#

## Begin page generation
#


filter='../filter-tmp.html'
filterPage='../filter.html'

echo "Genrate <"$filterPage"> page..."

numMT=1
:> $filter

#begin head
#
echo '<!DOCTYPE html>' >> $filter
echo '<html lang="en">' >> $filter
echo '<head>' >> $filter
echo '<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->' >> $filter
echo '<meta name="description" content="">' >> $filter
echo '<meta name="author" content="">' >> $filter
echo '<link rel="icon" href="img/atlpyta.png">' >> $filter
echo '<meta charset="utf-8">' >> $filter
echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">' >> $filter
echo '<meta name="viewport" content="width=device-width, initial-scale=1">' >> $filter
echo '<title>ATLpyta - Filter</title>' >> $filter
echo '<!-- Bootstrap core CSS -->' >> $filter
echo '<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">' >> $filter
echo '<script src="bootstrap/js/jquery-3.3.1.min.js"></script>' >> $filter
echo '<script src="bootstrap/js/bootstrap.min.js"></script>' >> $filter
echo '<!-- Custom styles for this template -->' >> $filter
echo '<link href="atlpyta.css" rel="stylesheet">' >> $filter
echo '<link href="css-js/slider.css" rel="stylesheet">' >> $filter
echo '<script src="css-js/slider.js"></script>' >> $filter
echo '<script src="css-js/filter.js"></script>' >> $filter
echo '</head>' >> $filter

#begin body
#
echo '<body>' >> $filter

#begin menu
#
echo '' >> $filter

echo '   <nav class="navbar navbar-inverse navbar-fixed-top">' >> $filter
echo '     <div class="container">' >> $filter
echo '       <div class="navbar-header">' >> $filter
echo '         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">' >> $filter
echo '           <span class="sr-only">Toggle navigation</span>' >> $filter
echo '           <span class="icon-bar"></span>' >> $filter
echo '           <span class="icon-bar"></span>' >> $filter
echo '           <span class="icon-bar"></span>' >> $filter
echo '         </button>' >> $filter
echo '         <a class="navbar-brand" href="index.html">ATLpyta</a>' >> $filter
echo '       </div>' >> $filter
echo '       <div id="navbar" class="collapse navbar-collapse">' >> $filter
echo '         <ul class="nav navbar-nav">' >> $filter
echo '           <li class="active"><a href="index.html">Home</a></li>' >> $filter
echo '           <li><a href="index.html#about">About</a></li>' >> $filter
echo '           <li><a href="index.html#features">Features</a></li>' >> $filter
echo '           <li><a href="index.html#resources">Resources</a></li>' >> $filter
echo '           <li><a href="index.html#team">Team</a></li>' >> $filter
echo '           <li><a href="index.html#contact">Contact</a></li>' >> $filter
echo '         </ul>' >> $filter
echo '       </div><!--/.nav-collapse -->' >> $filter
echo '     </div>' >> $filter
echo '   </nav>' >> $filter

echo '' >> $filter

echo '<div class="page-header">' >> $filter
echo '	<div class="jumbotron">' >> $filter
echo '		<div class="container">' >> $filter
echo '' >> $filter
echo '			<div class="row titre">' >> $filter
echo '   			<div class="col-sm-5"></div>' >> $filter
echo '        		<div class="col-sm-2">' >> $filter
echo '        			<img src="img/atlpyta.png" class="center-img" alt="ATLpyta Logo"/>' >> $filter
echo '    			</div>' >> $filter
echo '    			<div class="col-sm-5"></div>' >> $filter
echo '      	</div>' >> $filter
echo '' >> $filter
echo ' 		</div>' >> $filter
echo '	</div>' >> $filter
echo '</div>' >> $filter


#begin content
#

#begin All MT print
#
#Create the range sliders for criteria

echo '<div class="container">' >> $filter

echo '<br />' >> $filter

echo '<div id="criteria" class="panel panel-default">' >> $filter
echo '  <div class="panel-heading"><h1>Filtering criteria</h1></div>' >> $filter
echo '  <div class="panel-body">' >> $filter
echo '    <div class="row">' >> $filter


cat "../ATLzoo/output/criteriaMinMax" | while read criterion 
do

	criterionId=$(echo "$criterion" | cut -d, -f1)
	criterionName="$(echo $criterion | cut -d, -f2)"
	criterionMin=$(echo "$criterion" | cut -d, -f3)
	criterionMax=$(echo "$criterion" | cut -d, -f4)

#	echo "$criterionId,$criterionName,$criterionMin,$criterionMax"
	
echo "     <div class=\"col-sm-4\">" >> $filter
echo "       <div id=\"$criterionId-slider\" class=\"slider-container\">" >> $filter
echo "       	$criterionName" >> $filter
echo "       	<span class=\"min badge badge-secondary\">$criterionMin</span>" >> $filter
echo "       	<input value=\"$criterionMin\" min=\"$criterionMin\" max=\"$criterionMax\" step=\"1\" type=\"range\" oninput=\"updateLabels('$criterionId-slider')\" >" >> $filter
echo "       	<input value=\"$criterionMax\" min=\"$criterionMin\" max=\"$criterionMax\" step=\"1\" type=\"range\" oninput=\"updateLabels('$criterionId-slider')\" >" >> $filter
echo "       	<span class=\"max badge badge-secondary\">$criterionMax</span>" >> $filter
echo "   	 </div>" >> $filter
echo "     </div> ">> $filter		

done

echo '    <div class="row">' >> $filter

echo '    </div>' >> $filter

echo '		<div class="col-sm-4">' >> $filter
echo "			<button type=\"button\" class=\"btn btn-lg btn-primary btn-block\" onclick=\"filterMTs();\">filter</button> " >> $filter  
echo '		</div>' >> $filter


echo '  </div>' >> $filter
echo '</div>' >> $filter


#Count number of MTs and create a badge (nb)
nbMts=$(tail -n+2 "../ATLzoo/output/"$1 | wc -l)

echo '<br />' >> $filter

echo '<div class="row">' >> $filter
echo '	<div class="col-lg-4"><span style="font-size:20px;">Model Transformations</span> ' >> $filter
echo '	<span id="nbMT" class="badge">'$nbMts'</span>' >> $filter
echo ' / ' >> $filter
echo '	<span id="totalMT" class="badge">'$nbMts'</span>' >> $filter
echo '</div>' >> $filter
echo '</div>' >> $filter


echo '</div>' >> $filter

# Begin model transformation print
#
echo '<div id="MT-container" class="container">' >> $filter

echo '<br />' >> $filter

#Load csv file for transformations
for line in $(tail -n+2 "../ATLzoo/output/"$1); do

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

	echo '	        <div class="row MT">' >> $filter
	echo '            <div class="panel-group">' >> $filter
	echo '                <div class="panel panel-default">' >> $filter
	echo '                    <div class="panel-heading">' >> $filter
	echo '                        <h4 class="panel-title"><a data-toggle="collapse" href="#collapse'$numMT'">+ '$nameMt'</a></h4>' >> $filter
	echo '                    </div>' >> $filter
	echo '                    <div id="collapse'$numMT'" class="panel-collapse collapse">' >> $filter
	echo '                        <div class="panel-body">' >> $filter
	echo '                            <div class="row titre">' >> $filter
	echo '                                <div class="col-lg-3"><h3>ATL metrics</h3></div>' >> $filter
	echo '                                <div class="col-lg-3"><h3>Kiviat chart</h3></div>' >> $filter
	echo '                            </div>' >> $filter
	echo '                            <div class="row titre">' >> $filter
	echo '                               <div class="col-lg-3" style="text-align:left;">' >> $filter
	echo '                                    <ul>' >> $filter
	echo '                                       <li>Rules: '$rules >> $filter
	echo '                                       <li>Matched Rules: '$mrules >> $filter
	echo '                                       <li>Lazy Rules: '$lrules >> $filter
	echo '                                       <li>Helpers: '$helpers >> $filter
	echo '                                       <li>Helpers With Context: '$helperswc >> $filter
	echo '                                       <li>Rule Inheritance Trees: '$inhTress >> $filter
	echo '                                       <li>Inheriting Transformation Rules: '$inhRules >> $filter
	echo '                                   </ul>' >> $filter
	echo '                               </div>' >> $filter
	echo '                               <div class="col-lg-3">' >> $filter
	echo '                                   <img src="ATLzoo/kiviatCharts/'$nameMt'.png" alt="'$nameMt'-spiderweb" class="center-img img-thumbnail" />' >> $filter
	echo '                               </div>' >> $filter
	echo '                           </div>' >> $filter
	echo '                           <div class="row titre">' >> $filter
	echo '                               <div class="col-lg-2">' >> $filter
	echo '                                   <a href="ATLzoo/sources/'$nameMt'.tar.gz" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> source files</a>' >> $filter
	echo '                               </div>' >> $filter
	echo '                               <div class="col-lg-2">' >> $filter
	echo '                                   <a href="ATLzoo/ATLmetrics/'$nameMt'.metrics" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> metrics</a>' >> $filter
	echo '                               </div>' >> $filter
	echo '                               <div class="col-lg-2">' >> $filter
	echo '                                   <a href="ATLzoo/kiviatCharts/'$nameMt'.png" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> Kiviat chart</a>' >> $filter
	echo '                               </div>' >> $filter
	echo '                           </div>' >> $filter
	echo '                       </div>' >> $filter
	echo '                  </div>' >> $filter
	echo '               </div>' >> $filter
	echo '           </div>' >> $filter
	echo '       </div>' >> $filter

	let numMT++
done

#close container div
echo '</div>' >> $filter

#close body html
#
echo '</body>' >> $filter
echo '</html>' >> $filter

mv $filter $filterPage