#!/bin/bash

######
#This script creates .html pages for exploration of MTs with different sorting.
#
#PARAMETERS
#	$1 csv file to use e.g. all-MT-full (located in ../ATLzoo/output/)
#	$2 in {alpha,rules,helpers}. Which sorting button to activate
#
#HOW IT WORKS
#
#	Each call to this script creates only one .html file but links to two other file. 
#	The three files are always called as follows:
#		explore.html
#		explore-rules.html
#		explore-helpers.html
#					     


:> buttons

echo '<div class="container">' >> buttons

echo '<br />' >> buttons

echo '<div class="row">' >> buttons
echo '	<div class="col-sm-3">' >> buttons
echo '		Sort Model Transformations' >> buttons
echo '	</div>' >> buttons
echo '</div>' >> buttons

echo '<div class="row">' >> buttons
echo '	<div class="list-group list-group-horizontal">' >> buttons
echo '	<div class="col-sm-3">' >> buttons
##Which explore page do you want to create (depend on $2)
if [ "$2" = "default" ]; then
	explorePage='../explore.html'
	echo '		<a href="explore.html" class="list-group-item active">A&rarr;Z</a>' >> buttons
	echo '		<a href="explore-rules.html" class="list-group-item">rules &#8599;</a>' >> buttons
	echo '		<a href="explore-helpers.html" class="list-group-item">helpers &#8599;</a>' >> buttons
else
	if [ "$2" = "rules" ]; then
		explorePage='../explore-rules.html'
		echo '		<a href="explore.html" class="list-group-item">A&rarr;Z</a>' >> buttons
		echo '		<a href="explore-rules.html" class="list-group-item active">rules &#8599;</a>' >> buttons
		echo '		<a href="explore-helpers.html" class="list-group-item">helpers &#8599;</a>' >> buttons
	else
		if [ "$2" = "helpers" ]; then
			explorePage='../explore-helpers.html'
			echo ' 		<a href="explore.html" class="list-group-item">A&rarr;Z</a>' >> buttons
			echo '		<a href="explore-rules.html" class="list-group-item">rules &#8599;</a>' >> buttons
			echo '		<a href="explore-helpers.html" class="list-group-item active">helpers &#8599;</a>' >> buttons
		else
			explorePage='../explore.html'
			echo '		<a href="explore.html" class="list-group-item active">A&rarr;Z</a>' >> buttons
			echo ' 		<a href="explore-rules.html" class="list-group-item">rules &#8599;</a>' >> buttons
			echo ' 		<a href="explore-helpers.html" class="list-group-item">helpers &#8599;</a>' >> buttons
		fi
	fi
fi

echo '	</div>' >> buttons
echo '	</div>' >> buttons
echo '</div>' >> buttons
echo '</div> ' >> buttons

## Begin page generation
#
echo "Genrate <"$explorePage"> page..."

explore='../explore-tmp.html'


numMT=1
:> $explore

#begin head
#
echo '<!DOCTYPE html>' >> $explore
echo '<html lang="en">' >> $explore
echo '<head>' >> $explore
echo '<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->' >> $explore
echo '<meta name="description" content="">' >> $explore
echo '<meta name="author" content="">' >> $explore
echo '<link rel="icon" href="img/atlpyta.png">' >> $explore
echo '<meta charset="utf-8">' >> $explore
echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">' >> $explore
echo '<meta name="viewport" content="width=device-width, initial-scale=1">' >> $explore
echo '<title>ATLpyta - Explore</title>' >> $explore
echo '<!-- Bootstrap core CSS -->' >> $explore
echo '<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">' >> $explore
echo '<script src="bootstrap/js/jquery-3.3.1.min.js"></script>' >> $explore
echo '<script src="bootstrap/js/bootstrap.min.js"></script>' >> $explore
echo '<!-- Custom styles for this template -->' >> $explore
echo '<link href="atlpyta.css" rel="stylesheet">' >> $explore
echo '</head>' >> $explore

#begin body
#
echo '<body>' >> $explore

#begin menu
#
echo '' >> $explore

echo '   <nav class="navbar navbar-inverse navbar-fixed-top">' >> $explore
echo '     <div class="container">' >> $explore
echo '       <div class="navbar-header">' >> $explore
echo '         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">' >> $explore
echo '           <span class="sr-only">Toggle navigation</span>' >> $explore
echo '           <span class="icon-bar"></span>' >> $explore
echo '           <span class="icon-bar"></span>' >> $explore
echo '           <span class="icon-bar"></span>' >> $explore
echo '         </button>' >> $explore
echo '         <a class="navbar-brand" href="index.html">ATLpyta</a>' >> $explore
echo '       </div>' >> $explore
echo '       <div id="navbar" class="collapse navbar-collapse">' >> $explore
echo '         <ul class="nav navbar-nav">' >> $explore
echo '           <li class="active"><a href="index.html">Home</a></li>' >> $explore
echo '           <li><a href="index.html#about">About</a></li>' >> $explore
echo '           <li><a href="index.html#features">Features</a></li>' >> $explore
echo '           <li><a href="index.html#resources">Resources</a></li>' >> $explore
echo '           <li><a href="index.html#team">Team</a></li>' >> $explore
echo '           <li><a href="index.html#contact">Contact</a></li>' >> $explore
echo '         </ul>' >> $explore
echo '       </div><!--/.nav-collapse -->' >> $explore
echo '     </div>' >> $explore
echo '   </nav>' >> $explore

