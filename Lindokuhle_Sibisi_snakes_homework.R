#20 April 2021
#dAY 2
#Author Amieroh
#Snakes homework



library(tidyverse)
library(plotly)
library(ggpubr)


snakes <- read_csv("data/snakes.csv")

snakes$day = as.factor(snakes$day)

snakes.summary <- snakes %>% 
  group_by(day, snake) %>% 
  summarise(mean_openings = mean(openings),
            sd_openings = sd(openings)) %>% 
  ungroup()


snakes.summary <- snakes %>% 
  group_by(day) %>% 
  summarise(mean_openings = mean(openings),
            sd_openings = sd(openings)) %>% 
  ungroup()


library(plyr)
library(lattice)
library(Rmisc)
library(tidyverse)
library(ggplot2)

snakes.summary2 <- summarySE(data = snakes, measurevar = "openings", groupvars = c("day"))

ggplot(data = snakes, aes(x = day, y = openings)) +
  geom_segment(data = snakes.summary2, aes(x = day, xend = day, y = openings - ci, yend = openings + ci, colour = day),
               size = 3.0, linetype = "solid", show.legend = F) +
  geom_boxplot(aes(fill = day), alpha = 0.4, show.legend = F) + 
  geom_jitter(width = 0.07)

snakes.aov <- aov(openings ~ day + snake, data = snakes)
summary(snakes.aov)


par(mfrow = c(2, 2))
snakes.res <- residuals(snakes.aov)
hist(snakes.res, col = "yellow")


plot(fitted(snakes.aov), residuals(snakes.aov), col = "blue")

snakes.tukey <- TukeyHSD(snakes.aov, which = "day", conf.level = 0.10)
plot(snakes.tukey, las = 1, col = "orange")








