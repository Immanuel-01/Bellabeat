library(tidyverse)
library(here)
library(janitor)
library(lubridate)
library(ggplot2)
library(skimr)
library(ggpubr)

daily_activity <- read_csv("dailyActivity_merged.csv")
daily_steps <- read_csv("dailySteps_merged.csv")
hourly_calories <- read_csv("hourlyCalories_merged.csv")
hourly_intensities <- read_csv("hourlyIntensities_merged.csv")
sleep_day <- read_csv("sleepDay_merged.csv")
hourly_steps <- read_csv("hourlySteps_merged.csv")

View(daily_activity)
View(daily_steps)
View(hourly_calories)
View(hourly_intensities)
View(sleep_day)
View(hourly_steps)


str(daily_activity)
str(daily_steps)
str(hourly_calories)
str(hourly_intensities)
str(sleep_day)
str(hourly_steps)


head(daily_activity)
head(daily_steps)
head(hourly_calories)
head(hourly_intensities)
head(sleep_day)
head(hourly_steps)


tail(daily_activity)
tail(daily_steps)
tail(hourly_calories)
tail(hourly_intensities)
tail(sleep_day)
tail(hourly_steps)


glimpse(sleep_day)

unique(daily_activity$Id)

n_unique(daily_activity$Id)
n_unique(daily_steps$Id)
n_unique(hourly_calories$Id)
n_unique(hourly_intensities$Id)
n_unique(sleep_day$Id)
n_unique(hourly_steps$Id)


duplicated(daily_activity)
duplicated(daily_steps)
duplicated(hourly_calories)
duplicated(hourly_intensities)
duplicated(sleep_day)
duplicated(hourly_steps)


sum(duplicated(daily_activity))
sum(duplicated(daily_steps))
sum(duplicated(hourly_calories))
sum(duplicated(hourly_intensities))
sum(duplicated(sleep_day))
sum(duplicated(hourly_steps))


# Remove duplicates and drop the missing values

daily_activity <- daily_activity %>% 
  distinct() %>% 
  drop_na()

daily_steps <- daily_steps %>% 
  distinct() %>% 
  drop_na()

hourly_calories <- hourly_calories %>% 
  distinct() %>% 
  drop_na()

hourly_intensities <- hourly_intensities %>% 
  distinct() %>% 
  drop_na()

sleep_day <- sleep_day %>% 
  distinct() %>% 
  drop_na()

hourly_steps <- hourly_steps %>% 
  distinct() %>% 
  drop_na()

# Cleaning Verification

sum(is.na(daily_activity))
sum(is.na(daily_steps))
sum(is.na(hourly_calories))
sum(is.na(hourly_intensities))
sum(is.na(sleep_day))

today()

