
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



summary(NEI)
summary(SCC)
head(NEI)
head(SCC)

baltimore <- subset(NEI, fips == "24510")


agg <- aggregate(Emissions ~ year,baltimore, sum)
agg
plot(agg$Emissions~agg$year, type ="l")
barplot(agg$Emissions~agg$year, xlab = "year", ylab= "Emissions")


png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
        (agg$Emissions)/10^6,
        names.arg=agg$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons) ",
        main="Total PM2.5 Emissions From all Baltimore City Sources"
)


dev.off()