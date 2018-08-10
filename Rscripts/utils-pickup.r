#This function creates the strategies files
# 
# Each file contains the following line:
#
#	description line
#	description schema filePath
#	result Model Transformation 1
#   Model Transformation 2
#   ...
#	Model Transformation n
#
# PARAMETERS
#	filePath: relative file path contained in folder [selection-strategies/]
#	schemafilePath: relative file path contained in folder [selection-strategies/img/]
#	description: paragraph describing the strategy HTML
#	modelTransformations: a vector containing the names of result ModelTransformation

createStrategyFile <- function(filePath,schemafilePath,description,modelTransformations){
	absolutefilePath=paste0("../selection-strategies/",filePath)
	file.create(absolutefilePath)

	openedFile<-file(absolutefilePath)
	writeLines(c(description,schemafilePath,modelTransformations),openedFile)
	close(openedFile)
}

# These 3 functions read all the data from the ATLzoo folder
# Data are: metrics, list of MTs and List of Criteria 
#
# PARAMETRS
#	folder: the folder path that contains data.
#				data is always located in folder/output/
#

readMetrics <- function(folder){

	dataFile=paste0(folder,'output/all-MT')
	data <-read.csv(dataFile, header=FALSE, sep=",")
	data <- as.matrix(data)
	return(data)	
}

readCriteriaList <-function(folder){
	criteriaFile=paste0(folder,'output/criteria')
	criteria <-readLines(criteriaFile) 
	return(criteria)
}

readMTList <- function(folder){
	listMTFile=paste0(folder,'output/MTs')
	MTList <- readLines(listMTFile) 
	return(MTList)
}

# function calls to get data
#
#
criteria<-readCriteriaList('../ATLzoo/')
MTList<-readMTList('../ATLzoo/')
metrics<-readMetrics('../ATLzoo/')


#Function that creates a vector of MT objects
setClass("MT", representation(id = "numeric", Rules = "numeric", MatchedRules= "numeric", LazyRules = "numeric"
	,Helpers = "numeric", HelpersWContext= "numeric", RulesInhTrees= "numeric", InhRules= "numeric"))

createMTVector <- function(metrics){

	result<-vector()

	for (i in 1:nrow(metrics)) {

		tmpMT=new("MT", id=i, Rules=metrics[i,1], MatchedRules= metrics[i,2], LazyRules= metrics[i,3]
			, Helpers = metrics[i,4], HelpersWContext= metrics[i,5], RulesInhTrees= metrics[i,6],
			InhRules= metrics[i,7])

		result<- c(result,tmpMT)
	}

	return(result)
}

#
#
allMTs= createMTVector(metrics)

# this function takes a list of n indices and chooses m ones
pickMfromNindices<- function(indices,m){

	if(m< length(indices)){
		result= indices[sample(1:length(indices), m)]
		return(result)
	}
	return(indices)
}


indices2mtNames <- function(indiceVector){
	names <- vector()

	limit=length(indiceVector)

	# #Limit number of selected MTs to 10
	# if(length(indiceVector) > 10)
	# 	limit=10	

	for (i in 1:limit) {
		names <- c(names,MTList[indiceVector[i]])
	}
	return(names)
}

#This function gathers all the MTs (indices) respecting an interval of deciles
# for a given metric [rules=1, ....]
#	
# PARAMETERS
#     metric: [1,7] 1=rules, ...
#     min: {0.0,0.1,0.2,0.3, ..., 1.0}
#     max: {0.0,0.1,0.2,0.3, ..., 1.0}
monoDecilesIntervalStrategy <- function(metric,min,max,n=10){

	minVal= quantile(metrics[,metric],min)
	maxVal= quantile(metrics[,metric],max)

	result<-vector()

	for (i in 1:length(metrics[,metric])) {
		if(minVal <= metrics[i,metric] && metrics[i,metric] <= maxVal){
			result<-c(result,i)
			#print(i)
		}
	}
	#print(c("metric: ",metric," MTs: ",length(result)))

	result= pickMfromNindices(result, n)
	result= indices2mtNames(result)
	
	return(result)
}