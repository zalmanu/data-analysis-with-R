library("MASS")
data("Cars93")
attach(Cars93)

# i) dataframe containting justManufacturer, Make, Price, Passengers, Origin
sub_dataframe = data.frame(Manufacturer, Make, Price, Passengers, Origin)

# ii) American cars
american_cars = subset(sub_dataframe, Origin == "USA")
print(american_cars)
american_cars_cnt = nrow(american_cars)
cat("American cars count: ", american_cars_cnt)

# iii) Ford models
ford_models = subset(sub_dataframe, Manufacturer == "Ford", select=Make)
print(ford_models)

# iv) Cars with passengers capacity >= 5, sorted by price
cars_with_capacity_at_least_5 = subset(sub_dataframe, Passengers >= 5)
sorted_by_price = cars_with_capacity_at_least_5[order(cars_with_capacity_at_least_5$Price), ]
print(sorted_by_price)
