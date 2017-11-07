library(UsingR)
data("kid.weights")

plot(kid.weights$weight~kid.weights$height)
cor(kid.weights$weight, kid.weights$height)
