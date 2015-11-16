cp = '6119'
claim = 2000
alpha = 0.40
data = read.csv('Westminster.csv', header=TRUE)
dataByCP = subset(data, CP==cp)
years = dataByCP[,1]
numberOfVehicles = dataByCP[,24]
sampleSize = length(numberOfVehicles)
meanVehicles = mean(numberOfVehicles)
sdVehicles = sd(numberOfVehicles)* sqrt((sampleSize-1)/(sampleSize))
t_val = (meanVehicles - claim)/(sdVehicles/sqrt(sampleSize))
acceptance_region = 1-alpha
df = sampleSize-1
t.alpha = qt(acceptance_region, df=df)
if(t_val > -t.alpha && t_val < t.alpha) {
    cat ("Null Hypothesis accepted and alternate hypothesis rejected\n")
} else {
    cat ("Null Hypothesis rejected and alternate hypothesis accepted\n")
}
