
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



summary(NEI)
summary(SCC)
head(NEI)
head(SCC)

baltimore <- subset(NEI, fips == "24510")


agg <- aggregate(Emissions ~ year,baltimore, sum)



png("plot3.png",width=480,height=480,units="px",bg="transparent")


library(ggplot2)

ggp <- 
        ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill="none")+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y="Total PM2.5 Emission (Tons)") + 
        labs(title="PM2.5 Emissions, Baltimore City 1999-2008 by Source Type")

print(ggp)



dev.off()