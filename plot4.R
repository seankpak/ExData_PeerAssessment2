NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(file="plot4.png", width=480, heigh=480)

SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
NEI.coal <- NEI[NEI$SCC %in% SCC.coal$SCC,]

coalTotByYear <- ddply(NEI.coal, .(year,type), function(x) sum(x$Emissions))

colnames(coalTotByYear)[3] <- "TotalEmissions"

qplot(year, TotalEmissions, data = coalTotByYear, color = type,xlab="Year", ylab="Total Coal PM2.5 Emissions (tons)", 
      main="United States - Total Coal PM2.5 Emissions by Type and Year", geom="line") 


dev.off()


