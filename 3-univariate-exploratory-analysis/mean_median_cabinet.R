# data source: package -- UsingR, dataset -- cabinet
library("UsingR")
data("cabinet")
attach(cabinet)

s = order(-est.tax.savings)
print(s)
sorted_by_savings = cabinet[order(-est.tax.savings), ]
mean_savings = mean(est.tax.savings)
median_savings = median(est.tax.savings)