library(dplyr)
library(ggplot2)
library(plotly)
#setwd('desktop/370project')

unemployment <- read.csv("updataUn.csv")
wData <- read.csv("wfc.csv")
bData <- read.csv("bac.csv")
cData <- read.csv("citigroup.csv")
hData <- read.csv("hsbc.csv")
jData <- read.csv("jpm.csv")

tryData <- data.frame(unemployment$unemployment.rate)
colnames(tryData)[colnames(tryData)=="unemployment.unemployment.rate"] <- "un_rate"

reverse <- data.frame(tryData[rev(rownames(tryData)),])
colnames(reverse)[colnames(reverse)=="tryData.rev.rownames.tryData....."] <- "un_rate"

financial_plot <- plot_ly(x = wData$Date, y = wData$Close, type = 'scatter', mode ='lines+markers', name = 'wells fargo',
                          line = list(color = 'rgb(255, 192, 203)', width = 2)) %>%
  add_trace(y = bData$Close, type = 'scatter', mode = 'lines+markers', name ='bank of america',
            line = list(color = 'rgb(135, 206, 250)', width = 2)) %>%
  add_trace(y = cData$Close, type = 'scatter', mode = 'lines+markers', name ='citigroup',
            line = list(color = 'rgb(0, 255, 127)', width = 2)) %>%
  add_trace(y = hData$Close, type = 'scatter', mode = 'lines+markers', name ='hsbc',
            line = list(color = 'rgb(175, 220, 49)', width = 2)) %>%
  add_trace(y = jData$Close, type = 'scatter', mode = 'lines+markers', name ='jpMorgan',
            line = list(color = 'rgb(179, 41, 41)', width = 2)) %>%
  add_trace(y = reverse$un_rate, type = 'scatter', mode = 'lines+markers', name ='unemployment rate',
            line = list(color = 'rgb(141, 37, 210))', width = 2)) %>%
  layout(title = "",
         xaxis = list(title = "time"),
         yaxis = list(title = "unemployment rate change and stock"))

#linear regression models
wData['unemployment'] <- reverse$un_rate
bData['unemployment'] <- reverse$un_rate
cData['unemployment'] <- reverse$un_rate
hData['unemployment'] <- reverse$un_rate
jData['unemployment'] <- reverse$un_rate
totalData <- wData[,c("Date","Close", "unemployment")]
colnames(totalData)[colnames(totalData)=="Close"] <- "wClose"
totalData['bClose'] <- bData$Close
totalData['cClose'] <- cData$Close
totalData['hClose'] <- hData$Close
totalData['jClose'] <- jData$Close

wfit <- lm(unemployment ~ wClose, data = totalData)
bfit <- lm(unemployment ~ bClose, data = totalData)
cfit <- lm(unemployment ~ cClose, data = totalData)
hfit <- lm(unemployment ~ hClose, data = totalData)
jfit <- lm(unemployment ~ jClose, data = totalData)

summary(wfit)
summary(bfit)
summary(cfit)
summary(hfit)
summary(jfit)

