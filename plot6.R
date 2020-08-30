NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot6.png", width=480, heigh=480)

library(tidyverse)
library(plyr)

LABAL <- NEI %>% filter(NEI$fips %in% c("24510","06037"))
LABALmot <- LABAL %>% filter(LABAL$type=="ON-ROAD")

LABALmTotByYear <- ddply(LABALmot, .(year,fips), function(x) sum(x$Emissions))

colnames(LABALmTotByYear)[3] <- "TotalEmissions"

ggplot(LABALmTotByYear, aes(year, TotalEmissions, col=fips)) +
        geom_line()+
        ggtitle("Los Angeles & Baltimore - Total Motor Vehicle PM2.5 Emissions by Year")+
        labs(x="Year", y="Total Motor Vehicle PM2.5 Emissions (tons)")+
        scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) 

dev.off()