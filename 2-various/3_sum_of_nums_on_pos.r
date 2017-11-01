x = c(1, 4, 2, 6, 8, 9, 11, 10, 21)
sum = 0

for (pos in 1:length(x)) {
  if (pos %% 3 == 0) {
    sum = sum + x[pos]
  }
}

print(sum)
