#----------------------------------------------------
# Intermittent Postural control (IPC) model simulation example
# Generate data and calculate the -2 log-likelihood of the model.
# Can be used with optimization- global such as differential evolution preferred.
#----------------------------------------------------

#Simulate data
  #Set up parameters for 3 series
  Asai.pars<-c(
    "K"=  0.8,
    "B"=  4,
    "P"=  0.25,
    "D"=  10,
    "a"=  .62,  #Fixed
    "rad"= .4,
    "delay"= .2,  #Fixed
    "w"=  .2,
    "e"=.1,
    
    "x0_1"=0,
    "dx0_1"=0,
    "d2x0_1"=0,

    "x0_2"=0,
    "dx0_2"=0,
    "d2x0_2"=0,

    "x0_3"=0,
    "dx0_3"=0,
    "d2x0_3"=0,

    "mu_1"=0,
    "mu_2"=0,
    "mu_3"=0
  )
  
  #Set physical constants
  physConstants<-c("mass"=60, "height"=1.0, "gravity"=9.81)
  
  #Set series length and time interval in seconds:
  stepSize<-.01
  time<-120
  
  #Generate data:
  numSeries<-3
  x<-matrix(NA, time/stepSize, numSeries)
  for(i in 1:numSeries){
    set.seed(1234+i)
    x[,i]<-ipcSimulate(Asai.pars, seconds=time, dt=stepSize, buffer=.25/stepSize)[,1]
  }
  #Combine times
  times<-seq(stepSize,time,stepSize)
  dat<-cbind(times, x)
  
  #Calculate -2Log-Likelihood
  ipcMultiGroup(Asai.pars, dat, physConstants)
  