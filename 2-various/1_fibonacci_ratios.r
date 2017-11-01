# plot fn / fn-1, n = 2 -> 30, fn = nth fibonacci number
# plot y = (1 / sqrt(5)) / 2

n = 30
a = 1
b = 1
cnt = 2

fibs = c()

while (cnt <= n) {
  c = a + b
  fibs[cnt-1] = c / b
  a = b
  b = c
  cnt = cnt + 1
}

l = (1 + sqrt(5)) / 2

plot(fibs)
abline(h=l)
