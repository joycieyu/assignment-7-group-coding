#Esteban Parreno
#info 498
#a7

require(plotly)
require(dplyr)

#reads the survey data
data <- read.csv("https://raw.githubusercontent.com/INFO-498F/a7-survey-data/master/intro_survey_data.csv")

#function that creates a graph about the seahawk fans in the survey
chart1 <- function(data) {
  #creates a simple dataframe related to seahawk fans
  data_seahawks <- data %>% group_by(What.is.your.current.class.standing.) %>% 
    summarise (
      Fans = sum(Are.you.a.Seahawks.fan. == "Yes"), 
      SuperFans = sum(Are.you.a.Seahawks.fan. == "YES!")) 
  
  #reorganizes classes
  data_seahawks <- data_seahawks[c(1,4,2,3),]
  
  #first plot for normal fans
  p <- plot_ly(data_seahawks, 
               x = What.is.your.current.class.standing.,
               y = Fans,
               name = "Normal Fans (bandwagon)",
               type = "bar"
  )
  
  #second plot for Superfans
  p <- add_trace(
    p,
    y = SuperFans,
    name = "Super Fans" ) %>% layout(barmode = "stack", xaxis = list(title = "Class Standing"))
  
  #returns plot
  return(p)
}




