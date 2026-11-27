library(readr)


data <- read_csv("data.csv")
View(data)

print(head(data, 5)) #To have a mini view of the data set and understand the data.
print(mean(data$Age)) #The average age of students in this survey is 19.75342
print(summary(data)) #The maximum age here is 26 and this is the only numerical data type in the dataset.

