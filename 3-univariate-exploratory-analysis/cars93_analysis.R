library(moments)
data("Cars93")
attach(Cars93)

Manufacturer # table
Type         # 
AirBags      # 
Origin       # 

measure <- function(tb) {
  print("Mean: ")
  print(mean(tb))
  
  print("Median: ")
  print(median(tb))
  
  print("Quantile: ")
  print(quantile(tb))
  
  print("Standard deviation: ")
  print(sd(tb))
  
  print("Skewness: ")
  print(skewness(tb))
}

measure(Price)
measure(Horsepower)
measure(Weight)

visualize <- function(tb) {
  par(mfrow=c(3,1))
  hist(tb)
  plot(density(tb))
  boxplot(tb)
} 

visualize(Price)
visualize(Horsepower)

qqnorm(Luggage.room)
