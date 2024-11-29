Bellabeat

This portfolio project is a comprehensive case study analyzing Bellabeat smart device usage data, completed as part of the Google Data Analytics course on Coursera. The primary objective is to understand user behavior, activity patterns, and sleep habits to derive actionable insights that can guide Bellabeat's marketing strategies. This analysis follows a structured approach covering data cleaning, exploratory data analysis (EDA), visualization, and statistical modeling using R. The goal is to uncover key trends in how Bellabeat users interact with their devices, ultimately providing data-driven recommendations to support the company’s growth in the wellness tech market for women.

Project Overview
Company: Bellabeat
Role: Junior Data Analyst, Marketing Analytics Team
Project Objective: To analyze smart device data and uncover consumer usage trends for Bellabeat’s products, providing strategic marketing recommendations aimed at driving engagement and growth.

Scenario 

I am a junior data analyst working on the marketing analyst team at Bellabeat, a high-tech manufacturer of health-focused products for women. Bellabeat is a successful small company, but they have the potential to become a larger player in the global sma device market. Urška Sršen, cofounder and Chief Creative officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. I have been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their sma devices. The insights you discover will then help guide marketing strategy for the company. I will present your analysis to the Bellabeat executive team along with your high-level recommendations for Bellabeat’s marketing strategy.

Introduction to Bellabeat

Bellabeat, a wellness tech company focused on women, offers a range of smart products (e.g., Leaf, Time, Spring, and Bellabeat app) that track various health metrics. Bellabeat aims to strengthen its position in the smart device market by understanding user engagement patterns and aligning its marketing strategy to resonate with its target audience.

Characters and products
Stakeholder

Founded by Urška Sršen (an artist and designer) and Sando Mur (a mathematician), Bellabeat’s branding is rooted in combining artistic, wearable designs with health technology. This unique positioning makes Bellabeat’s offerings not just functional but also aesthetic and lifestyle-oriented.

Current Marketing Channels:
Bellabeat already has a comprehensive digital marketing strategy, investing year-round in Google Search, social media (Facebook, Instagram, Twitter), and YouTube. This focus on digital platforms suggests the company is targeting an audience that is already tech-savvy and engaged in wellness trends.
Traditional advertising (billboards, TV, radio) has also been used, but Bellabeat’s emphasis is on digital engagement, which aligns well with the data-driven insights that a smart device study could provide.

Bellabeat Products and Potential Insights
Bellabeat App:
Central to Bellabeat’s product ecosystem, the app provides health data insights and connects with all Bellabeat devices, collecting data on activity, sleep, stress, hydration, and mindfulness.

Device Overview and Targeted Insights:
Leaf (Wearable Tracker):
A versatile wellness tracker that can be worn as a bracelet, necklace, or clip. It focuses on tracking activity, sleep, and stress, which are key data points for understanding user wellness behaviors.

Time (Wellness Watch):
Combines traditional watch design with smart technology to track activity, sleep, and stress. It has a potential appeal to users seeking a visually appealing wellness device that’s also functional.

Spring (Smart Water Bottle):
Tracks daily water intake to help users maintain optimal hydration levels. Hydration tracking is a distinct feature that sets Bellabeat apart from other fitness-tracking companies.

Bellabeat Membership:
A subscription program providing 24/7 personalized guidance on wellness, including nutrition, sleep, health, and mindfulness.

ASK Phase
 The aim of this capstone project is to analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices.

These questions will guide my  analysis: 
1. What are some trends in smart device usage? 
2. How could these trends apply to Bellabeat customers? 
3. How could these trends help in uence Bellabeat marketing strategy?

Prepare 

Dataset Used : The fitbit fitness tracker dataset will be used for this case study. This dataset is stored in Kaggle and was made available through Mobius.

 Accessibility and privacy of data:

The dataset is open-source and licensed under the CC0 Public Domain license. This means the owner has waived all rights, allowing anyone to freely copy, modify, distribute, and use the data for any purpose, including commercial use, without needing permission.

Information about the dataset

The dataset was generated by a survey conducted via Amazon Mechanical Turk from 03.12.2016 to 05.12.2016. Thirty Fitbit users consented to share minute-level data on physical activity, heart rate, and sleep over a 31-day period. Variations in data reflect differences in Fitbit tracker types and individual tracking habits/preferences

Organiazation Of Data

