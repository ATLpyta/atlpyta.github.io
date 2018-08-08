source('utils-pickup.r')

#This function gathers all the MTs (indices) respecting an interval of deciles
# for a given metric [rules=1, ....]
#	
# PARAMETERS
#     metric: [1,7] 1=rules, ...
#     min: {0.0,0.1,0.2,0.3, ..., 1.0}
#     max: {0.0,0.1,0.2,0.3, ..., 1.0}

monoDecilesIntervalStrategy <- function(metric,min,max){

	minVal= quantile(metrics[,metric],min)
	maxVal= quantile(metrics[,metric],max)

	result<-vector()

	for (i in 1:length(metrics[,metric])) {
		if(minVal <= metrics[i,metric] && metrics[i,metric] <= maxVal){
			result<-c(result,i)
			#print(i)
		}
	}
	print(c("metric: ",metric," MTs: ",length(result)))

	result= indices2mtNames(result)
	
	return(result)
}


indices2mtNames <- function(indiceVector){
	names <- vector()

	limit=length(indiceVector)

	#Limit number of selected MTs to 10
	if(length(indiceVector) > 10)
		limit=10	

	for (i in 1:limit) {
		names <- c(names,MTList[indiceVector[i]])
	}
	return(names)
}


#Generate All mono-Deciles-Interval-Strategies

for (i in 1:length(criteria)) {

	minFile=paste0("mono-min-",criteria[i])
	minDesc=paste0("Model transformations containing the minimum number of ", 
					criteria[i]," (between 0 and Decile 1) are selected")
	minResult = monoDecilesIntervalStrategy(i,0.0,0.1)
	createStrategyFile(minFile,"min-schema.png",minDesc,minResult)		
}

for (i in 1:length(criteria)) {

	maxFile=paste0("mono-max-",criteria[i])
	maxDesc=paste0("Model transformations containing the maximal number of ", 
					criteria[i]," (between Decile 9 and Decile 10) are selected")
	maxResult = monoDecilesIntervalStrategy(i,0.9,1.0)
	createStrategyFile(maxFile,"min-schema.png",maxDesc,maxResult)		
}

for (i in 1:length(criteria)) {

	medFile=paste0("mono-median-",criteria[i])
	medDesc=paste0("Model transformations containing the median number of ", 
					criteria[i]," (between centile 45 and centile 55) are selected")
	medResult = monoDecilesIntervalStrategy(i,0.45,0.55)
	createStrategyFile(medFile,"avg-schema.png",medDesc,medResult)		
}