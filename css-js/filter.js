/*

This script is used to filter the ATL zoo according to user's wish.

*/

function filterMTs(){

	var nbMTs=0;
	var MTs= document.getElementById("totalMT").innerHTML;
	document.getElementsByClassName("download")[0].style.display = "none";

	//Load range slider values
	//
	var allSliderDivs= document.getElementsByClassName("slider-container");

	var rulesMin=allSliderDivs[0].getElementsByTagName("input")[0].value;
	var rulesMax=allSliderDivs[0].getElementsByTagName("input")[1].value;

	var matchedRulesMin=allSliderDivs[1].getElementsByTagName("input")[0].value;
	var matchedRulesMax=allSliderDivs[1].getElementsByTagName("input")[1].value;

	var lazyRulesMin=allSliderDivs[2].getElementsByTagName("input")[0].value;
	var lazyRulesMax=allSliderDivs[2].getElementsByTagName("input")[1].value;

	var helpersMin=allSliderDivs[3].getElementsByTagName("input")[0].value;
	var helpersMax=allSliderDivs[3].getElementsByTagName("input")[1].value;

	var helpersWContextMin=allSliderDivs[4].getElementsByTagName("input")[0].value;
	var helpersWContextMax=allSliderDivs[4].getElementsByTagName("input")[1].value;

	var rulesInhTreeMin=allSliderDivs[5].getElementsByTagName("input")[0].value;
	var rulesInhTreeMax=allSliderDivs[5].getElementsByTagName("input")[1].value;

	var InhRulesMin=allSliderDivs[6].getElementsByTagName("input")[0].value;
	var InhRulesMax=allSliderDivs[6].getElementsByTagName("input")[1].value;

	// console.log(rulesMin," <  rules < ",rulesMax);
	// console.log(matchedRulesMin," <  matchedRules < ",matchedRulesMax);
	// console.log(lazyRulesMin," <  lazyRules < ",lazyRulesMax);
	// console.log(helpersMin," <  helpers < ",helpersMax);
	// console.log(helpersWContextMin," <  helpersWContext < ",helpersWContextMax);
	// console.log(rulesInhTreeMin," <  rulesInhTree < ",rulesInhTreeMax);
	// console.log(InhRulesMin," <  InhRules < ",InhRulesMax);

	//Show only the MTs that are in the right intervals
	//
	var MTcontainer=document.getElementById("MT-container");

	var divDowload=document.getElementById("download-btns");
	divDowload.innerHTML="";

	for (var i = 0; i<= MTcontainer.getElementsByClassName("row MT").length - 1; i++) {
		
		var criteriaList= MTcontainer.getElementsByClassName("row MT")[i].getElementsByTagName("span");
		
		var nbRules= parseInt(criteriaList[0].innerHTML);
		var nbMatchedRules = parseInt(criteriaList[1].innerHTML);
		var nbLazyRules = parseInt(criteriaList[2].innerHTML);
		var nbHelpers= parseInt(criteriaList[3].innerHTML);
		var nbHelpersWContext= parseInt(criteriaList[4].innerHTML);
		var nbRulesInhTree= parseInt(criteriaList[5].innerHTML);
		var nbInhRules= parseInt(criteriaList[6].innerHTML);

		// console.log("Rules="+nbRules);
		// console.log("MatchedRules="+nbMatchedRules);
		// console.log("LazyRules="+nbLazyRules);
		// console.log("Helpers="+nbHelpers);
		// console.log("HelpersWContext="+nbHelpersWContext);
		// console.log("RulesInhTree="+nbRulesInhTree);
		// console.log("InhRules="+nbInhRules);

		if(    rulesMin <= nbRules && nbRules <= rulesMax
			&& matchedRulesMin <= nbMatchedRules && nbMatchedRules <= matchedRulesMax
			&& lazyRulesMin <= nbLazyRules && nbLazyRules <= lazyRulesMax	 
			&& helpersMin <= nbHelpers && nbHelpers <= helpersMax
			&& helpersWContextMin <= nbHelpersWContext && nbHelpersWContext <= helpersWContextMax
			&& rulesInhTreeMin <= nbRulesInhTree && nbRulesInhTree <= rulesInhTreeMax
			&& InhRulesMin <= nbInhRules && nbInhRules <= InhRulesMax 
			){
			
			nbMTs++;
		    MTcontainer.getElementsByClassName("row MT")[i].style.display = "block";


		    var mtName="AZERTY";
		    var mtLink="";

		    //Add a download butoon for this MT
		    divDowload.innerHTML= divDowload.innerHTML + "<a href=\""+mtLink+"\"><button class=\"btn btn-primary\">"+mtName+"</button></a>";

		}else{
			MTcontainer.getElementsByClassName("row MT")[i].style.display = "none";
		}
	}

	//Update the number of filtered MTs
	//
	document.getElementById("nbMT").innerHTML = nbMTs;	

	if (nbMTs>0 && nbMTs<MTs){
		document.getElementsByClassName("download")[0].style.display = "block";
	}
}