The dataset comprises 18 CSV files: 15 in long format and 3 in wide format. It includes diverse data on activity metrics, calories, sleep, METs (Metabolic Equivalent of Tasks), heart rate, and steps, tracked at various intervals (seconds, minutes, hours, and days). Some data frames will be excluded from the analysis because they are subsets of more complete data frames, are minute-level outputs, or have sample sizes too small for reliable insights. Each file represents different types of Fitbit-tracked data, with each user assigned a unique ID and multiple rows per time-tracked data point.

Data Limitations:

Lack of Metadata: Additional contextual information, such as location, lifestyle factors, weather conditions, temperature, and humidity, is missing. This data could offer valuable context to enhance the insights derived from the dataset.

Missing Demographic Information: Key demographic data, such as gender and age, are not included. This absence is particularly limiting as Bellabeat designs products specifically for women. Without demographic details, insights may overlook physiological and activity pattern differences across groups. However, we recognize this data is likely excluded for privacy reasons.

Small Sample Size: With only thirty users, the dataset is limited for analysis involving multiple variables. Health and lifestyle data vary widely, and the insights derived may not represent the broader population.

Short Data Collection Period: The dataset covers only 31 days, which restricts its utility for high-level recommendations. Seasonal trends significantly influence activity and lifestyle choices, such as differences in exercise routines between summer and winter.

Process 

I chose to use R for my analysis due to its accessibility, ability to handle the dataset size effectively, and robust data visualization capabilities. R allows for seamless data processing, analysis, and visualization, making it ideal for presenting clear results and actionable recommendations to stakeholders.

I selected and installed several R packages to support my analysis, and I loaded them to access their specific functions for data cleaning, processing, and visualization. The packages used include:
tidyverse: For data manipulation and visualization.
here: To manage file paths for easy file access.
janitor: To clean and organize data efficiently.
lubridate: For handling and formatting date and time data.
ggplot2: For creating data visualizations.
skimr: To quickly summarize and explore the data.
ggpubr: To enhance ggplot2, making it easier to create publication-ready plots.
By using these packages, I was able to streamline data processing and generate insightful visualizations for stakeholder presentations.


daily_activity <- read_csv("dailyActivity_merged.csv")
daily_steps <- read_csv("dailySteps_merged.csv")
hourly_calories <- read_csv("hourlyCalories_merged.csv")
hourly_intensities <- read_csv("hourlyIntensities_merged.csv")
sleep_day <- read_csv("sleepDay_merged.csv")
hourly_steps <- read_csv("hourlySteps_merged.csv")


Dataset Name
Description


Dataset Name Daily Activity
dailyActivity_merged.csv
Description Contains daily summaries of physical activity, including total steps, active minutes (light, moderate, vigorous), calories burned, and sedentary minutes.

Dataset Name Daily Steps
dailySteps_merged.csv
Description Provides daily step counts for each user, focusing specifically on total steps per day. A subset of the daily activity data.

Dataset Name Hourly Calories
hourlyCalories_merged.csv
Description Tracks calories burned hourly for each user, giving a detailed view of calorie expenditure throughout the day.

Dataset Name Hourly Intensities
hourlyIntensities_merged.csv
Description Contains hourly data on activity intensity levels, showing time spent in light, moderate, and vigorous activities each hour.

Dataset Name Sleep Day
sleepDay_merged.csv
Description Summarizes daily sleep data for users, including total sleep duration and time spent in different sleep stages.

Dataset NameHourly Steps
hourlySteps_merged.csv
Description Records hourly step counts, allowing analysis of users' activity patterns throughout each day and identifying peak movement times.

View(daily_activity)
View(daily_steps)
View(hourly_calories)
View(hourly_intensities)
View(sleep_day)
View(hourly_steps)

Preview the dataset

By using the `View()` function on each dataset (e.g., `View(daily_activity)`), I opened each dataset in RStudio’s data viewer. This allowed me to examine the data in a spreadsheet-like format, which helped me:

1. Get Familiar with Each Dataset: I was able to quickly understand what kind of information each dataset contained and see how the data was structured.
2. Spot Any Immediate Issues: This view made it easier to identify any missing values, unusual entries, or potential outliers at a glance.
3. Verify Column Names and Data Types: I checked that column names matched the descriptions and that data types aligned with what I expected for each variable.

Using `View()` was helpful for getting a clear overview of the datasets right at the start, which prepared me for the next steps in cleaning and analyzing the data.

