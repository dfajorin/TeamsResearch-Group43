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
 
# to Create the Contingency Table
tbl <- table(
  Gender = data$Gender,
  Intent = factor(data$y, levels = c(1, 0), labels = c("Entrepreneurial Intent (1)", "No Intent (0)"))
)
addmargins(tbl) # the table shows a total of 20 female and 71 male had the intent of being an entrepreneurial while 37 female and 91 male had no entrepreneurial intent.

#the Pearson's chi-squared test 
chisq.test(tbl) #from the Pearson's chi-squared test it is observed that thep_value is 0.3196 this shows that our result is not statistically significant