daily_activity$ActivityDate <- as_date(daily_activity$ActivityDate, format = "%m/%d/%Y")
daily_steps$ActivityDay <- as_date(daily_steps$ActivityDay, format = "%m/%d/%Y")
hourly_calories$ActivityHour <- as.POSIXct(hourly_calories$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
hourly_intensities$ActivityHour <- as.POSIXct(hourly_intensities$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
sleep_day$SleepDay <- as.POSIXct(sleep_day$SleepDay, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
hourly_steps$ActivityHour <- as.POSIXct(hourly_steps$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))


# Rename columns and change them to lower cases

clean_names(daily_activity)
daily_activity <- rename_with(daily_activity, tolower)

clean_names(daily_steps)
daily_steps <- rename_with(daily_steps, tolower)

clean_names(hourly_calories)
hourly_calories <- rename_with(hourly_calories, tolower)

clean_names(hourly_intensities)
hourly_intensities <- rename_with(hourly_intensities, tolower)

clean_names(sleep_day)
sleep_day <- rename_with(sleep_day, tolower)

clean_names(hourly_steps)
hourly_steps <- rename_with(hourly_steps, tolower)

# Rename columns

colnames(daily_activity)
daily_activity <- rename(daily_activity, date = activitydate)

colnames(daily_steps)
daily_steps <- rename(daily_steps, date = activityday)

colnames(hourly_calories)
hourly_calories <- rename(hourly_calories, date_time = activityhour)

colnames(hourly_intensities)
hourly_intensities <- rename(hourly_intensities,  date_time = activityhour)

colnames(sleep_day)
str(sleep_day)
sleep_day <- rename(sleep_day, date = sleepday)

colnames(hourly_steps)
hourly_steps <- rename(hourly_steps, date_time = activityhour)

# we will not use the daily_steps dataset because it is a subset of daily_activity dataset

# merging our daily_activity and sleep_day datasets together

daily_activity_steps <- merge(daily_activity, sleep_day, by = c("id", "date"))

# Analyze

daily_activity %>% 
  select(totalsteps, 
         veryactiveminutes,
         fairlyactiveminutes,
         lightlyactiveminutes,
         sedentaryminutes) %>% 
  summary()

summary(daily_activity_steps$totalminutesasleep)

hourly_calories %>% 
  select(calories) %>% 
  summary()

top_user_daily_activity_steps <- daily_activity_steps %>% 
  arrange(desc(daily_activity_steps)) %>% 
  head(10)

show_me <- daily_activity_steps %>% 
  group_by(id, veryactiveminutes, fairlyactiveminutes, lightlyactiveminutes, sedentaryminutes) %>% 
  summarise(total_steps = sum(totalsteps)) %>% 
  arrange(desc(total_steps))

# Discoveries
#average total step in a day is 7,638
#maximum steps in a day is 36,019
#majority of the participants are sedentary users
#The maximum number of very active minutes recorded in a day is 210.
#The maximum number of sedentary minutes recorded in a day is 1,440 (which is equivalent to 24 hours, indicating a full day of inactivity).
#The average number of very active minutes recorded per day is 21.16 minutes.
#The average number of sedentary minutes is 991.2.
#the average sleep duration is approximately 418.4 minutes.
#the least amount of sleep recorded for any user is 58 minutes. this is not good
#the maximum recorded sleep duration for any user is 796 minutes.
#average calorie burned in an hour is 97? is it good?

ggplot(daily_activity_steps, aes(x = totalsteps, y = veryactiveminutes, color = veryactiveminutes, size = veryactiveminutes)) + 
  geom_point()
  
ggplot(daily_activity_steps, aes(x = totalsteps, y = fairlyactiveminutes, color = fairlyactiveminutes, size = fairlyactiveminutes)) + 
  geom_point()

ggplot(daily_activity_steps, aes(x = totalsteps, y = lightlyactiveminutes, color = lightlyactiveminutes)) + 
  geom_point() + 
  geom_smooth() +
  labs(title = "Total Steps VS Lightly Active Minutes")

ggplot(daily_activity_steps, aes(x = totalsteps, y = sedentaryminutes)) +
  geom_point() +
  labs(title = "Total Steps VS Sedentary Minutes") + 
  theme_minimal()

# calories burned

ggplot(daily_activity_steps, aes(x = totalsteps, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Total Steps vs. Calories Burned")

summary(daily_activity_steps$totalsteps)  # checekd for outliers, saw that my range is okay and well represented on my plots

ggplot(daily_activity_steps, aes(x = totalsteps, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Total Steps vs. Calories Burned")



ggplot(daily_activity_steps, aes(x = veryactiveminutes, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Very Active Minutes vs. Calories Burned")

ggplot(daily_activity_steps, aes(x = fairlyactiveminutes, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Fairly Active Minutes vs. Calories Burned")

ggplot(daily_activity_steps, aes(x = lightlyactiveminutes, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Lightly Active Minutes vs. Calories Burned")

ggplot(daily_activity_steps, aes(x = sedentaryminutes, y = calories)) + 
  geom_point() +
  geom_smooth() +
  labs(title = "Sedentary Active Minutes vs. Calories Burned")

summary(daily_activity_steps$sedentaryminutes) # checking to see if its an accurate representation

# graphs and correlations remaining, check you AI

cor(daily_activity_steps$totalsteps, daily_activity_steps$veryactiveminutes, use = "complete.obs")
cor(daily_activity_steps$totalsteps, daily_activity_steps$fairlyactiveminutes, use = "complete.obs")
cor(daily_activity_steps$totalsteps, daily_activity_steps$lightlyactiveminutes, use = "complete.obs")
cor(daily_activity_steps$totalsteps, daily_activity_steps$sedentaryminutes, use = "complete.obs")

# Correlation between total steps and calories burned
cor_steps_calories <- cor(daily_activity_steps$totalsteps, daily_activity_steps$calories, use = "complete.obs")
print(cor_steps_calories)

# Correlation between very active minutes and calories burned
cor_very_active_calories <- cor(daily_activity_steps$veryactiveminutes, daily_activity_steps$calories, use = "complete.obs")
print(cor_very_active_calories)

# Correlation between fairly active minutes and calories burned
cor_fairly_active_calories <- cor(daily_activity_steps$fairlyactiveminutes, daily_activity_steps$calories, use = "complete.obs")
print(cor_fairly_active_calories)

# Correlation between lightly active minutes and calories burned
cor_lightly_active_calories <- cor(daily_activity_steps$lightlyactiveminutes, daily_activity_steps$calories, use = "complete.obs")
print(cor_lightly_active_calories)


# Multiple linear regression
regression_model <- lm(totalsteps ~ veryactiveminutes + lightlyactiveminutes + sedentaryminutes, data = daily_activity_steps)
summary(regression_model)

# what days of the week are users more active

weekday_steps <- daily_activity %>% 
  mutate(weekday = weekdays(date)) 

  weekday_steps$weekday <- ordered(weekday_steps$weekday, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

weekday_steps <- weekday_steps %>% 
  group_by(weekday) %>% 
  summarize(daily_steps = mean(totalsteps))

ggplot(weekday_steps, aes(x=weekday, y=daily_steps, fill = weekday)) +
  geom_col() +
  geom_hline(yintercept = 7500) +
  labs(title = "Total Steps Taken Per Day")
  
#days people sleep the most

weekday_sleep <- daily_activity_steps %>% 
  mutate(weekday = weekdays(date)) 
  weekday_sleep$weekday <- ordered(weekday_sleep$weekday, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
  
weekday_sleep <- weekday_sleep %>% 
  group_by(weekday) %>% 
  summarize(daily_sleep = mean(totalminutesasleep))

ggplot(weekday_sleep, aes(x=weekday, y=daily_sleep, fill = weekday)) +
  geom_col() +
  labs(title = "Total Minutes Of Sleep Per Day")

daily_calories <- hourly_calories %>% 
  separate(date_time, into = c("date", "time"), sep = " ")

daily_calories <- daily_calories %>%
  group_by(time) %>% 
  drop_na() %>% 
  summarise(mean_total_calories = mean(calories))

ggplot(daily_calories, aes(x=time, y=mean_total_calories, fill = time)) +
  geom_col() +
  labs(title = "Average Calories Burned Per Hour")

hourly_intensities <- hourly_intensities %>% 
  separate(date_time, into = c("date", "time"), sep = " ")

hourly_intensities <- hourly_intensities %>% 
  group_by(time) %>% 
  drop_na() %>% 
  summarise(mean_hourly_intensities = mean(totalintensity))

ggplot(hourly_intensities, aes(x=time, y=mean_hourly_intensities, fill = time)) +
  geom_col() + 
  labs(title = "Average Intensities vs Time")

hourly_steps <- hourly_steps %>% 
  separate(date_time, into = c("date", "time"), sep = " ")

hourly_steps <- hourly_steps %>% 
  group_by(time) %>% 
  drop_na() %>% 
  summarize(mean_total_steps = mean(steptotal))

ggplot(hourly_steps, aes(x = time, y = mean_total_steps, fill = mean_total_steps)) + 
  geom_col() +
  labs(title = "Hourly Steps In A day") +
  scale_fill_gradient(low = "red", high = "green")+
  theme(axis.text.x = element_text(angle = 90))

# Maybe can be used for supervised learning to predict days users will use an app

daily_usage <- daily_activity_steps %>%
  group_by(id) %>%
  summarize(days_used=sum(n())) %>%
  mutate(user_type= case_when(
    days_used >= 1 & days_used <= 10 ~ "low user",
    days_used >= 11 & days_used <= 20 ~ "moderate user", 
    days_used >= 21 & days_used <= 31 ~ "high user", 
  ))

head(daily_usage)

daily_usage_percent <- daily_usage %>%
  group_by(user_type) %>%
  summarise(total = n()) %>%
  mutate(totals = sum(total)) %>%
  group_by(user_type) %>%
  summarise(total_percent = total / totals) %>%
  mutate(labels = scales::percent(total_percent))

daily_usage_percent$user_type <- factor(daily_usage_percent$user_type, levels = c("high user", "moderate user", "low user"))

head(daily_usage_percent)

daily_usage_percent %>%
  ggplot(aes(x = "",y = total_percent, fill = user_type)) +
  geom_bar(stat = "identity", width = 1)+
  coord_polar("y", start=0)+
  theme_minimal()+
  theme(axis.title.x= element_blank(),
        axis.title.y = element_blank(),
        panel.border = element_blank(), 
        panel.grid = element_blank(), 
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        plot.title = element_text(hjust = 0.5, size=14, face = "bold")) +
  geom_text(aes(label = labels),
            position = position_stack(vjust = 0.5))+
  scale_fill_manual(values = c( "#fc8d59", "#fee08b", "#d73027"),
                    labels = c("High user - 21 to 31 days",
                               "Moderate user - 11 to 20 days",
                               "Low user - 1 to 10 days"))+
  labs(title="Daily usage of smart device")