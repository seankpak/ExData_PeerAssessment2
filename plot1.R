NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot1.png", width=480, heigh=480)

totalEm <- tapply(NEI$Emissions, NEI$year, FUN=sum)
plot(names(totalEm), totalEm,type="l", xlab="Year", ylab="Total PM2.5 Emissions (tons)", main="United States - Total PM2.5 Emissions by Year")

dev.off()