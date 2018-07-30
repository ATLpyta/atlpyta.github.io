/*

This script is used to filter the ATL zoo according to user's wish.

*/

function filterMTs(){

	var nbMTs=0;
	var MTs= document.getElementById("totalMT").innerHTML;

	//Load range slider values
	//
	var rulesSliderInputs= document.getElementById("Rules-slider").getElementsByTagName('input');

	var helpersSliderInputs= document.getElementById("Helpers-slider").getElementsByTagName('input');

	var MatchedRulesSliderInputs= document.getElementById("MatchedRules-slider").getElementsByTagName('input');

	var allSliderDivs= document.getElementsByClassName("slider-container");

	console.log("Nb sliders= "+allSliderDivs.length);
	

	var rulesMin=rulesSliderInputs[0].value;
	var rulesMax=rulesSliderInputs[1].value;

	var helpersMin= parseInt(helpersSliderInputs[0].value);
	var helpersMax= parseInt(helpersSliderInputs[1].value);

	//Show only the MTs that are in the right intervals
	//
	var MTcontainer=document.getElementById("MT-container");

	for (var i = 0; i<= MTcontainer.getElementsByClassName("row MT").length - 1; i++) {
		
		var criteriaList= MTcontainer.getElementsByClassName("row MT")[i].getElementsByTagName("li");
		var nbRules= parseInt(criteriaList[0].innerHTML.substring(7));
		var nbHelpers= parseInt(criteriaList[3].innerHTML.substring(9));
		
		if(rulesMin <= nbRules && nbRules <= rulesMax && helpersMin <= nbHelpers && nbHelpers <= helpersMax ){
			nbMTs++;
		    MTcontainer.getElementsByClassName("row MT")[i].style.display = "block";
		}else{
			MTcontainer.getElementsByClassName("row MT")[i].style.display = "none";
		}
	}

	//Update the number of filtered MTs
	//
	document.getElementById("nbMT").innerHTML = nbMTs;	
}