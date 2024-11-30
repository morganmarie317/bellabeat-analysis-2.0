
user_min <- subset(daily_activity.csv, Id == 4057192912)
user_max <- subset(daily_activity.csv, Id == 4445114986)
install.packages('readxl')
library(readxl)
daily_activity <- read.csv("daily_activity.csv")
head(daily_activity)
str(daily_activity)

user_min <- subset(daily_activity, Id == 4057192912)
user_max <- subset(daily_activity, Id == 4445114986)

avg_steps <- data.frame(
  User = c("4057192912", "4445114986"),
  AvgSteps = c(mean(user_min$TotalSteps, na.rm = TRUE), mean(user_max$TotalSteps, na.rm = TRUE))
)


avg_calories <- data.frame(
  User = c("4057192912", "4445114986"),
  AvgCalories = c(mean(user_min$Calories, na.rm = TRUE), mean(user_max$Calories, na.rm = TRUE))
)
install.packages("ggplot2")
library(ggplot2)
ggplot(avg_steps, aes(x = User, y = AvgSteps, fill = User)) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(
    title = "Average Steps Comparison",
    x = "User ID",
    y = "Average Steps"
  ) +
  theme_minimal()

data_summary <- daily_activity %>%
  group_by(Id) %>%
  summarize(
    Entries = n(),
    AvgSteps = mean(TotalSteps, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  )


user_data <- data_summary %>% filter(Id %in% c(4057192912, 4445114986))
install.packages("dplyr")     
install.packages("tidyverse")  
library(dplyr)

data_summary <- daily_activity %>%
  group_by(Id) %>%
  summarize(
    Entries = n(),
    AvgSteps = mean(TotalSteps, na.rm = TRUE),
    AvgCalories = mean(Calories, na.rm = TRUE)
  )


user_data <- data_summary %>% filter(Id %in% c(4057192912, 4445114986))
library(ggplot2)


ggplot(user_data, aes(x = Entries, y = AvgSteps, color = as.factor(Id))) +
  geom_point(size = 4) +
  geom_text(aes(label = Id), vjust = -1) +  
  labs(
    title = "Entries vs. Average Steps",
    x = "Number of Entries",
    y = "Average Steps",
    color = "User ID"
  ) +
  theme_minimal()

ggplot(user_data, aes(x = Entries, y = AvgCalories, color = as.factor(Id))) +
  geom_point(size = 4) +
  geom_text(aes(label = Id), vjust = -1) +  # Add user ID labels
  labs(
    title = "Entries vs. Average Calories Burned",
    x = "Number of Entries",
    y = "Average Calories Burned",
    color = "User ID"
  ) +
  theme_minimal()
ggplot(avg_steps, aes(x = User, y = AvgSteps, fill = User)) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(
    title = "Average Steps Comparison",
    x = "User ID",
    y = "Average Steps"
  ) +
  theme_minimal()
ggplot(avg_calories, aes(x = User, y = AvgCalories, fill = User)) +
  geom_bar(stat = "identity", width = 0.5) +
  labs(
    title = "Average Calories Burned Comparison",
    x = "User ID",
    y = "Average Calories Burned"
  ) +
  theme_minimal()
