#Preparation of the analysis
### Initialize the factors of your design:
samp1 <- c(5, 10, 15)
samp2 <- c(5, 10, 15)
es <- c(0.0, 0.2, 0.5, 0.8)
type <- c(1, 3.1, 3.2)
  #c(1, 2.1, 2.2, 3.1, 3.2)
sd1 <- 1
sd2 <- c(1, 0.8, 0.5)


##And create the simulation design matrix (full factorial)
# Design is a data.frame with all possible combinations of the factor levels
# Each row of the design matrix represents a cell of your simulation design
Design <- expand.grid(samp1 = samp1, samp2 = samp2, es = es, type = type, sd1 = sd1, sd2 = sd2)

###Preparation of the analysis:
# If you use R packages that are not standard:
# Install the relevant R packages:
install.packages("GFD")
#Always use library() to activate the package
library(GFD)
#NB we do not use this package for our example
### Source the relevant R functions of our example
### These functions are available from:
### https://github.com/Github-MS/Shark/tree/master/Scripts
source("MyDataGeneration.R")
source("Method_new.R")
source("Method_old.R")
source("MyEvaluation.R")