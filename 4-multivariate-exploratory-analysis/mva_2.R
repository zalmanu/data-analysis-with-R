# 2
library(UsingR)
data("reaction.time")
attach(reaction.time)

par(mfrow=c(3,1))
boxplot(time~age+control)
boxplot(time~gender+control)
boxplot(time~control)