str(daily_activity)
str(daily_steps)
str(hourly_calories)
str(hourly_intensities)
str(sleep_day)
str(hourly_steps)

The `str()` function provides a compact summary of the structure of an R object, such as a data frame. It is useful for understanding the data types, column names, and dimensions of your dataset. 
str(daily_activity)
tibble [940 × 15] (S3: tbl_df/tbl/data.frame)
 $ id                      : num [1:940] 1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...
 $ date                    : Date[1:940], format: "2016-04-12" "2016-04-13" "2016-04-14" ...
 $ totalsteps              : num [1:940] 13162 10735 10460 9762 12669 ...
 $ totaldistance           : num [1:940] 8.5 6.97 6.74 6.28 8.16 ...
 $ trackerdistance         : num [1:940] 8.5 6.97 6.74 6.28 8.16 ...
 $ loggedactivitiesdistance: num [1:940] 0 0 0 0 0 0 0 0 0 0 ...
 $ veryactivedistance      : num [1:940] 1.88 1.57 2.44 2.14 2.71 ...
 $ moderatelyactivedistance: num [1:940] 0.55 0.69 0.4 1.26 0.41 ...
 $ lightactivedistance     : num [1:940] 6.06 4.71 3.91 2.83 5.04 ...
 $ sedentaryactivedistance : num [1:940] 0 0 0 0 0 0 0 0 0 0 ...
 $ veryactiveminutes       : num [1:940] 25 21 30 29 36 38 42 50 28 19 ...
 $ fairlyactiveminutes     : num [1:940] 13 19 11 34 10 20 16 31 12 8 ...
 $ lightlyactiveminutes    : num [1:940] 328 217 181 209 221 164 233 264 205 211 ...
 $ sedentaryminutes        : num [1:940] 728 776 1218 726 773 ...
 $ calories                : num [1:940] 1985 1797 1776 1745 1863 ...
 
> str(daily_steps)
tibble [940 × 3] (S3: tbl_df/tbl/data.frame)
 $ id       : num [1:940] 1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...
 $ date     : Date[1:940], format: "2016-04-12" "2016-04-13" "2016-04-14" ...
 $ steptotal: num [1:940] 13162 10735 10460 9762 12669 ...
 
> str(hourly_calories)
tibble [22,099 × 3] (S3: tbl_df/tbl/data.frame)
 $ id       : num [1:22099] 1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...
 $ date_time: POSIXct[1:22099], format: "2016-04-12 00:00:00" "2016-04-12 01:00:00" "2016-04-12 02:00:00" ...
 $ calories : num [1:22099] 81 61 59 47 48 48 48 47 68 141 ...
> 
> str(hourly_intensities)
tibble [23 × 2] (S3: tbl_df/tbl/data.frame)
 $ time                   : chr [1:23] "01:00:00" "02:00:00" "03:00:00" "04:00:00" ...
 $ mean_hourly_intensities: num [1:23] 1.419 1.044 0.444 0.633 4.951 ...
> 
> str(sleep_day)
tibble [410 × 5] (S3: tbl_df/tbl/data.frame)
 $ id                : num [1:410] 1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...
 $ date              : POSIXct[1:410], format: "2016-04-12" "2016-04-13" "2016-04-15" ...
 $ totalsleeprecords : num [1:410] 1 2 1 2 1 1 1 1 1 1 ...
 $ totalminutesasleep: num [1:410] 327 384 412 340 700 304 360 325 361 430 ...
 $ totaltimeinbed    : num [1:410] 346 407 442 367 712 320 377 364 384 449 ...
> 
> str(hourly_steps)
tibble [23 × 2] (S3: tbl_df/tbl/data.frame)
 $ time            : chr [1:23] "01:00:00" "02:00:00" "03:00:00" "04:00:00" ...
 $ mean_total_steps: num [1:23] 23.1 17.11 6.43 12.7 43.87 ..

head(daily_activity)
head(daily_steps)
head(hourly_calories)
head(hourly_intensities)
head(sleep_day)
head(hourly_steps)

The head() function is used to display the first few rows (default is 6) of a dataset to get a quick overview of its structure and contents 

tail(daily_activity)
tail(daily_steps)
tail(hourly_calories)
tail(hourly_intensities)
tail(sleep_day)
tail(hourly_steps)

The tail() function displays the last few rows (default is 6) of a dataset.

