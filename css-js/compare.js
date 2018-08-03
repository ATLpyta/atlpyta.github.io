function updateSelectedMts(obj){

	var nbMTSpan=document.getElementById("nbMT");
	var nbMT= parseInt(nbMTSpan.innerHTML);

	if(obj.checked){
		nbMT++;
	}else
	{
		nbMT--;
	}

	nbMTSpan.innerHTML=nbMT;
}

function drawOnLoad(){
	var A2B= document.getElementById("A2B");
	A2B.checked=true;
	updateSelectedMts(A2B);
	
	var ATLCopier= document.getElementById("ATLCopier");
	ATLCopier.checked=true;
	updateSelectedMts(ATLCopier);
	
	drawCharts();
}


function drawCharts(){

	//List of selested MTs
	var selected=0;

	var Mtsinputs= document.getElementsByClassName("MTCheckBox");
	for (var i = Mtsinputs.length - 1; i >= 0; i--) {
		if(Mtsinputs[i].checked){
			selected++;
			console.log(Mtsinputs[i].id);
		}
	}

	var compareSpan= document.getElementById("compare-p");
	compareSpan.innerHTML= selected+" transfomation(s) are selected for comparison";

	if( selected > 0){
		//Begin draw radar chart


		var ctx = document.getElementById("myChart").getContext('2d');
		var myRadarChart = new Chart(ctx,
		    {
		        "type":"radar",
		        "data": chartData,
		        "options":{
		            "elements":{
		                "line":{
		                    "tension":0,"borderWidth":3}
		                }
		            }
		        }
		);
	}

}