echo '' >> $explore

echo '<div class="page-header">' >> $explore
echo '	<div class="jumbotron">' >> $explore
echo '		<div class="container">' >> $explore
echo '' >> $explore
echo '			<div class="row titre">' >> $explore
echo '   			<div class="col-sm-5"></div>' >> $explore
echo '        		<div class="col-sm-2">' >> $explore
echo '        			<img src="img/atlpyta.png" class="center-img" alt="ATLpyta Logo"/>' >> $explore
echo '    			</div>' >> $explore
echo '    			<div class="col-sm-5"></div>' >> $explore
echo '      	</div>' >> $explore
echo '' >> $explore
echo ' 		</div>' >> $explore
echo '	</div>' >> $explore
echo '</div>' >> $explore


#begin content
#

#sort buttons
##
cat buttons >> $explore
rm buttons

#begin All MT print
#
echo '<div class="container">' >> $explore


#Count number of MTs and create a badge (nb)
nbMts=$(tail -n+2 "../ATLzoo/output/"$1 | wc -l)

echo '<br />' >> $explore


echo '<div class="row">' >> $explore
echo '	<div class="col-lg-3"><span style="font-size:20px;">All Model Transformations</span> ' >> $explore
echo '	<span class="badge">'$nbMts'</span></div>' >> $explore
echo '</div>' >> $explore

echo '<br />' >> $explore

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

	echo '	        <div class="row">' >> $explore
	echo '            <div class="panel-group">' >> $explore
	echo '                <div class="panel panel-default">' >> $explore
	echo '                    <div class="panel-heading">' >> $explore
	echo '                        <h4 class="panel-title"><a data-toggle="collapse" href="#collapse'$numMT'">+ '$nameMt'</a></h4>' >> $explore
	echo '                    </div>' >> $explore
	echo '                    <div id="collapse'$numMT'" class="panel-collapse collapse">' >> $explore
	echo '                        <div class="panel-body">' >> $explore
	echo '                            <div class="row titre">' >> $explore
	echo '                                <div class="col-lg-3"><h3>ATL metrics</h3></div>' >> $explore
	echo '                                <div class="col-lg-3"><h3>Kiviat chart</h3></div>' >> $explore
	echo '                            </div>' >> $explore
	echo '                            <div class="row titre">' >> $explore
	echo '                               <div class="col-lg-3" style="text-align:left;">' >> $explore
	echo '                                    <ul>' >> $explore
	echo '                                       <li>Rules: '$rules >> $explore
	echo '                                       <li>Matched Rules: '$mrules >> $explore
	echo '                                       <li>Lazy Rules: '$lrules >> $explore
	echo '                                       <li>Helpers: '$helpers >> $explore
	echo '                                       <li>Helpers With Context: '$helperswc >> $explore
	echo '                                       <li>Rule Inheritance Trees: '$inhTress >> $explore
	echo '                                       <li>Inheriting Transformation Rules: '$inhRules >> $explore
	echo '                                   </ul>' >> $explore
	echo '                               </div>' >> $explore
	echo '                               <div class="col-lg-3">' >> $explore
	echo '                                   <img src="ATLzoo/kiviatCharts/'$nameMt'.png" alt="'$nameMt'-spiderweb" class="center-img img-thumbnail" />' >> $explore
	echo '                               </div>' >> $explore
	echo '                           </div>' >> $explore
	echo '                           <div class="row titre">' >> $explore
	echo '                               <div class="col-lg-2">' >> $explore
	echo '                                   <a href="ATLzoo/sources/'$nameMt'.tar.gz" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> source files</a>' >> $explore
	echo '                               </div>' >> $explore
	echo '                               <div class="col-lg-2">' >> $explore
	echo '                                   <a href="ATLzoo/ATLmetrics/'$nameMt'.metrics" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> metrics</a>' >> $explore
	echo '                               </div>' >> $explore
	echo '                               <div class="col-lg-2">' >> $explore
	echo '                                   <a href="ATLzoo/kiviatCharts/'$nameMt'.png" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-download-alt"></span> Kiviat chart</a>' >> $explore
	echo '                               </div>' >> $explore
	echo '                           </div>' >> $explore
	echo '                       </div>' >> $explore
	echo '                  </div>' >> $explore
	echo '               </div>' >> $explore
	echo '           </div>' >> $explore
	echo '       </div>' >> $explore

	let numMT++
done

#close container div
echo '</div>' >> $explore

#close body html
#
echo '</body>' >> $explore
echo '</html>' >> $explore

mv $explore $explorePage