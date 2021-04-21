#Day 3
#21 April 2021

#load library
library(tidyverse)

#load data
data("faithful")

#functions
head(faithful)


eruption.lm <- lm(eruptions ~ waiting, data = faithful)
summary(eruption.lm)

#graph

slope <- round(eruption.lm$coef[2], 3)
# p.val <- round(coefficients(summary(eruption.lm))[2, 4], 3) # it approx. 0, so...
p.val = 0.001
r2 <- round(summary(eruption.lm)$r.squared, 3)


ggplot(data = faithful, aes(x = waiting, y = eruptions)) +
  geom_point() +
  annotate("text", x = 45, y = 5, label = paste0("slope == ", slope, "~(min/min)"), parse = TRUE, hjust = 0) +
  annotate("text", x = 45, y = 4.75, label = paste0("italic(p) < ", p.val), parse = TRUE, hjust = 0) +
  annotate("text", x = 45, y = 4.5, label = paste0("italic(r)^2 == ", r2), parse = TRUE, hjust = 0) +
  stat_smooth(method = "lm", colour = "salmon") +
  labs(title = "Old Faithful eruption data",
       subtitle = "Linear regression",
       x = "Waiting time (minutes)",
       y = "Eruption duration (minutes)")



# use the accessor function to grab the coefficients:
erupt.coef <- coefficients(eruption.lm)
erupt.coef


# how long would an eruption last of we waited, say, 80 minutes?
waiting <- 80 

# the first and second coef. can be accessed using the 
# square bracket notation:
erupt.pred <- erupt.coef[1] + (erupt.coef[2] * waiting)
erupt.pred # the unit is minutes


pred.val <- data.frame(waiting = c(60, 80, 100))
predict(eruption.lm, pred.val) # returns waiting time in minutes


summary(eruption.lm)$r.squared



library(tidyverse)

n <- 100
set.seed(666)
rand.df <- data.frame(x = seq(1:n),
                      y = rnorm(n = n, mean = 20, sd = 3))
ggplot(data = rand.df, aes(x = x, y = y)) +
  geom_point(colour = "blue") +
  stat_smooth(method = "lm", colour = "purple", size = 0.75, fill = "turquoise", alpha = 0.3) +
  labs(title = "Random normal data",
       subtitle = "Linear regression",
       x = "X (independent variable)",
       y = "Y (dependent variable)")


pred.val <- data.frame(waiting = c(80))
predict(eruption.lm, pred.val, interval = "confidence")


pred.val <- data.frame(waiting = c(80))
predict(eruption.lm, pred.val, interval = "prediction")


#Chapter 9

# Load libraries
library(tidyverse)
library(ggpubr)
library(corrplot)

# Load data
ecklonia <- read_csv("data/ecklonia.csv")


ecklonia_sub <- ecklonia %>% 
  select(-species, - site, - ID)


cor.test(x = ecklonia$stipe_length, ecklonia$frond_length,
         use = "everything", method = "pearson")


ecklonia_pearson <- cor(ecklonia_sub)
ecklonia_pearson


#Kendall 

ecklonia_norm <- ecklonia_sub %>% 
  gather(key = "variable") %>% 
  group_by(variable) %>% 
  summarise(variable_norm = as.numeric(shapiro.test(value)[2]))
ecklonia_norm


cor.test(ecklonia$primary_blade_length, ecklonia$primary_blade_width, method = "kendall")


#visual

# Calculate Pearson r beforehand for plotting
r_print <- paste0("r = ", 
                  round(cor(x = ecklonia$stipe_length, ecklonia$frond_length),2))


# Then create a single panel showing one correlation
ggplot(data = ecklonia, aes(x = stipe_length, y = frond_length)) +
  geom_smooth(method = "lm", colour = "grey90", se = F) +
  geom_point(colour = "mediumorchid4") +
  geom_label(x = 300, y = 240, label = r_print) +
  labs(x = "Stipe length (cm)", y = "Frond length (cm)") +
  theme_pubclean()


#multiple visuals

corrplot(ecklonia_pearson, method = "circle")


#Exercise

#Producing a heat map using ggplot2

library(dplyr)
library(ggplot2)
library(reshape)
library(hrbrthemes)



ecklonia_pearson <- cor(ecklonia_sub)
ecklonia_pearson


#Heatmap 


ecklonia_pearson <- cor(ecklonia_sub)
ecklonia_pearson

melted <- melt(ecklonia_pearson)

ggplot(data = melted, mapping = aes(X1, X2, fill = value)) +
  geom_tile()



#New work

#first install plyr package
#then load package

library(plyr)
(dlply)

#understand

function (.data, .variables, .fun = NULL, ..., .progress = "none", 
          .inform = FALSE, .drop = TRUE, .parallel = FALSE, .paropts = NULL) 
{
  .variables <- as.quoted(.variables)
  pieces <- splitter_d(.data, .variables, drop = .drop)
  llply(.data = pieces, .fun = .fun, ..., .progress = .progress, 
        .inform = .inform, .parallel = .parallel, .paropts = .paropts)
}
















