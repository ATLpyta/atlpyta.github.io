#
#
#
source('utils-pickup.r')

#This function gathers the most diverse MTs for a given metric.
#
# The set of MTs is divided into 10 intervals (the deciles)
# 1 Mt is then pick up in each decile.
#
monoDiverseStrategy <- function(metric){

	result<-vector()

	for (i in 0:9) {
		tmp=  monoDecilesIntervalStrategy(metrics[,metric],(i+0.5)/10,(i+1)/10,1)
		result<-c(result,tmp)
	}

	return(result)
}

# Generate all mono-diverse-strategies
#
for (i in c(1)) {

	File=paste0("mono-div-",criteria[i])
	Desc=paste0("Model transformations containing the most diverse number of ", 
					criteria[i]," (1 MT in each decile) are selected")
	Result = monoDiverseStrategy(i)
	createStrategyFile(File,"div-schema.png",Desc,Result)		
}