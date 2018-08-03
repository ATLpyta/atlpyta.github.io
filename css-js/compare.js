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
	var A2B= document.getElementById("R2ML2RDM");
	A2B.checked=true;
	updateSelectedMts(A2B);
	
	var ATLCopier= document.getElementById("AssertionModification");
	ATLCopier.checked=true;
	updateSelectedMts(ATLCopier);
	
	drawCharts();
}


function drawCharts(){

	//List of selested MTs
	var selected=0;
	var selectedMts=[];

	var Mtsinputs= document.getElementsByClassName("MTCheckBox");
	for (var i = Mtsinputs.length - 1; i >= 0; i--) {
		if(Mtsinputs[i].checked){
			selected++;
			selectedMts.push(Mtsinputs[i].id);
			console.log(Mtsinputs[i].id);
		}
	}

	var compareSpan= document.getElementById("compare-p");
	compareSpan.innerHTML= selected+" transfomation(s) are selected for comparison";

	if( selected > 0){
		//Begin draw radar chart

		var subSetData= new Object();
		subSetData.labels= chartData.labels;

		subSetData.datasets= [];

		for (var i = 0; i < selected; i++) {
			var mt=searchMT(selectedMts[i]);
			subSetData.datasets.push(mt);
		}

		var canvas= document.getElementById("myChart");
		var ctx = canvas.getContext('2d');
		ctx.clearRect(0, 0, canvas.width, canvas.height);

		var myRadarChart = new Chart(ctx,
		    {
		        "type":"radar",
		        "data": subSetData,
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

function searchMT(name) {
	
	for (var i = chartData.datasets.length - 1; i >= 0; i--) {
		if(chartData.datasets[i].label==name)
			return chartData.datasets[i];
	}

	return null;
}