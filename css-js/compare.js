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
		var x;
		var mt;

		var bgColors= ["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(25,182,152,0.2)","rgba(241,196,15,0.2)","rgba(211,84,0,0.2)","rgba(52,73,94,0.2)","rgba(127,140,141,0.2)","rgba(192,57,43,0.2)","rgba(39,174,96,0.2)","rgba(176,51,255,0.2)"];
		var fgColors= ["rgba(255, 99, 132, 1.0)","rgba(54, 162, 235, 1.0)","rgba(25,182,152,1.0)","rgba(241,196,15,1.0)","rgba(211,84,0,1.0)","rgba(52,73,94,1.0)","rgba(127,140,141,1.0)","rgba(192,57,43,1.0)","rgba(39,174,96,1.0)","rgba(176,51,255,1.0)"];    

		var chartData= new Object();
		chartData.labels= ["Rules","Matched rules","Lazy rules","Helpers","Helpers w context","rules inh tree","Inh. rules"];
		chartData.datasets= [];


		x = Math.floor((Math.random() * (bgColors.length)) + 0);
		mt= {"label":"Azerty","data":[1,2,3,4,5,6,7],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
		chartData.datasets.push(mt);

		x = Math.floor((Math.random() * (bgColors.length)) + 0);
		mt= {"label":"UML","data":[5,6,7,8,9,10,11],"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
		chartData.datasets.push(mt);

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