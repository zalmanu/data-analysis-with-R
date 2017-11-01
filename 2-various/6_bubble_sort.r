array = 10:1
array_temp = array

bubble_sort <- function(array) {
  len = length(array)
  
  for (i in 1:(len-1)) {
    for (j in 1:(len-i)) {
      if (array[j] > array[j+1]) {
        temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      }
    }
  }
  
  return(array)
}

start = Sys.time()
print(bubble_sort(array))
print(Sys.time() - start)

start = Sys.time()
print(sort(array_temp))
print(Sys.time() - start)

