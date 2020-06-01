
#Comparison of the type-1 error and type-2 error of the Welch's t-test and the Studentized permutation test

# Factors in this simulation design: 
  # 'Type' is the type of distribution that the variables follow (either 1, 2, or 3)
  #  where 1 = normal, 2 = negative binomial, and 3 = gamma
  # 'es' is the effect size (either 0.0, 0.2, 0.5, or 0.8) 
  # 'samp1' is the sample size in group 1 (either 10, 20, 40, or 80)
  # 'samp2' is the sample size in group 2 (either 10, 20, 40, or 80)
  # 'sd1' is the standard deviation in group 1 (equals 1)
  # 'sd2' is the standard deviation in group 2 (either 0.1, 0.5, 1, 2, or 10)
#mean2 equals -(es*sd2) to match the given es and sd
#Used constants:
#sdpooled = sqrt((sd1+sd2)/2)
  #Normal
#mean1 = 0
#Negative Binomial
#prop = 0.5
#size = 2
  #Gamma
#shape = 2
#rate = 1

MyDataGeneration <- function(type, samp1, samp2,es, sd1, sd2){
  #Normal random variable is type 1
  if (type==1){
    var1 <- rnorm(samp1, mean= 0,  sd =sd1) 
    mean2 <- (es*(sqrt((sd1^2+sd2^2)/2))) 
    var2 <- rnorm(samp2, mean= mean2 , sd = sd2)
    Y <- c(var1, var2)
    group <- as.factor(c(rep(1, samp1), rep(2,samp2)))
    dat <- data.frame(Y,group)
  
  }
  if (type==2.1){
    #negative binomial random variable is type 2
    #mean2 <- -(es*(sqrt((sd1+sd2)/2)))
    var1 <- rnbinom(samp1, size = 2, prob = 0.5)
    var2 <- rnbinom(samp2, size = 2, prob = 0.5)
    #make z-values
    var1 <- (var1-2)/2
    var2 <- (var2-2)/2
    #change to correct mean and sd
    mean2 <- (es*(sqrt((sd1^2+sd2^2)/2))) 
    var2 <- (var2*sd2)+mean2
    Y <- c(var1, var2)
    group <- as.factor(c(rep(1, samp1),rep(2, samp2)))
    dat <- data.frame(Y,group)
  }
  
  if (type==2.2){
    #negative binomial random variable is type 2
    #mean2 <- -(es*(sqrt((sd1+sd2)/2)))
    var1 <- rnbinom(samp1, size = 10, prob = 0.5)
    var2 <- rnbinom(samp2, size = 10, prob = 0.5)
    #make z-values
    var1 <- (var1-10)/sqrt(20)
    var2 <- (var2-10)/sqrt(20)
    #change to correct mean and sd
    mean2 <- (es*(sqrt((sd1^2+sd2^2)/2))) 
    var2 <- (var2*sd2)+mean2h
    Y <- c(var1, var2)
    group <- as.factor(c(rep(1, samp1),rep(2, samp2)))
    dat <- data.frame(Y,group)
  }
  
  if (type==3.1){
    #Gamma random variable is type 3
    var1 <- rgamma(samp1, shape = 2, rate = 1)
    var2 <- rgamma(samp2, shape = 2, rate = 1)
    #make z-values
    var1 <- (var1-2)/sqrt(2)
    var2 <- (var2-1)/sqrt(2)
    #change to correct mean and sd
    mean2 <- (es*(sqrt((sd1^2+sd2^2)/2))) 
    var2 <- (var2*sd2)+mean2
    Y <- c(var1, var2)
    group <- as.factor(c(rep(1, samp1),rep(2, samp2)))
    dat <- data.frame(Y,group)
  }
  
  if (type==3.2){
    #Gamma random variable is type 3
    var1 <- rgamma(samp1, shape = 4, rate = 1)
    var2 <- rgamma(samp2, shape = 4, rate = 1)
    #make z-values
    var1 <- (var1-4)/2
    var2 <- (var2-4)/2
    #change to correct mean and sd
    mean2 <- (es*(sqrt((sd1^2+sd2^2)/2))) 
    var2 <- (var2*sd2)+mean2
    Y <- c(var1, var2)
    group <- as.factor(c(rep(1, samp1),rep(2, samp2)))
    dat <- data.frame(Y,group)
  }
  return(dat)
}