# =============================================
# MOTIVATIONAL EXAMPLE: Exploratory Data Analysis with R
# =============================================
# This script shows how to create, import, manage, and analyze data in R.
# You will learn how to work with different types of variables, import data from SPSS, and perform exploratory data analysis.

# ---------------------------------------------
# 1. Types of Variables in R ----
# ---------------------------------------------

# ---------------------------------------------
## 1.1 Qualitative Variables (Categorical Data) ----
# ---------------------------------------------

### 1.1.1 Nominal Variables (Unordered Categories) ----
# Example: Colors
nominal <- c("green", "blue", "yellow", "red", "blue")

### 1.1.2 Nominal Variables as Factors (Unordered) ----
# Example: Cities in Portugal
non_ordered <- factor(c("Porto", "Lisboa", "Braga", "Aveiro", "Coimbra"))
# Let's create a random sample of 50 cities
city <- sample(non_ordered, 50, replace = TRUE)

### 1.1.3 Ordinal Variables (Ordered Categories) ----
# Example: Satisfaction levels
ordered_levels <- c("strongly disagree", "disagree", "neutral", "agree", "strongly agree")
# Let's create a random sample of 50 satisfaction levels
satisfaction <- factor(sample(ordered_levels, 50, replace = TRUE),
                       levels = ordered_levels,
                       ordered = TRUE)

# ---------------------------------------------
## 1.2 Quantitative Variables (Numerical Data) ----
# ---------------------------------------------

### 1.2.1 Integer Variables ----
# Example: Number of weekdays worked (0 to 7)
weekdays_worked <- rbinom(50, 7, prob = 0.5)

### 1.2.2 Continuous Variables ----
# Example: Monthly salary (in euros)
salary <- rnorm(50, mean = 1200, sd = 300)
# Let's visualize the salary distribution
hist(salary, main = "Salary Distribution", xlab = "Salary (Euros)")

# ---------------------------------------------
# 2. Combine All Variables into a Dataset ----
# ---------------------------------------------
# Let's create a data frame with all the variables
data <- data.frame(color = nominal,
                   city = city,
                   satisfaction = satisfaction,
                   weekdays = weekdays_worked,
                   salary = salary)
# Let's see a summary of our dataset
summary(data)

# ---------------------------------------------
# 3. Central Tendency Measures ----
# ---------------------------------------------

## 3.1 Mode (Most frequent value) ----
# For nominal variables, use table()
color_table <- table(data$color)
# Which color appears most often?
most_frequent_color <- names(which.max(color_table))
print(paste("The most frequent color is:", most_frequent_color))

## 3.2 Median (Middle value) ----
# For ordinal variables, convert to numeric first
median(data$satisfaction) # Ups!, error because satisfaction is a factor; need to convert to numeric
median(as.numeric(data$satisfaction))

## 3.3 Mean (Average) ----
mean(data$weekdays)
print(paste("The average number of weekdays worked is:", mean(data$weekdays)))

# ---------------------------------------------
# 4. Dispersion Measures ----
# ---------------------------------------------

## 4.1 Total Range (Difference between max and min) ----
range(data$salary)

## 4.2 Interquartile Range (IQR) ----
# IQR tells us the range of the middle 50% of the data
IQR(data$salary)
# Let's visualize the salary distribution with a boxplot
boxplot(data$salary, main = "Salary Boxplot", ylab = "Salary (Euros)")

## 4.3 Variance and Standard Deviation ----
var(data$salary)
sd(data$salary)

# ---------------------------------------------
# MOTIVATIONAL NOTE:
# ---------------------------------------------
# You just created and analyzed your first dataset in R!
# With these basics, you can start exploring real-world data.


# ---------------------------------------------
# 5. Importing Data from SPSS ----
# ---------------------------------------------
# If needed: install.packages("haven")
library(haven)
# Import data from an SPSS file
data_spss <- read_sav("Base AQUES.sav")
# Let's see the first few rows of the data
head(data_spss)
# Let's see a summary of the data
summary(data_spss)
# Let's use the psych package for more detailed description
library(psych)
describe(data_spss)

# ---------------------------------------------
# 6. Data Management ----
# ---------------------------------------------

## 6.1 Defining Variables ----
# Let's check the class and names of the variables
class(data_spss)
names(data_spss)
# Let's see the first few rows of the data
head(data_spss)

## 6.2 Recode Variables ----
# Example: Recode sex variable to have meaningful labels
data_spss$sex <- factor(data_spss$sex, levels = c(0,1), labels = c("male", "female"))
# Example: Recode country variable to have meaningful labels
data_spss$country <- factor(data_spss$country, levels = c(1,2), labels = c("Australia", "elsewhere"))
# Let's see the distribution of country and sex
table(data_spss$country, data_spss$sex)
# Let's visualize the distribution
plot(data_spss$country, data_spss$sex)

## 6.3 Convert Variables to Factors ----
# List the names of the unordered factors in the dataset
varnames <- c("parsport", "enstat", "firstb", "pastsmok", "marital", "expect", "employ")
# Convert these variables to factors
data_spss[,varnames] <- lapply(data_spss[,varnames], as_factor)
# Let's order the parsport variable
data_spss$parsport <- factor(data_spss$parsport, ordered=TRUE)

## 6.4 Compute New Variables ----
# Example: Compute BMI (Body Mass Index)
data_spss$bmi <- data_spss$weight / (data_spss$height/100)^2

## 6.5 Recode Variables into Categories ----
# Example: Recode BMI into categories
data_spss$bmi_cat <- ifelse(data_spss$bmi < 18.5, "underweight",
                            ifelse(data_spss$bmi >= 18.5 & data_spss$bmi < 25, "normal weight",
                                   ifelse(data_spss$bmi >= 25 & data_spss$bmi < 30, "overweight", "obesity")))
# Convert bmi_cat to an ordered factor
data_spss$bmi_cat <- factor(data_spss$bmi_cat, levels = c("underweight", "normal weight", "overweight", "obesity"), ordered=TRUE)
# Let's see a summary of the data
summary(data_spss)


# ---------------------------------------------
# 7. Exploratory Data Analysis (EDA) ----
# ---------------------------------------------
# Read the following post for some EDA packages and techniques
browseURL("https://www.r-bloggers.com/2024/10/top-10-r-packages-for-exploratory-data-analysis-eda-bookmark-this/")
# If you do not want to used the packages mentioned there, you can use other packages you know of. 
# Example using DataExplorer package
# If needed: install.packages("DataExplorer")
library(DataExplorer)
# Let's create an EDA report
create_report(data_spss)

# ---------------------------------------------
# MOTIVATIONAL NOTE:
# ---------------------------------------------
# You just imported, managed, and analyzed a real dataset in R!
# With these basics, you can start exploring and understanding your data.
# Keep practicing and you'll become an R expert!
