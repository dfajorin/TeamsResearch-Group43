library(readr)


data <- read_csv("data.csv")
View(data)
#Describing the data
print(data[, c("Age", "Gender", "Influenced", "y")])
#Interesting rows and columns iin our dataset, total of 5 columns and 219 rows
view(data[, c("Age", "Gender", "Influenced", "y", "StrongNeedToAchieve")])
