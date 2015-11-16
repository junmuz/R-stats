

cp = '6119'
claim = 2000
alpha = 0.975
data = read.csv('Westminster.csv', header=TRUE)
dataByCP = subset(data, CP==cp)
years = dataByCP[,1]
numberOfVehicles = dataByCP[,24]
sampleSize = length(numberOfVehicles)
meanVehicles = mean(numberOfVehicles)
sdVehicles = sd(numberOfVehicles)* sqrt((sampleSize-1)/(sampleSize))
t_val = (meanVehicles - claim)/(sdVehicles/sqrt(sampleSize))
t_val = abs(t_val)
cat("t calculated value ")
cat(t_val)
cat("\n")
acceptance_region = 1-alpha
df = sampleSize-1
t_alpha = qt(acceptance_region, df=df)
t_alpha = abs(t_alpha)
cat("t critical value ")
cat(t_alpha)
cat("\n")
if(t_val > -t_alpha && t_val < t_alpha) {
    cat ("Null Hypothesis accepted and alternate hypothesis rejected\n")
} else {
    cat ("Null Hypothesis rejected and alternate hypothesis accepted\n")
}
