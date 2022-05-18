
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



summary(NEI)
summary(SCC)
head(NEI)
head(SCC)




plot(NEI$year,NEI$Emissions, type = "p")
plot(NEI$year,log10(NEI$Emissions), type = "p")

agg <- aggregate(Emissions ~ year,NEI, sum)
agg
plot(agg$Emissions~agg$year, type ="l")
barplot(agg$Emissions~agg$year, xlab = "year", ylab= "Emissions")


png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
        (agg$Emissions)/10^6,
        names.arg=agg$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)


dev.off()
