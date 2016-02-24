library(dplyr)



# A function that takes in a dataset and returns a list of info about it:
info_function <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  
  # table for each class standing and the amount of number
  names(data)[1] <- "Class_standing" 
  ret$class_standing <- data %>% 
    group_by(Class_standing) %>% 
    summarise(standing = n())
  
  # highest number of countries visited
  ret$most_countries <- data %>% 
    summarize(max = max(How.many.countries.have.you.visited.in.your.life.))
 
  # number of seahawks fan
  ret$Seahawks_fan <- length(grep('Y', data$Are.you.a.Seahawks.fan.))
 
  # number of students interested in info major
  ret$info_intended <- length(grep('Y', data$Are.you.interested.in.applying.to.the.Informatics.major.))
 

  return (ret)
}

