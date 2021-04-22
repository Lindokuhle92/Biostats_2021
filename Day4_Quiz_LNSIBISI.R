#Lindokuhle_Sibisi
#22 April 2021
#Day 4 Quiz




library(tidyverse)
library(plotly)
library(ggplot2)

package:datasets

#load data
Orange <- datasets::Orange
ToothGrowth <- datasets::ToothGrowth
warpbreaks <- datasets::warpbreaks

#Hypothesis
Does the type of tree affects the age or circumference in any way?

Orange %>%
  group_by(Tree)

Orange %>%
  group_by(Tree) %>%
  summarise(Tree_var = var(Orange))

Orange %>%
  group_by(Tree) %>%
  summarise(norm_Orange = as.numeric(shapiro.test(dat)[2]))
Orange %>%
  summarise(age)

ggplot(data = Orange, aes(x = age, fill = circumference)) +
  geom_histogram(position = "dodge", binwidth = 1, alpha = 0.8) +
  geom_density(aes(y = 1*..count.., fill = circumference), colour = NA, alpha = 0.4) +
  labs(x = "value")
shapiro.test(Orange$age)

ToothGrowth %>%
  summarise(dose)

ggplot(data = Orange, aes(x = dose, fill = supp)) +
  geom_histogram(position = "dodge", binwidth = 1, alpha = 0.8) +
  geom_density(aes(y = 1*..count.., fill = dose), colour = NA, alpha = 0.4) +
  labs(x = "value")
shapiro.test(ToothGrowth$dose)

warpbreaks %>%
  summarise(breaks)
shapiro.test(warpbreaks$breaks)

library(tidyverse)
library(ggpubr)
library(corrplot)

Orange %>%
  group_by(Tree)


#Question 2

library(tidyverse)
library(readr)
SACTN_data <- read_csv("data/SACTN_data.csv")
View(SACTN_data)

SACTN_data %>%
  group_by(site)


library(readr)
SACTN_data <- read_csv("data/SACTN_data.csv")
View(SACTN_data)
gather(key = "variable", value = "value", -src, -index, -date)

SACTN_daily_v4.2 %>% 
sites_1 <- site_list_clusters %>%
  filter(cluster == 1)
sites_2 <- site_list_clusters %>%
  filter(cluster == 2)
sites_3 <- site_list_clusters %>%
  filter(cluster == 3)
sites_4 <- site_list_clusters %>%
  filter(cluster == 4)
sites_5 <- site_list_clusters %>%
  filter(cluster == 5)
sites_6 <- site_list_clusters %>%
  filter(cluster == 6)



ggplot(data = SACTN_daily_v4.2, aes(x = date, y = temp)) +
  geom_line(aes(colour = index, group = paste0(index))) +
  labs(x = "", y = "Temperature (°C)", colour = "index") +
  theme_bw()

SACTN_daily_clusters <- SACTN_daily_v4.2 %>% 
  left_join(site_list[,c(1)], by = "index") %>% 
  filter(index %in% site_list_clusters$index)









