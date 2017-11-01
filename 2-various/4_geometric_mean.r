arr = 1:3

all_are_positive <- function(array) {
  positive = arr[arr>0]
  length(array) == length(positive)
}

if (all_are_positive(arr)) {
  geometric_mean = prod(arr) ^ (1 / length(arr))
  print(geometric_mean)
} else {
  print("Not all numbers are positive")
}
