cp = '6119'
predict_yr = 2020
data = read.csv('Westminster.csv', header=TRUE)
dataByCP = subset(data, CP==cp)
years = dataByCP[,1]
numberOfVehicles = dataByCP[,24]
lse = lm(numberOfVehicles~years)
yfit = lse$fitted.values
png('RegressionPlot.png')
plot(years, numberOfVehicles)
lines(years, yfit)

newdata = expand.grid(years=c(predict_yr))
predict_val = predict(lse, newdata)
cat(paste(c("Predicted Value for year", predict_yr, "is", predict_val, "\n"), collapse=" "))
