source('poly-interval-strategies.r')

#This function gathers the most diverse MTs for a sum of metrics.
#
# The set of MTs is divided into 10 intervals (the deciles)
# 1 Mt is then pick up in each decile.
#
polyDiverseStrategy <- function(values){

	result<-vector()

	for (i in 0:9) {
		tmp=  monoDecilesIntervalStrategy(values,(i+0.5)/10,(i+1)/10,1)
		result<-c(result,tmp)
	}

	print(result)

	return(result)
}

File="poly-div-strategy"
Desc="Model transformations containing the most diverse sum of metrics are selected"
Result = polyDiverseStrategy(summedMetrics)
createStrategyFile(File,"div-schema.png",Desc,Result)