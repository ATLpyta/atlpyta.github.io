require('fmsb')

kiviatChart <- function(folder){

	criteriaFile=paste0(folder,'output/criteria')
	listMTFile=paste0(folder,'output/MTs')
	dataFile=paste0(folder,'output/all-MT')
	kiviatChartsFolder=paste0(folder,'kiviatCharts/')

	cols <-readLines(criteriaFile) 
	rows <-readLines(listMTFile) 
	
	data <-read.csv(dataFile, header=FALSE, sep=",")

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
	    pdffile=paste0(kiviatChartsFolder,rows[i-2]) 
		pdffile=paste0(pdffile,'.pdf')
		pdf(pdffile)
		radarchart(data[c(1,2,i),], axistype=1, pdensity=30, pcol=COL[i-2], pfcol=COL[i-2], plwd=1, axislabcol="black", 
			caxislabels=c(0,24,48,72,96), title = rows[i-2]) 
		dev.off()
	}

	for(i in 3:nrow(data)){
	    pdffile=paste0(kiviatChartsFolder,rows[i-2]) 
		pdffile=paste0(pdffile,'.png')
		png(pdffile)
		radarchart(data[c(1,2,i),], axistype=1, pdensity=30, pcol=COL[i-2], pfcol=COL[i-2], plwd=1, axislabcol="black", 
			caxislabels=c(0,24,48,72,96), title = rows[i-2])
		dev.off()
	}
}

kiviatChart('../ATLzoo/')

