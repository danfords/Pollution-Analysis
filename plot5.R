## In order to sucessfuly run the scripts make sure that you set your working directory
## in the directory where scripts are located, also make sure that data is present in data directory

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510"&NEI$type == "ON-ROAD")

png("plots/plot5.png")

total_emission<-aggregate(baltimore$Emissions, list(baltimore$year), sum)
barplot(total_emission$x, names.arg = total_emission$Group.1, xlab = 'Year', ylab = "Total emission of PM2.5(in tons)", 
        main = "PM2.5 Motor Vehicle Source Emissions in Baltimore(1999-2008)")

dev.off()
