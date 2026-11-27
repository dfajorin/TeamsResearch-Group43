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

# Lets Calculate column-wise percentages (y in rows, Gender in columns)
counts <- table(data$y, data$Gender)
props  <- prop.table(counts, margin = 2) * 100

# We Matched colors to the levels of y ("0" and "1")
colors <- c("0" = "#E76F51", "1" = "#2A9D8F")
bar_colors <- colors[rownames(props)]

#Create an Expanded right margin so the legend fits outside the plot area
par(mar = c(5, 4.5, 4, 11), xpd = TRUE)

# Draw the 100% stacked bar chart
bp <- barplot(
  props,
  col    = bar_colors,
  border = NA,
  ylim   = c(0, 100),
  yaxt   = "n",
  main   = "Entrepreneurial Intent by Gender (India, 2019)",
  xlab   = "Gender",
  ylab   = "Percentage of Students"
)

# We added percentage labels to the Y-axis
axis(2, at = seq(0, 100, by = 20), labels = paste0(seq(0, 100, by = 20), "%"), las = 1)

# Calculated the vertical midpoints and add bold white percentage text
y_mid  <- apply(props, 2, cumsum) - (props / 2)
x_mid  <- matrix(rep(bp, each = nrow(props)), nrow = nrow(props))
labels <- sprintf("%.1f%%", props)

text(x = x_mid, y = y_mid, labels = labels, col = "white", font = 2)

# We added the legend on the right
legend(
  "topright",
  inset  = c(-0.48, 0),
  legend = c("No Intent (0)", "Entrepreneurial Intent (1)"),
  fill   = bar_colors,
  border = NA,
  bty    = "n",
  title  = "Entrepreneurial Intent (y)"
)
 
# to Create the Contingency Table
tbl <- table(
  Gender = data$Gender,
  Intent = factor(data$y, levels = c(1, 0), labels = c("Entrepreneurial Intent (1)", "No Intent (0)"))
)
addmargins(tbl) # the table shows a total of 20 female and 71 male had the intent of being an entrepreneurial while 37 female and 91 male had no entrepreneurial intent.

# Here, we are normalising the data to percentages/proportions to clearly visualise the data.
counts <- table(data$y, data$Gender)
props  <- prop.table(counts, margin = 2) * 100
#the Pearson's chi-squared test 
chisq.test(tbl) #from the Pearson's chi-squared test it is observed that thep_value is 0.3196 this shows that our result is not statistically significant
