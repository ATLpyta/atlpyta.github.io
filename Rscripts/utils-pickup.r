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