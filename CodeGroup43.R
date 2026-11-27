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

print(head(data, 5)) #To have a mini view of the data set and understand the data.
print(mean(data$Age)) #The average age of students in this survey is 19.75342
print(summary(data)) #The maximum age here is 26 and this is the only numerical data type in the data set.

print(table(data$EducationSector)) #Extra information on the number of students in each education sector- The largest number of students are studying Engineering Sciences and the lowest is Language and Cultural Studies

 
# to Create the Contingency Table
tbl <- table(
  Gender = data$Gender,
  Intent = factor(data$y, levels = c(1, 0), labels = c("Entrepreneurial Intent (1)", "No Intent (0)"))
)
addmargins(tbl) # the table shows a total of 20 female and 71 male had the intent of being an entrepreneurial while 37 female and 91 male had no entrepreneurial intent.

#the Pearson's chi-squared test 
chisq.test(tbl) #from the Pearson's chi-squared test it is observed that thep_value is 0.3196 this shows that our result is not statistically significant
