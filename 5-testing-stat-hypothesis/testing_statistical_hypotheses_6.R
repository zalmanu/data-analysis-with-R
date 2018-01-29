library(MASS)
data("anorexia")
attach(anorexia)

gains = Postwt - Prewt
summary(aov(gains~Treat))
pairwise.t.test(gains, Treat)
