life_expectancy = read.csv('~/Downloads/UNLifeExpectancy.csv')

names(life_expectancy)
par(mfrow=c(5,1))

# a)
hist(life_expectancy$LIFEEXP)
plot(density(life_expectancy$LIFEEXP))

# b)
hist(life_expectancy$HEALTHEXPEND)

# c)
plot(life_expectancy$LIFEEXP,life_expectancy$HEALTHEXPEND)
plot(life_expectancy$LIFEEXP, life_expectancy$FERTILITY)
