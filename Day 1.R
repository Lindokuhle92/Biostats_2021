#Day 1
#Author: AJ Smit 
#19 April 2021
#Examples of data set available



#Load built-in data as an R object


pine <- Loblolly

library(tidyverse)
chicks <- as_tibble(ChickWeight)

#note the distinction 'nrow() and the 'true' sample

nrow(chicks)
unique(chicks$chick)

#Above, what is the difference between the two?



#mean for the chickens

library(tidyverse)
chicks %>% 
  filter(Time == 20)
group_by(Diet)  
chicks %>% 
  summarise(mean_wt = mean(weight))
mean(chicks$weight)
chicks %>% 
  summarise(mean_wt = round(mean(weight), 1))
chicks %>% 
  summarise(med_wt = median(weight))
kurtosis(chicks$weight)
quantile(chicks$weight)
chicks %>% 
  summarise(min_wt = min(weight),
            qrt1_wt = quantile(weight, p = 0.25),
            med_wt = median(weight),
            qrt3_wt = quantile(weight, p = 0.75),
            max_wt = max(weight))

range(chicks$weight)
chicks %>% 
  summarise(lower_wt = range(weight)[1],
            upper_wt = range(weight)[2])


dat1 <- c(NA, 12, 76, 34, 23)

# Without telling R to ommit missing data
mean(dat1)
dat1 <- c(NA, 12, 76, 34, 23)
# Ommitting the missing data
mean(dat1, na.rm = TRUE)

as_tibble 






  
