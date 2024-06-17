library(purrr)
input <- c(12, 6, 18)

map_dbl(
  seq_along(input), 
  ~ prod(input[1:.x]/sum(input[1:.x]))
)
