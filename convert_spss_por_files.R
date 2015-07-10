# Converts a SPSS data file to a Stata data file

#install.packages(c("Hmisc", "foreign"))

require(Hmisc)
require(foreign)

setwd("~/Downloads") # Set working directory

fileName <- "aw5598.por" # Enter file name with .sav extension

data <- spss.get(fileName, use.value.labels=TRUE) # This may take some time

write.dta(data, sub(".por", ".dta", fileName)) # Will write .dta file with same fileName
write.csv(data, sub(".por", ".dta", fileName)) # Will write .csv file with same fileName

# If you get an error that reads like below:
    # Error in read.spss(file, use.value.labels = use.value.labels, to.data.frame = to.data.frame,  : 
    #                        error reading portable-file dictionary
# Then do this:

install.packages("memisc")
library(memisc)

data <- as.data.set(spss.portable.file(fileName))

write.dta(as.data.frame(data), sub(".por", ".dta", fileName)) # Will write .dta file with same fileName
write.csv(as.data.frame(data), sub(".por", ".dta", fileName)) # Will write .csv file with same fileName



