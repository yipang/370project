library(dplyr);
library(plotly);
library(ggplot2);
library(plyr)

masterCur <- read.csv('data/currency/MASTERCSV.csv')
unemploy <- read.csv('data/unemployment/unemployment.csv')
wellsfargo <- read.csv("data/bank/wfc.csv")
wData <- rev(wellsfargo$Close)

month <- colnames(unemploy)
month <- month[2:13]
year <- rownames(unemploy)
unemploymentData <- c(0,0,0)
index <- 1
for( y in year){
  for( m in month ){
    unemploymentData[index] <- unemploy[y,m]
    index <- index + 1
  }
}
unemploymentData <- data.frame(unemploymentData)
colnames(unemploymentData) <- "unemployment"
masterCur['unemploymentRate'] <- unemploymentData['unemployment']
masterCur['wellsfargo'] <- wData
sum <- head(masterCur,3)
#plot for india vs unempoyment rate'
India.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$India, type = 'scatter', mode = 'lines', height="600", name = "India") %>%
          add_trace(y = masterCur$unemployment, name = "unemploymentData")
India.modLin <- lm(unemploymentRate ~ India, data = masterCur)
#India.predict <-predict(India.modLin,masterCur$unemploymentRate,type="response")
#plot for Japan vs unempoyment rate
Japan.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Japan, type = 'scatter', mode = 'lines', height="600", name = "Japan") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Japan.modLin <- lm(unemploymentRate ~ Japan, data = masterCur)
#Japan.predict <-predict(Japan.modLin,masterCur$Japan,type="response")
#plot for China vs unempoyment rate
China.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$China, type = 'scatter', mode = 'lines', height="600", name = "China") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
China.modLin <- lm(unemploymentRate ~ China, data = masterCur)
#China.predict <-predict(China.modLin,masterCur$China,type="response")
#plot for Korea vs unempoyment rate
Korea.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Korea, type = 'scatter', mode = 'lines', height="600", name = "Korea") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Korea.modLin <- lm(unemploymentRate ~ Korea, data = masterCur)
#Korea.predict <-predict(Korea.modLin,masterCur$Korea,type="response")
#plot for Canada vs unempoyment rate
Canada.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Canada, type = 'scatter', mode = 'lines', height="600", name = "Canada") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Canada.modLin <- lm(unemploymentRate ~ Canada, data = masterCur)
#Canada.predict <-predict(Canada.modLin,masterCur$Canada,type="response")
#plot for Brazil vs unempoyment rate
Brazil.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Brazil, type = 'scatter', mode = 'lines', height="600", name = "Brazil") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Brazil.modLin <- lm(unemploymentRate ~ Brazil, data = masterCur)
#Brazil.predict <-predict(Brazil.modLin,masterCur$Brazil,type="response")
#plot for Russia vs unempoyment rate
Russia.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Russia, type = 'scatter', mode = 'lines', height="600", name = "Russia") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Russia.modLin <- lm(unemploymentRate ~ Russia, data = masterCur)
#Russia.predict <-predict(Russia.modLin,masterCur$Russia,type="response")
#plot for European.Union vs unempoyment rate
EU.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$European.Union, type = 'scatter', mode = 'lines', height="600", name = "European.Union") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
EU.modLin <- lm(unemploymentRate ~ European.Union, data = masterCur)
#EU.predict <-predict(EU.modLin,masterCur$European.Union,type="response")




masterCur['avg'] <- (masterCur$Japan / 9 + masterCur$Canada * 6 + masterCur$European.Union * 6 + masterCur$Brazil * 6)/4
#avg
avg.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$avg, type = 'scatter', mode = 'lines', height="600", name = "avg") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
avg.fit <-lm(unemploymentRate ~ avg + wellsfargo, data = masterCur)
summary(avg.fit)

#final 4 countries
##Final Fit
final.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Brazil * 6, type = 'scatter', mode = 'lines', height="600", name = "Brazil") %>%
  add_trace( y = masterCur$Japan / 9, name = "Japan") %>%
  add_trace(y = masterCur$Canada * 6, name = "Canada") %>%
  add_trace(y = masterCur$European.Union * 6, name = "EU") %>%
  add_trace(y = masterCur$wellsfargo/3, name = "wells fargo") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
final.fit <- lm(unemploymentRate ~ masterCur$Japan + masterCur$European.Union + masterCur$Canada + masterCur$Brazil + masterCur$wellsfargo, data=masterCur)
summary(final.fit)

#canada vs wells fargo vs unemployment
ff.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Canada * 6, type = 'scatter', mode = 'lines', height="600", name = "Canada") %>%
  add_trace(y = masterCur$wellsfargo/3, name = "wells fargi") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
ff.fit <-lm(unemploymentRate ~ Canada + wellsfargo, data = masterCur)
summary(ff.fit)

#predic
#train <- c(0,0,0)
#train <- data.frame(train)
#train <- data.frame(runif(120, min = 0, max = 2))

#train['bank'] <- data.frame(runif(120, min= 30, max = 70))
#trainData <- data.frame(rename(train, c('runif.120..min...0..max...2.' = 'Canada', 'bank' = 'wellsfargo')))
#trainData['result'] <- predict(ff.fit, trainData)
#summary(predict)
#predict.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = trainData$Canada * 6, type = 'scatter', mode = 'lines', height="600", name = "Canada") %>%
#  add_trace(y = trainData$wellsfargo/3, name = "wells fargi") %>%
#  add_trace(y = trainData$result, name = "unemploymentData")
#predict.fit <-lm(result ~ Canada + wellsfargo, data = trainData)
#summary(predict.fit)
