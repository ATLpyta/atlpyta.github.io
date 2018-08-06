#!/bin/bash

# This script generates the html page for automtic pick up
# 
# PARAMETERS
#	$1 folder containing all the selection strategies. 
#


if [ "$1" = "" ]; then
	echo "please give a folder containing the selection strategies"
else
	if [ ! -d "$1" ]; then
		echo "$1 is not a folder"
	else
		pickup="../pickup-tmp.html"
		pickupPage="../pickup.html"
		:> $pickup
		echo "generatrion of <$pickupPage> page..."

		#Begin head
		#
		#
		echo '<!DOCTYPE html>' >> $pickup
		echo '<html lang="en">' >> $pickup
		echo '<head>' >> $pickup
		echo '<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->' >> $pickup
		echo '<meta name="description" content="">' >> $pickup
		echo '<meta name="author" content="">' >> $pickup
		echo '<link rel="icon" href="img/atlpyta.png">' >> $pickup
		echo '<meta charset="utf-8">' >> $pickup
		echo '<meta http-equiv="X-UA-Compatible" content="IE=edge">' >> $pickup
		echo '<meta name="viewport" content="width=device-width, initial-scale=1">' >> $pickup
		echo '<title>ATLpyta - Pick up</title>' >> $pickup
		echo '<!-- Bootstrap core CSS -->' >> $pickup
		echo '<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">' >> $pickup
		echo '<script src="bootstrap/js/jquery-3.3.1.min.js"></script>' >> $pickup
		echo '<script src="bootstrap/js/bootstrap.min.js"></script>' >> $pickup
		echo '<!-- Custom styles for this template -->' >> $pickup
		echo '<link href="css-js/atlpyta.css" rel="stylesheet">' >> $pickup
		echo '</head>' >> $pickup

		#begin body
		#
		#
		echo '<body>' >> $pickup

		#begin menu
		#
		echo '' >> $pickup

		echo '   <nav class="navbar navbar-inverse navbar-fixed-top">' >> $pickup
		echo '     <div class="container">' >> $pickup
		echo '       <div class="navbar-header">' >> $pickup
		echo '         <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">' >> $pickup
		echo '           <span class="sr-only">Toggle navigation</span>' >> $pickup
		echo '           <span class="icon-bar"></span>' >> $pickup
		echo '           <span class="icon-bar"></span>' >> $pickup
		echo '           <span class="icon-bar"></span>' >> $pickup
		echo '         </button>' >> $pickup
		echo '         <a class="navbar-brand" href="index.html">ATLpyta</a>' >> $pickup
		echo '       </div>' >> $pickup
		echo '       <div id="navbar" class="collapse navbar-collapse">' >> $pickup
		echo '         <ul class="nav navbar-nav">' >> $pickup
		echo '           <li><a href="index.html">Home</a></li>' >> $pickup
		echo '           <li class="active"><a href="index.html#features">Features</a></li>' >> $pickup
		echo '           <li><a href="index.html#resources">Resources</a></li>' >> $pickup
		echo '           <li><a href="index.html#team">Team</a></li>' >> $pickup
		echo '           <li><a href="index.html#contact">Contact</a></li>' >> $pickup
		echo '         </ul>' >> $pickup
		echo '       </div><!--/.nav-collapse -->' >> $pickup
		echo '     </div>' >> $pickup
		echo '   </nav>' >> $pickup

		echo '' >> $pickup

		echo '<div class="page-header">' >> $pickup
		echo '	<div class="jumbotron">' >> $pickup
		echo '		<div class="container">' >> $pickup
		echo '			<div class="row titre">' >> $pickup
		echo '   			<div class="col-sm-5"></div>' >> $pickup
		echo '        		<div class="col-sm-2">' >> $pickup
		echo '        			<img src="img/atlpyta.png" class="center-img" alt="ATLpyta Logo"/>' >> $pickup
		echo '    			</div>' >> $pickup
		echo '    			<div class="col-sm-5"></div>' >> $pickup
		echo '      	</div>' >> $pickup
		echo ' 		</div>' >> $pickup
		echo '	</div>' >> $pickup
		echo '</div>' >> $pickup
		echo '' >> $pickup

		echo '<!--  -->' >> $pickup
		echo '<!--  -->' >> $pickup

		echo '<div class="container">' >> $pickup
		echo '' >> $pickup
		echo '' >> $pickup

		##Mono criteria strategies
		#
		#
		#
		echo '  <!-- Mono criteria strategies -->' >> $pickup
		echo '  <div id="criteria" class="panel panel-default">' >> $pickup
		echo '    <div class="panel-heading"><h1>Mono criterion strategies</h1></div>' >> $pickup
		echo '    <div class="panel-body">' >> $pickup
		echo '      <div class="row">' >> $pickup

		monoStrategies=$(ls $1 | grep -e "mono-")
		for strategy in $monoStrategies; do

			info=$(head -n+1 $1/$strategy)
			name=$(echo "$strategy" | cut -d"-" -f2-)

			echo '        ' >> $pickup
			echo '        <div class="col-sm-4" >' >> $pickup
			echo '          <div class="panel-group">' >> $pickup
			echo '           <div class="panel panel-default">' >> $pickup
			echo '             <div class="panel-heading">' >> $pickup
			echo '               <span class="panel-title" style="font-size: 20px;">'$name'</span>' >> $pickup
			echo '               <a data-toggle="collapse" href="#'$name'-info">' >> $pickup
			echo '               	<img src="img/info.png" class="right-icon first-icon" alt="explanation"/>' >> $pickup
			echo '               </a>' >> $pickup
			echo '               <a data-toggle="collapse" href="#'$name'-MTs">' >> $pickup
			echo '               	<img src="img/list.png" class="right-icon second-icon" alt="expand"/>' >> $pickup
			echo '               </a>' >> $pickup
			echo '             </div>' >> $pickup
			echo '             <div id="'$name'-info" class="panel-collapse collapse">' >> $pickup
			echo '               <div class="panel-body">' >> $pickup
			echo '                 '$info >> $pickup
			echo '               </div>' >> $pickup
			echo '             </div>' >> $pickup
			echo '             <div id="'$name'-MTs" class="panel-collapse collapse">' >> $pickup
			echo '               <div class="panel-body">' >> $pickup
			echo '                 MTs' >> $pickup
			echo '               </div>' >> $pickup
			echo '             </div>' >> $pickup
			echo '           </div>' >> $pickup
			echo '         </div>' >> $pickup
			echo '       </div> <!-- end strategy -->' >> $pickup
			echo '        ' >> $pickup
		
		done

		echo '     </div>' >> $pickup
		echo '   </div>' >> $pickup
		echo ' </div>' >> $pickup

		#Multi criteria strategy
		#
		#
  		echo '	<!-- Multi criteria strategies -->' >> $pickup
  		echo '	<div id="criteria" class="panel panel-default">' >> $pickup
  		echo '	  <div class="panel-heading"><h1>Multi criteria strategies</h1></div>' >> $pickup
  		echo '	  <div class="panel-body">' >> $pickup
  		echo '	      ' >> $pickup
  		echo '	  </div>' >> $pickup
  		echo '	</div>' >> $pickup



		echo '</div><!-- container div -->' >> $pickup
		#Close body tag
		#close html tag
		#
		#
		echo '</body>' >> $pickup
		echo '</html>' >> $pickup
		#mv $pickup $pickupPage
		echo "... OK"
	fi
fi

