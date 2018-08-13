source('utils-pickup.r')


# This function produces a vector that sums the values of metrics for each MT
#
# PARAMETERS
#	metrics: in the matrix containing the values for all the metrics
#
# RESULT
#	for each MT: result= #Rules + #Helpers + #LazyRules + #MatchedRules + #InhRules + #RuleInhTrees
#
sumMetrics <- function(metrics){

	result <- vector()

	for (i in 1:nrow(metrics)) {

		tmp= 0
		
		for (j in 1:ncol(metrics)) {
			tmp= tmp + metrics[i,j]
		}

		result<- c(result,tmp)
	}

	return(result)
}
##
summedMetrics = sumMetrics(metrics)

## Procduce strategies files

File="poly-min-strategy"
Desc="Model transformations containing the minimal values for sum of metrics are selected"
Result = monoDecilesIntervalStrategy(summedMetrics,0.0,0.1,10)
createStrategyFile(File,"min-schema.png",Desc,Result)	

File="poly-max-strategy"
Desc="Model transformations containing the maximal values for sum of metrics are selected"
Result = monoDecilesIntervalStrategy(summedMetrics,0.9,1.0,10)
createStrategyFile(File,"max-schema.png",Desc,Result)		

File="poly-median-strategy"
Desc="Model transformations containing the median values for sum of metrics are selected"
Result = monoDecilesIntervalStrategy(summedMetrics,0.45,0.55,10)
createStrategyFile(File,"avg-schema.png",Desc,Result)		