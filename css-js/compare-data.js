var chartData= new Object();

chartData.labels= ["Rules","Matched rules","Lazy rules","Helpers","Helpers w context","rules inh tree","Inh. rules"];
var bgColors= ["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(25,182,152,0.2)","rgba(241,196,15,0.2)","rgba(211,84,0,0.2)","rgba(52,73,94,0.2)","rgba(127,140,141,0.2)","rgba(192,57,43,0.2)","rgba(39,174,96,0.2)","rgba(176,51,255,0.2)"];
var fgColors= ["rgba(255, 99, 132, 1.0)","rgba(54, 162, 235, 1.0)","rgba(25,182,152,1.0)","rgba(241,196,15,1.0)","rgba(211,84,0,1.0)","rgba(52,73,94,1.0)","rgba(127,140,141,1.0)","rgba(192,57,43,1.0)","rgba(39,174,96,1.0)","rgba(176,51,255,1.0)"];
var x;
var mt;

	chartData.datasets= [];

	x = Math.floor((Math.random() * (bgColors.length)) + 0);
	mt= {"label":"Azerty","data":[1,2,3,4,5,6,7],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
	chartData.datasets.push(mt);

	x = Math.floor((Math.random() * (bgColors.length)) + 0);
	mt= {"label":"UML","data":[5,6,7,8,9,10,11],"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
	chartData.datasets.push(mt);

	x = Math.floor((Math.random() * (bgColors.length)) + 0);
	mt= {"label":"Ecore","data":[15,16,17,18,19,10,11],"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
	chartData.datasets.push(mt);

