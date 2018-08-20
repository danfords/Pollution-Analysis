## In order to sucessfuly run the scripts make sure that you set your working directory
## in the directory where scripts are located, also make sure that data is present in data directory

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustionSCC <- SCC[coal,]$SCC
coalNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plots/plot4.png")

total_emission<-aggregate(coalNEI$Emissions, list(coalNEI$year), sum)
barplot(total_emission$x, names.arg = total_emission$Group.1, xlab = 'Year', ylab = "Total emission of PM2.5(in tons)", 
        main = "Coal Combustion Source Emissions Across US")

dev.off()
