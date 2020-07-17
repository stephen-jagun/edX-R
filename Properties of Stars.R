library(tidyverse)
library(dslabs)
library(lattice)
library(ggrepel)
data(stars)
options(digits = 3)

# Question 1
# What is the mean magnitude?
mean(stars$magnitude)
# What is the standard deviation of magnitude?
sd(stars$magnitude)

# Question 2
# Make a density plot of the magnitude.
#  How many peaks are there in the data?
stars %>% ggplot(aes(x=magnitude)) +
  geom_density()
# 2

# Question 3
# Examine the distribution of star temperature.
#  Which of these statements best characterizes the temperature distribution?
stars %>%
  ggplot(aes(temp)) +
  geom_density()
# The majority of stars have a low temperature

# Question 4
# Make a scatter plot of the data with temperature on the x-axis and
#  magnitude on the y-axis and examine the relationship between the variables.
#  Recall that lower magnitude means a more luminous (brighter) star.
# Most stars follow a _______________ trend. These are called main sequence stars.
stars %>% ggplot(aes(x=temp, y=magnitude)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous("log10")
# decreasing exponential

# Question 8
# a
# The least lumninous star in the sample with a surface temperature over 5000K is _________.
stars %>% filter(temp>5000, magnitude>0) %>%
  ggplot(aes(x=temp, y=magnitude, label=star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous("log10") +
  geom_label_repel()

# b
# The two stars with lowest temperature and highest luminosity are known as supergiants.
#  The two supergiants in this dataset are ____________.
stars %>% filter(temp<5000, magnitude<0) %>%
  ggplot(aes(x=temp, y=magnitude, label=star)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous("log10") +
  geom_label_repel()

# Question 9
# Remove the text labels and color the points by star type. This classification describes
#  the properties of the star's spectrum, the amount of light produced at various wavelengths.
stars %>%
  ggplot(aes(x=temp, y=magnitude, color=type)) +
  geom_point() +
  scale_y_reverse() +
  scale_x_continuous("log10")