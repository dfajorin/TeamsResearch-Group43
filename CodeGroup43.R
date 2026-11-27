library(readr)


data <- read_csv("data.csv")
View(data)

# Lets Calculate column-wise percentages (y in rows, Gender in columns)
counts <- table(data$y, data$Gender)
props  <- prop.table(counts, margin = 2) * 100