#Preparation of the analysis
library(onewaytests)
### Initialize the factors of your design:
samp1 <- c(5, 15)
samp2 <- c(5, 15)
samp3 <- c(5, 15)
es <- c(0,0.01, 0.06, 0.14)
type <- c(1, 3.1, 3.2)
withinVariance <- c(0.3,0.7,1)


Design <- expand.grid(samp1 = samp1, samp2 = samp2,samp3 =samp3, es = es, type = type, withinVariance = withinVariance)



###Preparation of the analysis:
# If you use R packages that are not standard:
# Install the relevant R packages:
#install.packages("GFD")
#Always use library() to activate the package
library(GFD)
#NB we do not use this package for our example
### Source the relevant R functions of our example
### These functions are available from:
### https://github.com/Github-MS/Shark/tree/master/Scripts
source("MyDataGeneration_anova.R")
source("Method_new_anova.R")
source("Method_old_anova.R")
source("MyEvaluation_anova.R")