Before proceeding with the cleaning process, I will check the number of unique users in each dataset to ensure data consistency and identify any discrepancies in user counts. By using the n_unique() function on the Id column in each data frame, I can verify how many unique Fitbit users are represented in each dataset. Although the sample size is relatively small (with only 30 users), I will still include the sleep dataset for practice purposes.

n_unique(daily_activity$Id)
33
n_unique(daily_steps$Id)
33
n_unique(hourly_calories$Id)
33
n_unique(hourly_intensities$Id)
33
n_unique(sleep_day$Id)
24
n_unique(hourly_steps$Id)
0

I checked the number of unique participants (`id`) in your datasets using the `n_unique()` function. The results showed:

- `daily_activity`: 33 unique participants  
- `daily_steps`: 33 unique participants  
- `hourly_calories`: 33 unique participants  
- `hourly_intensities`: 33 unique participants  
- `sleep_day`: 24 unique participants  

 Final Summary:

All datasets contain data for 33 participants, except for `sleep_day`, which has data for only 24 participants.

1. Identifying Duplicates:
   - By using “duplicated(daily_activity)” (and similarly for each dataset), I generated a logical vector that marks duplicate rows as “TRUE” and unique rows as “FALSE”. This helped me pinpoint exactly where duplicate entries existed within each dataset.

duplicated(daily_activity)
duplicated(daily_steps)
duplicated(hourly_calories)
duplicated(hourly_intensities)
duplicated(sleep_day)
duplicated(hourly_steps)

2. Counting Duplicates:
   - I then used “sum(duplicated(daily_activity))” (and for each dataset) to get the total number of duplicate rows in each dataset. This count gives me a clear idea of how much redundant data I need to address, if any.

sum(duplicated(daily_activity))
0
sum(duplicated(daily_steps))
0
sum(duplicated(hourly_calories))
0
sum(duplicated(hourly_intensities))
0
sum(duplicated(sleep_day))
0
sum(duplicated(hourly_steps))
0

Remove duplicates and drop the missing values

In this step, I removed duplicate rows and dropped any missing values from each dataset to ensure clean, reliable data for my analysis:

1. Removing Duplicates:
   - For each dataset, I used “distinct()” to keep only unique rows, eliminating any duplicate entries that could skew the results.

2. Dropping Missing Values:
   - I applied “drop_na()” to remove rows with missing values, ensuring that each dataset only contains complete records, which will simplify the analysis process.

This approach helps me start with a cleaner, more accurate dataset, reducing the risk of biases or errors in my upcoming analyses.


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

Cleaning Verification

In this step, I verified that the datasets were successfully cleaned by checking for any remaining missing values:

1. Counting Missing Values:
   - For each dataset, I used “sum(is.na(daily_activity))” (and similarly for the other datasets) to count the total number of “NA” (missing) values.
   - This step confirmed that all missing values were removed during the cleaning process, ensuring that each dataset is fully complete.

By performing this check, I can be confident that my data is free of gaps, allowing me to proceed with analysis without concerns about missing information affecting the results.

sum(is.na(daily_activity))
sum(is.na(daily_steps))
sum(is.na(hourly_calories))
sum(is.na(hourly_intensities))
sum(is.na(sleep_day))

> sum(is.na(daily_activity))
[1] 0
> sum(is.na(daily_steps))
[1] 0
> sum(is.na(hourly_calories))
[1] 0
> sum(is.na(hourly_intensities))
[1] 0
> sum(is.na(sleep_day))
[1] 0
>
> In this step, I converted date and time columns in each dataset to appropriate date and time formats, making the data easier to work with for time-based analysis:

1. Converting Dates:
   - I used “as_date()” to format `ActivityDate` in “daily_activity” and “ActivityDay” in “daily_steps” to a standard date format (`%m/%d/%Y`). This allows for easier daily comparisons and aggregations.

2. Converting Date-Time Values:
   - For datasets with more granular time data (“hourly_calories”, “hourly_intensities”, “sleep_day”, and “hourly_steps”), I applied “as.POSIXct()” to convert “:ActivityHour” and “SleepDay” into a date-time format (“%m/%d/%Y %I:%M:%S %p”). This standardization includes the timezone setting (“Sys.timezone()”), ensuring accurate time-based analysis across hours.

