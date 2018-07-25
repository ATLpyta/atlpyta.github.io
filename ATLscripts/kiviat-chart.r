require('fmsb')

kiviatChart <- function(file){

	cols <-readLines('output/criteria') 
	rows <-readLines('output/MTs') 
	
	data <-read.csv(file, header=FALSE, sep=",")

	data <- as.data.frame(data)
	colnames(data)=c(cols)
	rownames(data)=c(rows)
	
	data=rbind(rep(max(data),length(rows)) , rep(0,length(rows)) , data)

	COL<-colorRampPalette(c("red", "blue"))(nrow(data)-2)


	pdf('test.pdf')
	radarchart(data, pcol= COL, cglcol = "black")
	legend(0.5, 1.25, legend =  levels(as.factor(rows)), col= COL, seg.len = 2, border = "transparent", pch = 16, lty = 1)
	dev.off()


	#pdf('test2.pdf')
	#par(mfrow = c(2, 2)) 
	for(i in 3:nrow(data)){
	    pdffile=paste('kiviatCharts/',rows[i-2]) 
		pdffile=paste(pdffile,'.pdf')
		pdf(pdffile)
		radarchart(data[c(1,2,i),], pcol = COL[i-2], pfcol= COL[i-2], pdensity=40, cglcol = "black",seg=3, title = rows[i-2]) 
		dev.off()
	}
	#dev.off()

}

kiviatChart('output/all-MT')

