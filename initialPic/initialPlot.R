library(dplyr)
library(ggplot2)
library(plotly)

unemployment <- read.csv("updataUn.csv")
wData <- read.csv("wfc.csv")
bData <- read.csv("bac.csv")
cData <- read.csv("citigroup.csv")
hData <- read.csv("hsbc.csv")
jData <- read.csv("jpm.csv")

jplot <- plot_ly(x = myFocus$allData.Japan, y = myFocus$unemployment, type = 'scatter', mode ='markers') %>%
  layout(title = "Japanese yen currency chage and unemployment",
         xaxis = list(title = "yen change"),
         yaxis = list(title = "unemployment"))
