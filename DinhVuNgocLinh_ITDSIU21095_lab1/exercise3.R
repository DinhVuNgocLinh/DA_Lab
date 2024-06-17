library(tibble)
a <- sample(1:50, 10)
b <- integer(length(a))
for (i in 1: length(a)){
  if (i == length(a)){
    b[i] = (a[i-1]+a[i]+0)/3
  }else{
    b[i] = (sum(a[(i-1):(i+1)]))/3
  }
}
my_tibble <- tibble(a=a, b=b)
my_tibble
