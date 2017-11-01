# plot (sqrt(t) * sin(2*pi*t), sqrt(t) * cos(2*pi*t)), for t = 0 -> 20, 0.01
# plot the polygonal chain

s = seq(0, 20, by=0.01)

xfun <- function(t) {
  sqrt(t) * sin(2*pi*t);
}

yfun <- function(t) {
  sqrt(t) * cos(2*pi*t);
}

x_values = xfun(s)
y_values = yfun(s)

plot(x_values, y_values)
polygon(x_values, y_values)
