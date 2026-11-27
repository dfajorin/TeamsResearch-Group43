library(readr)


data <- read_csv("data.csv")
View(data)

# Here, we are normalising the data to percentages/proportions to clearly visualise the data.
counts <- table(data$y, data$Gender)
props  <- prop.table(counts, margin = 2) * 100