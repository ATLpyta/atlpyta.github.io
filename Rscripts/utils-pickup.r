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


#Unit tests
modelTransformations<- vector()
modelTransformations<- c(modelTransformations, "A2B")
modelTransformations<- c(modelTransformations, "ATLCopier")
modelTransformations<- c(modelTransformations, "ATLCopier")
createStrategyFile("mono-testStrategy","avg-schema.png",
	"Model transformation containing the minimum number of Rules (between 0 and Decile 2) are selected"
	,modelTransformations)