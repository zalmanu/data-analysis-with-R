library(RPostgreSQL)
library(zoo)
library(dplyr)
library(moments)

db_conn = dbConnect(dbDriver("PostgreSQL"), dbname = "nyc-citibike-data", host = "localhost")
run_query = function(query, conn = db_conn) {
  fetch(dbSendQuery(conn, query), n = 1e8)
}

# dataset size
total_trips = run_query("select count(*) from trips")[, "count"]

# first and last trip
first_trip_ts = run_query("select start_time from trips order by start_time asc limit 1")[, "start_time"]
last_trip_ts = run_query("select start_time from trips order by start_time desc limit 1")[, "start_time"]

daily_trips = run_query("select * from aggregate_data_with_weather")
monthly = rollsum(daily_trips$trips, k=31, na.pad=TRUE)
plot(monthly~daily_trips$date, type="line", xlab="Date", ylab="Trips")

par(mfrow=c(2,1))
monthly_active_bikes = run_query("select * from monthly_active_bikes")
plot(monthly_active_bikes, xlab="Date", ylab="Active Bikes", col="red")

monthly_active_stations = run_query("select * from monthly_active_stations")
plot(monthly_active_stations, xlab="Date", ylab="Active Stations", col="blue")
dev.off()  

duration = run_query("select trip_duration from trips")[, "trip_duration"]
duration = duration / 60
duration = duration[duration >= 2]
mean(duration) 
median(duration) 
summary(duration)
max(duration) / (60 * 24)
min(duration)

travel_info = run_query("select dist_meters, trip_duration, gender, age from distances limit 1000000")
travel_info = travel_info[travel_info$gender %in% c(1, 2), ]
travel_info = mutate(travel_info, gender=factor(gender, labels=c("male", "female")))
travel_info[, "speed"] = travel_info[, "dist_meters"] / travel_info[, "trip_duration"] * 18/5
travel_info = travel_info[travel_info$speed >=1, ]

men = travel_info[travel_info$gender=="male", ]
women = travel_info[travel_info$gender=="female", ]

summary(travel_info$age)
summary(men$age)
summary(women$age)

sd(travel_info$age)
sd(men$age)
sd(women$age)

skewness(travel_info$age)
skewness(men$age)
skewness(women$age)

par(mfrow=c(3, 1))
hist(travel_info$age, xlab="Varsta", ylab="Utilizatori", main="Hist varsta utilizatorilor City Bike")
hist(men$age, xlab="Varsta", ylab="Utilizatori", main="Hist varsta utilizatorilor de gen masculin")
hist(women$age, xlab="Varsta", ylab="Utilizatori", main="Hist varsta a utilizatorilor de gen feminin")
dev.off()

plot(density(na.omit(men$age)), col='blue', xlim=c(0, 100), ylim=c(0, 0.05), main="", xlab="Curba de densitate varsta barbati / femei")
par(new=TRUE)
plot(density(na.omit(women$age)), col='red', xlim=c(0, 100), ylim=c(0, 0.05), main="", xlab="")

dev.off()

summary(travel_info$speed)
sd(travel_info$speed)
skewness(travel_info$speed)
hist(travel_info$speed, 200, xlab="Viteza", ylab="Frecventa", main="Histograma viteza de deplaresare")
plot(density(travel_info$speed), xlab="Curba de densitate a vitezei", main="")
qqnorm(travel_info$speed)

men_to_test = sample_n(men, nrow(women))
t.test(men_to_test$speed, women$speed, alternative="greater")

speed = travel_info$speed
gender = travel_info$gender
age = travel_info$age 
trip_duration = travel_info$trip_duration
model = lm(speed~age+gender+trip_duration)

par(mfrow=c(2,1))
plot(model$residuals)
hist(model$residuals)
summary(model)

test1 = data.frame(gender="male", age=22, trip_duration=600)
test2 = data.frame(gender="male", age=50, trip_duration=1200)
test3 = data.frame(gender="female", age=50, trip_duration=1500)
test4 = data.frame(gender="male", age=80, trip_duration=1000)
predict(model, test1, interval="predict")
predict(model, test2, interval="predict")
predict(model, test3, interval="predict")
predict(model, test4, interval="predict")