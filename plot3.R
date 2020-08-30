NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot3.png", width=480, heigh=480)

library(tidyverse)
library(plyr)

Baltimore <- NEI %>% filter(NEI$fips==24510)
typeTotByYear <- ddply(Baltimore, .(year,type), function(x) sum(x$Emissions))
colnames(typeTotByYear)[3] <- "TotalEmissions"

qplot(year, TotalEmissions, data = typeTotByYear, color = type,xlab="Year", ylab="Total PM2.5 Emissions (tons)", 
      main="Baltimore - Total PM2.5 Emissions by Type and Year", geom="line") 


dev.off()


