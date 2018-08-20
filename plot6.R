## In order to sucessfuly run the scripts make sure that you set your working directory
## in the directory where scripts are located, also make sure that data is present in data directory

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

baltimore <- subset(NEI, NEI$fips=="24510"&NEI$type == "ON-ROAD")
la <- subset(NEI, NEI$fips=="06037"&NEI$type == "ON-ROAD")

emission_limits <- c(0, max(max(la_total$x), max(bal_total$x)))

png("plots/plot6.png", width = 1000)

par(mfrow = c(1,2))
bal_total<-aggregate(baltimore$Emissions, list(baltimore$year), sum)
barplot(bal_total$x, names.arg = bal_total$Group.1, xlab = 'Year', ylab = "Total emission of PM2.5(in tons)", 
        main = "PM2.5 Motor Vehicle Source Emissions in Baltimore(1999-2008)", ylim = emission_limits)

la_total<-aggregate(la$Emissions, list(la$year), sum)
barplot(la_total$x, names.arg = la_total$Group.1, xlab = 'Year', ylab = "Total emission of PM2.5(in tons)", 
        main = "PM2.5 Motor Vehicle Source Emissions in Los-Angeles(1999-2008)",ylim = emission_limits)

dev.off()