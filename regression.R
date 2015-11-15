
data = read.csv('Westminster.csv', header=TRUE)
dataByCP = smubset(data, CP=='6119')
summary(dataByCP)
years = dataByCP[,1]
numberOfVehicles = dataByCP[,24]
meanNumberOfVehicles = mean(numberOfVehicles)
standardDeviation = sd(numbeOfVehicles) * sqrt((length(numberOfVehicles)-1)/length(numberOfVehicles))
y = dnorm(numberOfVehicles,mean=meanNumberOfVehicles, sd=standardDeviation)
plot(years,y, type="l", lwd=1)
