## In order to sucessfuly run the scripts make sure that you set your working directory
## in the directory where scripts are located, also make sure that data is present in data directory

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510")

png("plots/plot2.png")

##tells R to not abbreviate axis values
options(scipen=10000)

total_emission<-aggregate(baltimore$Emissions, list(baltimore$year), sum)
plot(total_emission, xlab = 'Year', ylab = "Total emission of PM2.5(in tons)", main = "PM2.5 total emission in Baltimore", pch = 19)
lines(total_emission)

dev.off()