library(PASWR)
data("Battery")

t.test(Battery$facilityA, Battery$facilityB, mu=-20, alt="l")