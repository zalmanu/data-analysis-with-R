library(MASS)
data("shoes")

plot(density(shoes$A))
plot(density(shoes$A))

t.test(shoes$A, shoes$B, mu=0, alt="t", paired=TRUE)
