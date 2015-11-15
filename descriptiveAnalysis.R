cp = '6119'
data = read.csv('Westminster.csv', header=TRUE)
dataByCP = subset(data, CP==cp)
summary(dataByCP)

years = dataByCP[,1]
numberOfVehicles = dataByCP[,24]

# BAR plot
png('BarPlot.png')
barplot(numberOfVehicles, main=paste(c("Number of Vehicles (",cp, ")"), collapse=" "),names.arg=years)

# Histogram
png('Histogram.png')
hist(numberOfVehicles)

# Line Chart
png('PointChart.png')
plot(years, numberOfVehicles)

# Pie Chart
png('PieChart.png')
pie(numberOfVehicles, main=paste(c("Number of Vehicles (",cp,")"), collapse=" "),labels=years)

meanNumberOfVehicles = mean(numberOfVehicles)
standardDeviation = sd(numberOfVehicles) * sqrt((length(numberOfVehicles)-1)/length(numberOfVehicles))
sortedNumVehicles = sort(numberOfVehicles)
normalDistribution = dnorm(sortedNumVehicles,mean=meanNumberOfVehicles, sd=standardDeviation)
png('normalDistribution.png')
plot(sortedNumVehicles,normalDistribution, type="l", lwd=1)
dev.off()
