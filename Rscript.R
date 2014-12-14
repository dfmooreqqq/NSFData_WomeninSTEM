## Environment setup
# Load packages.
packages <- c("plyr","lattice","data.table","ggplot2","xlsx", "reshape2")
packages <- lapply(packages, FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
        install.packages(x)
        library(x, character.only = TRUE)
    }
})

# Set working directory
workingdir<-paste("C:\\Users", Sys.getenv("USERNAME"), "Documents\\GitHub\\NSFData_WomeninSTEM\\datatables", sep = "\\")
setwd(workingdir)

bachmajorfields<-read.xlsx2("tab11.xls", sheetIndex=1, startRow=3, as.data.frame=TRUE, header=TRUE, colClasses=rep("numeric",12))
bmfields_melted<-melt(bachmajorfields, id=c("Academic.year.ending", "All.fieldsa"), na.rm=TRUE)
qplot(Academic.year.ending, value, data=bmfields_melted, color=variable)