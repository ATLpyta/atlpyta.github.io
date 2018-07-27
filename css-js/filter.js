/*

This script is used to filter the ATL zoo according to user's wish.

*/

function filterMTs(){

	var nbMTs=0;
	var MTs= document.getElementById("totalMT").innerHTML;

	//Load range slider values
	//
	var rulesSliderInputs= document.getElementById("rules-slider").getElementsByTagName('input');
	var rulesMin=rulesSliderInputs[0].value;
	var rulesMax=rulesSliderInputs[1].value;

	var helpersSliderInputs= document.getElementById("helpers-slider").getElementsByTagName('input');
	var helpersMin=helpersSliderInputs[0].value;
	var helpersMax=helpersSliderInputs[1].value;

	//Show only the MTs that are in the right intervals
	//
	var MTcontainer=document.getElementById("MT-container");

	for (var i = 0; i<= MTcontainer.getElementsByClassName("row MT").length - 25; i++) {
			
		nbMTs++;
		MTcontainer.getElementsByClassName("row MT")[i].style.display = "none";


		//MTcontainer.getElementsByClassName("row MT")[i].style.display = "block";
	}


	//Update the number of filtered MTs
	//
	document.getElementById("nbMT").innerHTML = MTs-nbMTs;	
	
	alert("Rules ["+rulesMin+","+rulesMax+"]"+" Helpers ["+helpersMin+","+helpersMax+"]"+nbMTs+"/"+MTs);
}