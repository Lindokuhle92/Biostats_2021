#Lindokuhle_Sibisi_R_assignment
#21 April 2021
#Author AJ Smit



#Section 1

#Built-in dataset BOD
library(tidyverse)
data("BOD")
Answer C is a true statement


#Section 2 

#Load the dplyr package & the murders dataset
library(dplyr)
library(dslabs)
data("murders")

glimpse(state.area)
glimpse(state.name)

tail(murders, 4)
tail(murders, 6)

head(murders, 10)
head(murders,3)

group_by(murders, state)
group_by(murders, population)

select(murders, region)
select(murders, population)

murder dataset - the data set is easy to work with, straight forward data and can be sorted in many different ways to get more specific or precise information to work with and create new datasets.


select(murders, state = 1,population = 4)

#Removing Florida
murders[murders$state != "Florida",]

#No south data frame
no_south <- murders[murders$region != "South",]
There are 34 states left in the data base and 17 states of south were removed. 


#Population size
murders %>% 
  filter(region == "South") %>% 
  summarise(south_pop = sum(population))

murders %>% 
  filter(region == "West") %>% 
  summarise(west_pop = sum(population))

#data frame
Northeast <- murders %>% 
  filter(region == "Northeast") %>% 
  summarise(northeast_pop = sum(population))


#Plots

library(tidyverse)
data("murders")
ggplot(data = murders, aes(x = state, y = population)) +
  geom_point() +
  geom_line(aes(group = region ))

second graph??????
  
  
#comparing South and West population size
  South population is higher than the west population

#total data frame 
Total <- murders %>% 
  filter(total > 20) %>% 
  filter(total < 100)

#create an object

create_object <- murders
slice(murders, c(10:24, 26))


#as_tibble
murders_tibble <- as_tibble(murders)

#group_by fucntion
tibble_region <- as_tibble(murders) %>% 
  group_by(region)



#Section 3

library(dplyr)
library(dslabs)
data("heights")


The height data is displaying a difference between two samples between males and females.

data("heights")

glimpse(heights)

head(heights, 7)
head(heights, 12)

tail(heights, 3)
tail(heights, 8)

group_by(heights, sex)

select(heights, sex) 

#average and standard deviation

heights %>% 
  summarise(med_wt = median(height))



#Section 4

#vectors
x <- c(1,6,21,19,NA,73,NA)
Y <- c(NA,NA,3,NA,13,24,NA)

summary(x)
summary(Y)


#missing numbers on both x and y
mean(x, na.rm = TRUE)

mean(Y, na.rm = TRUE)

#the function summary can be used to the above code.


x <- c(1,6,21,19,NA,73,NA)
Y <- c(NA,NA,3,NA,13,24,NA)

mean(x,Y)
median(x, Y)
average(x, Y)



#Section 5

easonal_data <- data.frame(year=c(2015,2016,2017,2018),
                            winter=c(41,39,47,40),
                            spring=c(41,46,57,45),
                            summer=c(75,52,85,66),
                            Autumn=c(57,66,52,56))


#hypothesis

This is assuming that the data given are the values of the lowest temperatures in each season and the highest temperatures also in each season. Depending if it is eithe evening or at night, for example we can say in winter in the morning the lowest temperature is 39 and the higest is 41, then in night the lowest temperature is 40 while the highest is 47. 




ggplot() +
  geom_line(data = easonal_data, aes(x = year, y = summer), color = "green") +
  labs(x = "Year", y = "Temperature (F)") +
  ggtitle("Average Winter temperatures over a period of 4 years (2015 to 2018)")


ggplot(data = easonal_data, aes(x = year, y = spring)) +
  geom_bar(stat = "identity", color = "orange", fill = "yellow") +
  ggtitle("Average spring temperature over a period of 4 years (2015 to 2018)")

#discuss findings
From the results we are getting from the first graph the line graph shows us the flacuation of the temperetures in summer in the past four years, both in 2016 and 2017 shows the most extreme curves or flactuations lowest and then being the highest. But on the secong graph we see a normal or acceptable change or flacuation of the temperature change in spring in the past four years. 






cats_data <- tibble(cats=c("A","B","C"),
                    position=c("1-2-3","3-1-2","2-3-1"),
                    minutes=c(3,3,3),
                    seconds=c(12,44,15))
cats_data


cats_data %>%  
  separate(col = position, into = c("first_place", "second_place", "third_place")) 

cats_data %>% 
  unite(minutes, seconds, col = "total_time",)
  




#Section 6


library(tidyverse)
Orange <- datasets::Orange

#data apply

gather(Orange, Tree)
gather function means to combine information into one or few columns.


Orange %>% 
separate(col = Tree, into = c("1", "2", "3", "4", "5")) 
separate fucntion would separete information found on a single column into different columns. 

Orange %>% 
  arrange(Tree, 5)
arrange function orders the rows of a data frame by the values of selected columns.

select(Orange, age)
This is when we choose specifically the information we want and shed everything else. 

Orange %>% 
  group_by(age, circumference)
This function is to create information that would only be helpful to you at that moment. 

Orange %>% 
mutate(col = Tree)
This function gives us a chance to combine information from the same column.  

Orange %>% 
  spread(key = Tree, value = 1)
spreading data means you are extending the column that has the same variable.

Orange %>% 
joining, by = c("Tree","age")
This function combines two column information.

















  
  
  