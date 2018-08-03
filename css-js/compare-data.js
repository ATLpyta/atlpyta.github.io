var chartData= new Object();
var myRadarChart;

chartData.labels= ["Rules","Matched rules","Lazy rules","Helpers","Helpers w context","rules inh tree","Inh. rules"];
var bgColors= ["rgba(255, 99, 132, 0.2)","rgba(54, 162, 235, 0.2)","rgba(25,182,152,0.2)","rgba(241,196,15,0.2)","rgba(211,84,0,0.2)","rgba(52,73,94,0.2)","rgba(127,140,141,0.2)","rgba(192,57,43,0.2)","rgba(39,174,96,0.2)","rgba(176,51,255,0.2)"];
var fgColors= ["rgba(255, 99, 132, 1.0)","rgba(54, 162, 235, 1.0)","rgba(25,182,152,1.0)","rgba(241,196,15,1.0)","rgba(211,84,0,1.0)","rgba(52,73,94,1.0)","rgba(127,140,141,1.0)","rgba(192,57,43,1.0)","rgba(39,174,96,1.0)","rgba(176,51,255,1.0)"];
var x;
var mt;

chartData.datasets= [];

x=0
mt= {"label":"A2B","data":[2,2,0,0,0,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"AssertionModification","data":[13,12,1,7,7,13,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"ATL2BindingDebugger","data":[2,2,0,0,0,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"ATL2Tracer","data":[2,2,0,0,0,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"ATLCopier","data":[1,1,0,0,0,1,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"ATOM2RSS","data":[3,3,0,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"ATOM2XML","data":[8,8,0,0,0,8,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"Book2Publication","data":[1,1,0,3,3,1,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"CloneDr2CodeClone","data":[5,5,0,1,1,5,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"CodeClone2SVG2","data":[3,3,0,4,4,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"CodeClone2SVG","data":[3,3,0,1,1,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"conf4MADL","data":[3,3,0,13,11,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"CPL2SPL","data":[15,14,1,6,6,15,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"Disaggregation","data":[10,9,1,2,2,10,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"DOT2Text","data":[0,0,0,5,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"EMF2KM3","data":[10,9,0,1,0,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"EMOOSE4KM3","data":[0,0,0,5,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"EMOOSE4UML2","data":[0,0,0,6,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"equivalenceOfAttributeAndAssociations","data":[6,6,0,1,1,6,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"Families2Persons","data":[2,2,0,2,2,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"FLAME4KM3","data":[0,0,0,53,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"FLAME4UML2","data":[0,0,0,93,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"ForeignKey","data":[8,8,0,0,0,8,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"HTML2XML","data":[14,12,0,0,0,2,10],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"IEEE1471_2_MoDAF","data":[13,13,0,1,0,13,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"introducingAnInterface","data":[9,8,1,1,1,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"JavaSource2Table","data":[4,2,2,2,1,4,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"KM32ATLCopier","data":[2,2,0,4,3,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"KM32CONFATL","data":[7,5,2,1,0,7,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"KM32DOT","data":[7,7,0,18,7,7,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"KM32EMF","data":[9,9,0,0,0,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"KM32Measure","data":[6,4,1,23,22,5,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"KM32OWL","data":[16,10,3,4,2,11,2],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"KM32SimpleClass","data":[4,4,0,0,0,4,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"KM32XML","data":[10,10,0,0,0,2,8],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"Lib4MMTree","data":[0,0,0,3,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"LibFQL","data":[0,0,0,2,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"MADL2DOT","data":[3,3,0,1,1,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"Measure2Table","data":[14,0,11,6,5,11,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"Measure2XHTML","data":[23,1,4,8,0,5,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"MeasureHelpers","data":[0,0,0,18,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"MergingPartialClasses","data":[10,9,0,2,1,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"MOOD4KM3","data":[0,0,0,5,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"MOOD4UML2","data":[0,0,0,10,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"MySQL2KM3","data":[11,11,0,17,13,11,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"OCL2R2ML","data":[37,26,11,11,8,37,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"OWL2XML","data":[22,13,2,5,5,15,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"partial2totalRole","data":[10,10,0,0,0,10,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"PartialRolesTotalB","data":[9,9,0,1,1,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"PrimaryKey","data":[8,8,0,0,0,8,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"Public2Private","data":[2,2,0,1,1,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"QMOOD4KM3","data":[0,0,0,25,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"QMOOD4UML2","data":[0,0,0,36,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"R2ML2RDM","data":[58,47,11,31,29,58,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"R2ML2WSDL","data":[14,9,5,5,3,14,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"R2ML2XML","data":[67,51,16,1,1,67,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"RaiseSupplier","data":[9,8,1,1,1,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"RDM2XML","data":[39,36,3,1,1,39,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"RedundantClassRemovable","data":[11,10,0,2,0,10,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"RedundantInheritance","data":[8,8,0,2,2,8,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"RefineAndMergeMeasure","data":[3,1,2,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"RemovingAnAssociationClass","data":[8,8,0,0,0,8,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"Removing","data":[10,9,0,2,1,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"Replace","data":[10,9,1,0,0,10,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"RSS2ATOM","data":[3,3,0,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"RSS2XML","data":[4,4,0,1,0,4,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"Simian2CodeClone","data":[5,5,0,1,1,5,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"SimpleClass2SimpleRDBMS","data":[1,1,0,6,6,1,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"SimpleSBVR2SimpleUML","data":[8,8,0,2,2,6,2],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"SimScan2CodeClone","data":[5,5,0,1,1,5,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"SVG2XML","data":[16,16,0,4,4,16,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"Syntax2SimpleSBVR","data":[20,17,3,3,3,6,14],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"Table2SVGBarChart","data":[3,0,2,15,4,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"Table2SVGPieChart","data":[7,0,6,17,4,6,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"Table2TabularHTML","data":[7,1,5,1,0,6,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"TableHelpers","data":[0,0,0,9,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"Tree2List","data":[1,1,0,0,0,1,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"Tree2List_usingATLResolveAlgorithm","data":[2,2,0,0,0,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"TT2BDD","data":[6,6,0,5,2,6,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"TypeA2TypeB_v1","data":[1,1,0,1,1,1,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"TypeA2TypeB_v2","data":[5,2,1,1,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"TypeA2TypeB_v3_firstStep","data":[2,1,1,0,0,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"TypeA2TypeB_v3","data":[3,3,0,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"TypeA2TypeB_v3_secondStep","data":[3,3,0,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"TypeA2TypeB_v4","data":[3,3,0,0,0,3,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"UML22Measure","data":[9,1,1,4,1,2,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"UML2KM3","data":[13,11,0,6,4,2,9],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"UML2OWL","data":[25,17,0,7,3,17,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"UMLDI2SVG","data":[14,14,0,27,25,14,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"WSDL2R2ML","data":[17,11,6,3,0,17,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"WSDL2XML","data":[20,17,3,5,0,20,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"XHTML2XML","data":[32,28,0,0,0,28,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"XML2ATOM","data":[10,10,0,8,8,10,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"XML2CPL","data":[26,26,0,0,0,26,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"XML2KML","data":[84,84,0,5,5,84,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=5
mt= {"label":"XML2MySQL","data":[6,5,1,10,9,6,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=6
mt= {"label":"XML2R2ML","data":[67,54,13,21,6,67,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=7
mt= {"label":"XML2RSS","data":[9,9,0,8,6,9,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=8
mt= {"label":"XML2Text","data":[0,0,0,3,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=9
mt= {"label":"XML2WSDL","data":[19,18,1,17,16,19,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=0
mt= {"label":"XML2XML","data":[4,4,0,1,1,4,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=1
mt= {"label":"XML2XSLT","data":[14,14,0,0,0,14,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=2
mt= {"label":"XMLHelpers","data":[0,0,0,13,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=3
mt= {"label":"XQuery2Code","data":[0,0,0,12,0,0,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

x=4
mt= {"label":"XSLT2XQuery","data":[7,7,0,0,0,7,0],"fill":true,"backgroundColor":bgColors[x],"borderColor":fgColors[x]};
chartData.datasets.push(mt);

