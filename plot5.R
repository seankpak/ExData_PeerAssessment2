NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot5.png", width=480, heigh=480)

library(tidyverse)
library(plyr)

Baltimore <- NEI %>% filter(NEI$fips==24510) 
BaltiMot <- Baltimore %>% filter(Baltimore$type=="ON-ROAD")

motTotByYear <- ddply(BaltiMot, .(year), function(x) sum(x$Emissions))

colnames(motTotByYear)[2] <- "TotalEmissions"

qplot(year, TotalEmissions, data = motTotByYear,xlab="Year", ylab="Total Motor Vehicle PM2.5 Emissions (tons)", 
      main="United States - Total Motor Vehicle PM2.5 Emissions by Year", geom="line") 



dev.off()