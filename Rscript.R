setwd("C:\\Users\\Daniel\\Documents\\GitHub\\NSFData_WomeninSTEM\\datatables")
setwd("C:\\Users\\damoore\\Documents\\GitHub\\NSFData_WomeninSTEM\\datatables")

library(plyr)
library(lattice)
library(data.table)
library(ggplot2)
library(xlsx)
library(reshape2)

bachmajorfields<-read.xlsx2("tab11.xls", sheetIndex=1, startRow=3, as.data.frame=TRUE, header=TRUE, colClasses=rep("numeric",12))

bmfields_melted<-melt(bachmajorfields, id=c("Academic.year.ending", "All.fieldsa"), na.rm=TRUE)

qplot(Academic.year.ending, value, data=bmfields_melted, color=variable)