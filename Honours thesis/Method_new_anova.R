WTPS <- function(formula,theData){
  theRes <- GFD(formula, data = theData, nperm = 999, alpha = 0.05)
  return(theRes$ATS[4])
}
Method_new<- function(SimData){
  formula <- Y~group
  res <- WTPS(formula, theData = SimData)
  return <- res}