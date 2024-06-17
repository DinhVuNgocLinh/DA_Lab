library(magrittr)
library(stringr)
weird_RTs <- c("RT = 323", "RT = 345", "RT = 421", "RT = 50")
weird_RTs %>% str_sub( start = 6) %>% as.numeric() %>% log() %>% mean() %>% round(2)
