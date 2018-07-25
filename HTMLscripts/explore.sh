#!/bin/bash

echo "Genrate <explore.html> page..."

explore='../explore-tmp.html'
explorePage='../explore.html'

#getting the list of criteria from criterai file
#it uses the first line of this file
for cline in $(cat ../ATLzoo/output/criteria); do
	echo $cline
done

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

#begin menu
#

#begin body
#
echo '<body>' >> $explore
echo '    <div class="container">' >> $explore
echo '        <div class="row">' >> $explore
echo '            <a href="#" class="btn btn-primary btn-lg active" role="button" title="sort-alpha">A&rarr;Z</a>' >> $explore
echo '            <a href="#" class="btn btn-default btn-lg active" role="button" title="sort-rules">rules &#8599;</a>' >> $explore
echo '            <a href="#" class="btn btn-default btn-lg active" role="button" title="sort-helpers">helpers &#8599;</a>' >> $explore
echo '        </div>' >> $explore
echo '    </div> ' >> $explore

#begin All MT print
#
echo '<div class="container">' >> $explore
echo '<br />' >> $explore

#Load csv file for transformations
for line in $(tail -n+2 ../ATLzoo/output/all-MT-full); do

	#echo $numMT

	#Collect info on the MT (name criteria)
	nameMt="$(echo $line | cut -d, -f1)"

	echo '	        <div class="row">' >> $explore
	echo '            <div class="panel-group">' >> $explore
	echo '                <div class="panel panel-primary">' >> $explore
	echo '                    <div class="panel-heading">' >> $explore
	echo '                        <h4 class="panel-title"><a data-toggle="collapse" href="#collapse'$numMT'">+ '$nameMt'</a></h4>' >> $explore
	echo '                    </div>' >> $explore
	echo '                    <div id="collapse'$numMT'" class="panel-collapse collapse">' >> $explore
	echo '                        <div class="panel-body">' >> $explore
	echo '                            <div class="row titre">' >> $explore
	echo '                                <div class="col-lg-2"><h3>ATL metrics</h3></div>' >> $explore
	echo '                                <div class="col-lg-3"><h3>Kiviat chart</h3></div>' >> $explore
	echo '                            </div>' >> $explore
	echo '                            <div class="row titre">' >> $explore
	echo '                               <div class="col-lg-2">' >> $explore
	echo '                                    <ul>' >> $explore
	echo '                                       <li>Rules' >> $explore
	echo '                                       <li>MatchedRules' >> $explore
	echo '                                       <li>LazyRules' >> $explore
	echo '                                       <li>Helpers' >> $explore
	echo '                                       <li>HelpersWContext' >> $explore
	echo '                                       <li>RulesInhTrees' >> $explore
	echo '                                       <li>InhRules' >> $explore
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