library(datasets)
data("chickwts")
attach(chickwts)

boxplot(weight~feed)
summary(aov(weight~feed))
pairwise.t.test(weight, feed)