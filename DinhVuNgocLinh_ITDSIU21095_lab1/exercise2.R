# a.
even_sum <- function(num1, num2){
  sum = num1 + num2
  if (sum %% 2 == 0){
    return("even numbers")
  }
  else{
    return(" not even numbers")
  }
}
print(even_sum(6,4))
print(even_sum(6,9))
# b.
apply_sum <- function(x, operation1, operation2) {
  result <- operation1(x) + operation2(x)
  return(result)
}
print(apply_sum(4,sqrt, log))
#Call the function new_applier_function with input = 1:3 and an anonymous function that returns 
#just the first two elements of the input vector in reverse order (as a vector).

# define a function that takes a vector and a function as an argument
new_applier_function <- function(input, function_to_apply) {
  # check if input vector has at least 2 elements
  if (length(input) <= 1) {
    # terminate and show informative error message
    stop("Error in 'new_applier_function': input vector has length <= 1.")
  }
  # otherwise apply the function to the input vector
  return(function_to_apply(input))
}
new_applier_function(
  input = 1:3, # input vector
  function(x){
    rev(x[1:2])
  }
)
print(new_applier_function)