daily_activity$ActivityDate <- as_date(daily_activity$ActivityDate, format = "%m/%d/%Y")
daily_steps$ActivityDay <- as_date(daily_steps$ActivityDay, format = "%m/%d/%Y")
hourly_calories$ActivityHour <- as.POSIXct(hourly_calories$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
hourly_intensities$ActivityHour <- as.POSIXct(hourly_intensities$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
sleep_day$SleepDay <- as.POSIXct(sleep_day$SleepDay, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))
hourly_steps$ActivityHour <- as.POSIXct(hourly_steps$ActivityHour, format = "%m/%d/%Y %I:%M:%S %p", tz=(Sys.timezone()))

In this step, I standardized the column names in each dataset by converting them to lowercase for consistency and readability:

1. Cleaning Column Names:
   - I used “clean_names()” on each dataset to ensure that the column names are formatted consistently (e.g., no spaces or special characters). This function also makes column names more compatible with typical analysis workflows in R.

2. “Converting to Lowercase”:
   - I then applied “rename_with(..., tolower)” to each dataset, converting all column names to lowercase. This helps avoid potential issues with case sensitivity when referencing columns across different datasets.

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

In this step, I renamed specific columns across the datasets to standardize naming conventions, making it easier to merge or compare data later:

1. Checking Column Names:
   - I used `colnames()` to view the existing column names in each dataset, which allowed me to identify columns needing standardization.

2. Renaming Key Columns:
   - I used “rename()” to standardize important columns related to dates and times:
     - In “daily_activity” and “daily_steps”, I renamed “activitydate” and “activityday” to `date` to unify daily date columns across datasets.
     - In “hourly_calories”, “hourly_intensities”, and “hourly_steps”, I renamed “activityhour” to “date_time”, ensuring consistency in the date-time format for hourly data.
     - In “sleep_day”, I renamed “sleepday” to “date” to align it with the daily date format used in other datasets.

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

# merging our daily_activity and sleep_day datasets together

In this step, I merged the “daily_activity” and “sleep_day” datasets to create a new, combined dataset, `daily_activity_steps`, which includes both activity and sleep data for each user:

1. Merging Datasets:
   - I used the “merge()” function to combine “daily_activity” and “sleep_day” based on two common columns: “id” (user identifier) and “date”. These columns ensure that data from both datasets aligns correctly by user and by day.

2. Creating a Comprehensive Dataset:
   - This merged dataset, “daily_activity_steps”, includes both daily activity metrics (e.g., steps, calories) and sleep data for each user on each date. This combination allows for a more holistic view of user behavior, enabling analysis of how activity levels relate to sleep patterns.

daily_activity_steps <- merge(daily_activity, sleep_day, by = c("id", "date"))

 5. Fourth and Fifth Phases: ANALYZE and SHARE

In these phases, I’ll dive into the FitBit data to identify user trends and patterns, focusing on insights that could support Bellabeat’s marketing strategy.

Data Summarization and Exploration
I’ll start by summarizing and exploring each dataset to uncover initial trends and understand user behavior patterns. This analysis will help lay the foundation for strategic recommendations tailored to Bellabeat’s target audience.

In this step, I used `summary()` on specific columns within the `daily_activity` dataset to get a quick statistical overview of users' activity levels:

1. Selecting Key Activity Columns:
   - I used “select()” to focus on “totalsteps”, “veryactiveminutes”, “fairlyactiveminutes”, “lightlyactiveminutes”, and “sedentaryminutes”, which capture different intensities of daily activity and sedentary behavior.

2. Generating Summary Statistics:
   - Applying “summary()’ provides basic descriptive statistics (like minimum, maximum, mean, and quartiles) for each selected column. This gives me an immediate understanding of typical activity levels, such as average steps taken, average time spent in different activity levels, and how sedentary users tend to be.

daily_activity %>% 
  select(totalsteps, 
         veryactiveminutes,
         fairlyactiveminutes,
         lightlyactiveminutes,
         sedentaryminutes) %>% 
  summary()

Grouping and Summing Steps:

group_by(id, veryactiveminutes, fairlyactiveminutes, lightlyactiveminutes, sedentaryminutes): You grouped the daily_activity_steps dataset by id and the different activity intensity columns (veryactiveminutes, fairlyactiveminutes, lightlyactiveminutes, and sedentaryminutes). This allows you to calculate total steps per user, taking into account each user’s breakdown of activity intensity.
summarise(total_steps = sum(totalsteps)): Within each group, you calculated the sum of totalsteps, giving the total steps for each user and activity profile.

Arranging by Total Steps:
arrange(desc(total_steps)): You sorted the summarized data in descending order of total_steps, so users with the highest total steps appear first. This lets you quickly identify the most active users.

Discoveries:
From your summary analysis, i observed several key trends:

Average Steps:
The average total steps per day is 7,638, indicating the general daily activity level of users.

Maximum Steps:
The maximum steps recorded in a single day is 36,019, showing the highest level of activity for any user.

Sedentary Behavior:
Most participants are sedentary: The majority of users spend a significant amount of time in sedentary minutes, which could be an area for Bellabeat to target in its wellness campaigns.
The maximum sedentary time recorded is 1,440 minutes, equivalent to a full day (24 hours), indicating at least one instance where a user was entirely inactive for a day.

Very Active Minutes:
The maximum number of very active minutes recorded in a day is 210, which reflects the upper limit of vigorous activity among users.
The average very active minutes per day is 21.16, suggesting most users have low-to-moderate intense activity.

Sedentary Minutes:
The average sedentary minutes per day is 991.2, reinforcing the sedentary trend among users.

Sleep Duration:
Average sleep duration is approximately 418.4 minutes (about 7 hours), suggesting most users are getting adequate sleep, but not optimal.
The minimum sleep recorded is 58 minutes, which is insufficient, highlighting possible sleep challenges for some users.
The maximum sleep recorded is 796 minutes (about 13 hours), showing variation in sleep needs or habits.

Calories Burned:
Average calories burned per hour is around 97. This metric provides context on general user activity levels and energy expenditure, which could be explored further to determine if it meets health recommendations.

Insights for Bellabeat’s Marketing Strategy:

These insights reveal key user behavior patterns that Bellabeat could target in its marketing strategy:

Promoting Activity: Since many users are sedentary, Bellabeat could emphasize content encouraging more active lifestyles, possibly with reminders or challenges through the Bellabeat app.
Encouraging Intense Activity: With low average very active minutes, Bellabeat could promote features that encourage users to add more high-intensity activity to their routines.
Highlighting Sleep Health: With some users having insufficient sleep, Bellabeat could introduce resources or campaigns on the importance of quality sleep, aligning with its wellness mission.
Targeting Caloric Awareness: Bellabeat could focus on educating users about caloric expenditure and how small changes in daily habits can improve their overall wellness.

This analysis provides a foundation for Bellabeat’s targeted wellness recommendations and engagement strategies.

Steps Taken

In this analysis, I used the ggplot2 package to create a series of scatter plots that visualize the relationships between various levels of physical activity (such as very active, fairly active, lightly active, and sedentary minutes) and the total number of steps taken in a day. The goal was to understand how these activity levels correlate with step counts. By mapping the activity minutes to both color and size, I was able to easily identify patterns and trends, which will be useful for my analysis and recommendations. These visualizations provide valuable insights into activity levels, helping inform potential marketing strategies for fitness-related products.

Here’s a summary of the observations for the "Very Active Minutes vs Total Steps" plot:

![vam vs ts](https://github.com/user-attachments/assets/00154c05-6a53-4e00-8317-c6f61d996a2b)

1. Higher Step Counts and Active Minutes: People with more total steps generally tend to have more active minutes, though this isn’t always consistent across all data points.

2. Variation in Active Minutes: Even among high step counts, there’s variability in active minutes. Some individuals with similar step counts show a wide range of active minutes, suggesting different activity intensities.

3. Concentration of Points: Most data points are clustered in the lower left corner of the plot, showing that many individuals have both low step counts and low active minutes.

Here’s a summary of the observations for the "Fairly Active Minutes vs Total Steps" plot:

1. Positive Relationship: As total steps increase, fairly active minutes also tend to increase, suggesting that people with higher step counts often spend more time being fairly active.

2. Variation in Activity: There is a range of fairly active minutes even at similar step counts. For instance, individuals with around 10,000 steps show different levels of fairly active minutes, indicating varying activity intensity.

3. Concentration of Points: Most data points are clustered toward the lower left corner, where total steps and fairly active minutes are both low, suggesting many individuals have both low step counts and low fairly active minutes.

4. Higher Step Counts: At higher step counts (above 15,000), fairly active minutes continue to vary but generally stay under 150 minutes, showing that high step counts don’t necessarily mean consistently high fairly active minutes.

This plot shows a general trend that higher step counts are often associated with more fairly active minutes, but individual variations lead to a wide range of active minutes at similar step levels.



