
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



summary(NEI)
summary(SCC)
head(NEI)
head(SCC)


combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)

combustion.coal.sources <- SCC[combustion.coal,]



emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]

library(dplyr)
require(dplyr)

emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))

png("plot4.png",width=480,height=480,units="px",bg="transparent")


library(ggplot2)

ggp <- 
        
        ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
        geom_bar(stat="identity") +
        #geom_bar(position = 'dodge')+
        # facet_grid(. ~ year) +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
        ggtitle("Emissions from coal combustion-related sources in kilotons")+
        geom_label(aes(fill = year),colour = "white", fontface = "bold")


print(ggp)



dev.off()