NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot2.png", width=480, heigh=480)

library(tidyverse)
Baltimore <- NEI %>% filter(NEI$fips==24510)
BaltiEm <- tapply(Baltimore$Emissions, Baltimore$year, FUN=sum)
plot(names(BaltiEm), BaltiEm,type="l", xlab="Year", ylab="Total PM2.5 Emissions (tons)", main="Baltimore - Total PM2.5 Emissions by Year")

dev.off()