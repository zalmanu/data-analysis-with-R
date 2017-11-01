is_prime <- function(num) {
  if (num <= 1) {
    return(FALSE);
  }
  
  if (num == 2) {
    return(TRUE);
  }
  
  for (i in 2:sqrt(num)) {
    if (num %% i == 0) {
      return (FALSE)
    }
  }
  
  return(TRUE)
}

print(is_prime(2))
print(is_prime(3))
print(is_prime(4))
print(is_prime(5))