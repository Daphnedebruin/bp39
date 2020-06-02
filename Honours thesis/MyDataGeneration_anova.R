
library(sjstats)
library(PearsonDS)



#theoretical_eta_squared <- betweenVariance / (withinVariance+betweenVariance) #in this example, withinVariance is the same for all groups. 
#If this changes, I guess withinVariance is replaced by a pooled version
#Look into this

MyDataGeneration2 <- function(type, samp1, samp2,samp3,es, withinVariance){
  if(type == 1){
    skew <- 0
  }
  if(type == 3.1){
    skew <- 1
  }
  if(type == 3.2){
    skew <- 1.4
  }
  betweenVariance = (withinVariance*es)/(1-es)
  
  sd = c(0,0,0)
  while (sd[1]<0.001|sd[2]<0.001|sd[3]<0.001){
    group_means <- rnorm(3, sd = sqrt(betweenVariance))
    Y <- c(rep(group_means[1],samp1),rep(group_means[2],samp2),rep(group_means[3],samp3)) + rpearson((samp1+samp2+samp3), moments =  c(mean = 0, variance = withinVariance, skewnness = skew, kurtosis = 3))
    group <- factor(c(rep(1, samp1),rep(2, samp2),rep(3, samp3)))
    the_data <- data.frame(Y = Y, group = group)
    sd1 = sd(the_data[1:samp1,1])
    sd2 = sd(the_data[(samp1+1):(samp1+samp2),1])
    sd3 = sd(the_data[(samp1+samp2+ 1):(samp1+samp2 + samp3),1])
    sd = cbind(sd1,sd2,sd3)
  }
  print(sd)
  return(the_data)
}