library(readr)


data <- read_csv("data.csv")
View(data)

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

