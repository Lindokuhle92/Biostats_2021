#20 April 2021
#Day 2 Quiz


#Question 1

(a)Numerical data is the quantitative data, the type of data that can me counted and be able to measure.
examples - dates and a number of popolation.
(b)Qualitative data is the type of data where you can name the subject or put subjects under one category.
example - the colour of the flower 
(c)Binary data this is the type of data where there should be two outcomes from the question asked.
example - yes or no / negative or positive
(d)Character values is the type of data where words are used to put the data into perspective.
example - instead of mentioning all the animals in the data we can just say species or if we talking about plants, instead of mentioning all plants we can specifically say green plants.
(e)Missing values is when we do not have the full information about the data we using, instead of saying it is not there we can just use N/A to represent the missing information.
(f)Complex numbers is the type of data that is complicated and not easy to use, but there are techniques we can use to make it work.
example - we can group the information or choose specific parts we want. 


#List of functions
group_by
summarise
mutate
filter
range
head
tail
glimpse
select
colnames


#Discuss
Skewness - refers to that is the curve is shifted to the right or left then it is skewed. This is to tell us how normal or abnormal the data is.
Kurtosis - describes the last part or tail information of the data. This represents the sharpness of the peak of the curve


#Question 2

library(tidyverse)
Orange <- datasets::Orange

this is the numerical data class

#first 6 rows
head(Orange, 6)
tail(Orange, 6)
glimpse(Orange$Tree)
glimpse(Orange$age)
glimpse(Orange$circumference)
Orange %>% 
  summarise(sample_var = var(Orange))

library(e1071)
skewness(Orange$circumference)

library(e1071)
kurtosis(Orange$circumference)


range(Orange$circumference)
Orange %>% 
  summarise(lower_wt = range(circumference)[1],
            upper_wt = range(circumference)[2])


ggplot(data = Orange, aes(x = tree, y = value, fill = circumference)) +
  geom_boxplot() +
  coord_flip()






