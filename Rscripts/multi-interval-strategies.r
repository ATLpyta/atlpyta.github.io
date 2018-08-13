source('utils-pickup.r')

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

summedMetrics = sumMetrics(metrics)