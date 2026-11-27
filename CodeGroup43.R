library(readr)


data <- read_csv("data.csv")
View(data)
#Columns present in our dataset- 17 columns and 219 rows
colnames(data)
#Describing the data
print(data[, c("Age", "Gender", "Influenced", "y")])
#Interesting rows and columns in our dataset, total of 5 columns and 219 rows
view(data[, c("Age", "Gender", "Influenced", "y", "StrongNeedToAchieve")])
#Most Interesting rows and columns in our dataset, total of 4 columns and 219 rows
print(data[, c("Age", "Gender", "Influenced", "y")])
View(data[, c("Age", "Gender", "Influenced", "y")])
 