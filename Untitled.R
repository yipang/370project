library(dplyr);
library(plotly);
library(ggplot2);
library(plyr)

masterCur <- read.csv('data/currency/MASTERCSV.csv')
unemploy <- read.csv('data/unemployment/unemployment.csv')
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

#plot for india vs unempoyment rate'
India.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$India, type = 'scatter', mode = 'lines', height="600", name = "India") %>%
          add_trace(y = masterCur$unemployment, name = "unemploymentData")
India.modLin <- lm(unemploymentRate ~ India, data = masterCur)
#plot for Japan vs unempoyment rate
Japan.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Japan, type = 'scatter', mode = 'lines', height="600", name = "Japan") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Japan.modLin <- lm(unemploymentRate ~ Japan, data = masterCur)
#plot for China vs unempoyment rate
China.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$China, type = 'scatter', mode = 'lines', height="600", name = "China") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
China.modLin <- lm(unemploymentRate ~ China, data = masterCur)
#plot for Korea vs unempoyment rate
Korea.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Korea, type = 'scatter', mode = 'lines', height="600", name = "Korea") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Korea.modLin <- lm(unemploymentRate ~ Korea, data = masterCur)
#plot for Canada vs unempoyment rate
Canada.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Canada, type = 'scatter', mode = 'lines', height="600", name = "Canada") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Canada.modLin <- lm(unemploymentRate ~ Canada, data = masterCur)
#plot for Brazil vs unempoyment rate
Brazil.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Brazil, type = 'scatter', mode = 'lines', height="600", name = "Brazil") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Brazil.modLin <- lm(unemploymentRate ~ Brazil, data = masterCur)
#plot for Russia vs unempoyment rate
Russia.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$Russia, type = 'scatter', mode = 'lines', height="600", name = "Russia") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
Russia.modLin <- lm(unemploymentRate ~ Russia, data = masterCur)
#plot for European.Union vs unempoyment rate
EU.line <- plot_ly(ggplot2::diamonds, x = masterCur$X, xaxis = 'date', y = masterCur$European.Union, type = 'scatter', mode = 'lines', height="600", name = "European.Union") %>%
  add_trace(y = masterCur$unemployment, name = "unemploymentData")
EU.modLin <- lm(unemploymentRate ~ European.Union, data = masterCur)

