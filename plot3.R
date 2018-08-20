## In order to sucessfuly run the scripts make sure that you set your working directory
## in the directory where scripts are located, also make sure that data is present in data directory
library(ggplot2)

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

png("plots/plot3.png")

total<-aggregate(NEI$Emissions, list(NEI$year, NEI$type), sum)
g<-ggplot(total, aes(y = x, x = Group.1))
g+geom_point(aes(color = factor(Group.2)), size = 5)+geom_line(aes(color = factor(Group.2)))+
  labs(x = "Year", y = "Total PM2.5 Emission", title = "Emission type comparison")

dev.off()
