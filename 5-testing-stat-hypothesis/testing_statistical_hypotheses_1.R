library(UsingR)
data("normtemp")

t.test(normtemp$temperature, mu=98.6, alt="l")

boxplot(normtemp$temperature~normtemp$gender)

m = subset(normtemp, normtemp$gender == 1)
f = subset(normtemp, normtemp$gender == 2)

t.test(f$temperature, m$temperature, mu=0, alt='g')

plot(normtemp$temperature~normtemp$hr)
cor(normtemp$temperature, normtemp$hr)
