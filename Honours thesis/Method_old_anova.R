#Method old: Welch's t-test

Method_old<- function(SimData){
  formula <- Y~group
  res <- welch.test(formula, data = SimData)
  return(res)
  }

