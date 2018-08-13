source('utils-pickup.r')

#Generate All mono-Deciles-Interval-Strategies
for (i in c(1,3,4)) {

	minFile=paste0("mono-min-",criteria[i])
	minDesc=paste0("Model transformations containing the minimum number of ", 
					criteria[i]," (between 0 and Decile 1) are selected")
	minResult = monoDecilesIntervalStrategy(metrics[,i],0.0,0.1)
	createStrategyFile(minFile,"min-schema.png",minDesc,minResult)		
}

for (i in c(1,3,4)) {

	maxFile=paste0("mono-max-",criteria[i])
	maxDesc=paste0("Model transformations containing the maximal number of ", 
					criteria[i]," (between Decile 9 and Decile 10) are selected")
	maxResult = monoDecilesIntervalStrategy(metrics[,i],0.90,1.0)
	createStrategyFile(maxFile,"max-schema.png",maxDesc,maxResult)		
}

for (i in c(1,3,4)) {

	medFile=paste0("mono-median-",criteria[i])
	medDesc=paste0("Model transformations containing the median number of ", 
					criteria[i]," (between centile 45 and centile 55) are selected")
	medResult = monoDecilesIntervalStrategy(metrics[,i],0.45,0.55)
	createStrategyFile(medFile,"avg-schema.png",medDesc,medResult)		
}