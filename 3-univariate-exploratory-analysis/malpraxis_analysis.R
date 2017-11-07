library(UsingR)
data("npdb")
attach(npdb)

cases_per_year = table(npdb$year)
pie(cases_per_year)

cases_per_state = table(npdb$state)
barplot(cases_per_state)

cases_per_doctor = table(npdb$ID)

top_states_by_cases = head(cases_per_state[order(-cases_per_state)])
top_doctors_by_cases = head(cases_per_doctor[order(-cases_per_doctor)])

top_10_by_amount = head(npdb[order(-amount), ], n=10)

hist(npdb)